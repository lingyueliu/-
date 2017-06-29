package com.efilebee.index;

import java.io.IOException;

//import org.apache.lucene.analysis.Analyzer;
//import org.apache.lucene.analysis.standard.StandardAnalyzer;
//import org.apache.lucene.document.Document;
//import org.apache.lucene.document.Field;
//import org.apache.lucene.index.IndexWriter;
//import org.apache.lucene.index.Term;
//import org.apache.lucene.store.Directory;
//import org.apache.lucene.store.FSDirectory;

import com.efilebee.db.file.FileDao;
import com.efilebee.db.File;
//import com.efilebee.util.Common;
//import com.efilebee.util.Constant;

public class UpdtIndex {
	
	private FileDao fileOpr;

	public FileDao getFileOpr() {
		return fileOpr;
	}

	public void setFileOpr(FileDao fileOpr) {
		this.fileOpr = fileOpr;
	}
	
	public void updt(String[] ids, String role) throws IOException {
		
		//System.out.println("Updt Index");
//		String index_dir = Constant.getRealPath("index");	
//		Directory dir = FSDirectory.getDirectory(index_dir);
		
		
//		Analyzer anlyr = new StandardAnalyzer();
//		//true to create the index or overwrite the existing one
//		//false to append to the existing index
//		IndexWriter wtr = new IndexWriter(dir,anlyr,false,IndexWriter.MaxFieldLength.LIMITED);	
		
		
		for(String id: ids) {
			//System.out.println(id);
			
			File file = fileOpr.seltId(Integer.valueOf(id));
			file.setRole(role);
			fileOpr.updtId(file);
			
/*			 
			// * In either case, documents are added with addDocument and removed with deleteDocuments(Term) or deleteDocuments(Query).
			// * A document can be updated with updateDocument (which just deletes and then adds the entire document). 
			// * When finished adding, deleting and updating documents, close should be called.
			
			Document document = new Document();
			
			document.add(new Field("ID", "" + file.getId(), Field.Store.YES, Field.Index.ANALYZED));
			document.add(new Field("TYPE", Common.ExtractFileType(file.getType()), Field.Store.YES, Field.Index.ANALYZED));
			document.add(new Field("NAME", Common.ExtractFileName(file.getName()), Field.Store.YES, Field.Index.ANALYZED));
			//document.add(new Field("CONTENT", tika.parseToString(zf.getInputStream(ze)), Field.Store.YES, Field.Index.ANALYZED));
			document.add(new Field("ROLE", role, Field.Store.YES, Field.Index.ANALYZED));

			wtr.updateDocument(new Term("ID", id), document);
*/			
			
		}
		
//		wtr.optimize();
//		wtr.close();
//		dir.close();		
		
		
	}
}
