package com.efilebee.index;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import com.efilebee.db.file.FileDao;
import com.efilebee.util.Constant;

public class DeltIndex {
	
	private FileDao fileOpr;

	public FileDao getFileOpr() {
		return fileOpr;
	}

	public void setFileOpr(FileDao fileOpr) {
		this.fileOpr = fileOpr;
	}
	
	
	public void delt(String[] ids) throws IOException {
		//System.out.println("Delt Index");
		String index_dir = Constant.getRealPath("index");	
		
		//Directory dir = FSDirectory.getDirectory(index_dir);//for 2.4
		Directory dir = FSDirectory.open(new File(index_dir));
		
		IndexReader rdr = IndexReader.open(dir, false);
		
		for(String id: ids) {
			//System.out.println(id);
			rdr.deleteDocuments(new Term("ID", id));
			fileOpr.deltId(Integer.valueOf(id));		
		}
		
		rdr.close();
		dir.close();
		
	}
}
