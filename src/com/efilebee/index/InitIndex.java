package com.efilebee.index;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.efilebee.db.file.FileDao;
import com.efilebee.util.Constant;

public class InitIndex {
	private FileDao fileOpr;

	public FileDao getFileOpr() {
		return fileOpr;
	}

	public void setFileOpr(FileDao fileOpr) {
		this.fileOpr = fileOpr;
	}
	
	
	
	public void init() throws IOException {
		//System.out.println("Init Index");
		String index_dir = Constant.getRealPath("index");
		
		//Directory dir = FSDirectory.getDirectory(index_dir);//for 2.4
		Directory dir = FSDirectory.open(new File(index_dir));
		
		//Analyzer anlyr = new StandardAnalyzer();//for 2.4
		Analyzer anlyr = new StandardAnalyzer(Version.LUCENE_30);

		
		//true to create the index or overwrite the existing one
		//false to append to the existing index
		IndexWriter wtr = new IndexWriter(dir,anlyr,true,IndexWriter.MaxFieldLength.LIMITED);
		Document doc = new Document();
		
		wtr.addDocument(doc);
		wtr.optimize();
		wtr.close();
		
		fileOpr.delt();	
	}
}
