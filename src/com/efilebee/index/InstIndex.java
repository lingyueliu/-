package com.efilebee.index;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.lang.management.ThreadMXBean;
import java.util.Collections;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.TermVector;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.apache.tika.Tika;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.sax.BodyContentHandler;

import com.efilebee.db.file.FileDao;
import com.efilebee.util.Common;
import com.efilebee.util.Constant;


public class InstIndex {
	static private class FileElement extends com.efilebee.db.File{}
	
	private FileDao fileOpr;

	public FileDao getFileOpr() {
		return fileOpr;
	}

	public void setFileOpr(FileDao fileOpr) {
		this.fileOpr = fileOpr;
	}
	
	
	public void inst() throws IOException {
		//System.out.println("Inst Index");
		String index_dir = Constant.getRealPath("index");
		
		Directory dir = FSDirectory.open(new File(index_dir));
		
		String file_dir_path = Constant.getRealPath("file");
		File[] files = new File(file_dir_path).listFiles();
		
		Tika tika = new Tika();		
		Metadata m = new Metadata();
		
	    AutoDetectParser parser = new AutoDetectParser();
	    Metadata metadata = new Metadata();
	    
		Analyzer anlyr = new StandardAnalyzer(Version.LUCENE_30);
		
		//true to create the index or overwrite the existing one
		//false to append to the existing index
		IndexWriter wtr = new IndexWriter(dir,anlyr,false,IndexWriter.MaxFieldLength.LIMITED);	
		
		long current_last_modified = fileOpr.seltMaxLM();
		String file_path;
		
		try {
			
			for (int i = 0; i < files.length; i++) {
				//System.out.println(files[i].lastModified());
				//System.out.println(current_last_modified);
				
				if(files[i].lastModified() > current_last_modified) {
				/***************************ZIP***************************/						
					
					file_path = files[i].getAbsolutePath();
					
					tika.parse(new FileInputStream(file_path), m);
					//System.out.println(m.get(Metadata.CONTENT_TYPE));
					
					
					if(Common.ExtractFileType(m.get(Metadata.CONTENT_TYPE)).equals("zip")) {
						
						ZipFile zf = new ZipFile(new File(file_path));
						List<ZipEntry> list = (List<ZipEntry>)Collections.list(zf.entries());
						
						for(ZipEntry ze: list) {
							if(ze.isDirectory())
								continue;
																	
						    BodyContentHandler handler = new BodyContentHandler(-1);
					        parser.parse(zf.getInputStream(ze), handler, metadata, new ParseContext());

					        					     
							//System.out.println("******************** ENTRY ********************");
							
							//System.out.println(ze.getName());
							
							FileElement file_element = new FileElement();
							file_element.setName(ze.getName());
							file_element.setPath(files[i].getAbsolutePath());
							file_element.setType(metadata.get(Metadata.CONTENT_TYPE));
							file_element.setRemark(metadata.get(Metadata.TITLE));
							file_element.setLastModified(Common.Date2Long(Common.TikaDate2Date(metadata.get(Metadata.LAST_MODIFIED))));
							file_element.setRole("");
							
							int id = fileOpr.inst(file_element).getId();
							
							Document document = new Document();						
							document.add(new Field("ID", "" + id, Field.Store.YES, Field.Index.ANALYZED));//
							document.add(new Field("NAME", Common.ExtractFileName(ze.getName()), Field.Store.YES, Field.Index.ANALYZED));
							document.add(new Field("TYPE", Common.ExtractFileType(metadata.get(Metadata.CONTENT_TYPE)), Field.Store.YES, Field.Index.ANALYZED));
							document.add(new Field("CONTENT", handler.toString(), Field.Store.YES, Field.Index.ANALYZED));
							document.add(new Field("PATH", files[i].getAbsolutePath(), Field.Store.YES, Field.Index.NO));

							
							wtr.addDocument(document);	
		
						}						
						
						
						
					} else {
					/***************************NOT ZIP***************************/		

						FileElement file_element = new FileElement();
						file_element.setName(files[i].getName());
						file_element.setType(m.get(Metadata.CONTENT_TYPE));
						file_element.setPath(files[i].getAbsolutePath());
						file_element.setRemark(m.get(Metadata.TITLE));
						file_element.setLastModified(Common.Date2Long(Common.TikaDate2Date(m.get(Metadata.LAST_MODIFIED))));
						file_element.setRole("");
						
						int id = fileOpr.inst(file_element).getId();
						
						Document document = new Document();
						
						document.add(new Field("ID", "" + id, Field.Store.YES, Field.Index.ANALYZED));//
						document.add(new Field("TYPE", Common.ExtractFileType(m.get(Metadata.CONTENT_TYPE)), Field.Store.YES, Field.Index.ANALYZED));
						document.add(new Field("NAME", Common.ExtractFileName(files[i].getName()), Field.Store.YES, Field.Index.ANALYZED));
						//document.add(new Field("CONTENT", tika.parseToString(files[i]), Field.Store.YES, Field.Index.ANALYZED));//for 2.4
						
						//Note that any fields that will be highlighted must be indexed with TermVector.WITH_POSITIONS_OFFSETS
						document.add(new Field("CONTENT", tika.parseToString(files[i]), Field.Store.YES, Field.Index.ANALYZED, TermVector.WITH_POSITIONS_OFFSETS));
						
						document.add(new Field("PATH", files[i].getAbsolutePath(), Field.Store.YES, Field.Index.NO));
						//document.add(new Field("ROLE", "", Field.Store.YES, Field.Index.ANALYZED));
						wtr.addDocument(document);						
						
					}
					
					
				}
				
			}
			
			wtr.optimize();
			wtr.close();
			dir.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
