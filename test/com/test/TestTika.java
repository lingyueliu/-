package com.test;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.zip.GZIPInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.apache.commons.compress.archivers.tar.TarArchiveInputStream;
import org.apache.tika.Tika;
import org.apache.tika.metadata.Metadata;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;

import com.efilebee.util.Common;
import com.efilebee.util.Constant;

public class TestTika {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		//System.out.println("in before class");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		//System.out.println("in after class");
	}

	@Before
	public void setUp() throws Exception {
		//System.out.println("in before");
	}

	@After
	public void tearDown() throws Exception {
		//System.out.println("in after");
	}
	
	@Test
	@Ignore
	public void test() {
		//System.out.println("in test");
	}
	
	//C:\apache-tomcat-6.0.33\webapps\efilebee\filedir\test.doc
	
	
	@Test
	//@Ignore	
	public void testTika() throws Exception {
		Tika tika = new Tika();
		String tmpPath = "C:\\apache-tomcat-6.0.33\\webapps\\efilebee\\filedir\\test.doc";
		Metadata tmpM = new Metadata();
		tika.parse(new FileInputStream(tmpPath), tmpM);
		//System.out.println(tmpM.get(Metadata.CONTENT_TYPE));
		
		
		String zipPath = Constant.filedir+"test.zip";
		
		Metadata m = new Metadata();
		tika.parse(new FileInputStream(zipPath), m);
		//System.out.println(m.get(Metadata.CONTENT_TYPE));
		
		//System.out.println(zipPath);
		//System.out.println("******************** ZIP ********************");
		String zipText = tika.parseToString(new File(zipPath));
		//System.out.println(zipText);	
		
		String pdfPath = Constant.filedir+"test.pdf";
		String docPath = Constant.filedir+"test.doc";
		String docxPath = Constant.filedir+"test.docx";
		String txtPath = Constant.filedir+"test.txt";
		String rarPath = Constant.filedir+"test.rar";
		String targzPath = Constant.filedir+"20_newsgroups.tar.gz";
		

		//System.out.println("******************** PDF ********************");
		//String pdfText = tika.parseToString(new File(pdfPath));		
		////System.out.println(pdfText);
		tika.parse(new FileInputStream(pdfPath), m);
		//System.out.println(m.get(Metadata.CONTENT_TYPE));

		
		//System.out.println("******************** DOC ********************");
		//String docText = tika.parseToString(new File(docPath));
		////System.out.println(docText);
		tika.parse(new FileInputStream(docPath), m);
		//System.out.println(m.get(Metadata.CONTENT_TYPE));		
		
		//System.out.println("******************** DOCX ********************");
		//String docxText = tika.parseToString(new File(docxPath));
		////System.out.println(docxText);
		tika.parse(new FileInputStream(docxPath), m);
		//System.out.println(m.get(Metadata.CONTENT_TYPE));	
		
		//System.out.println("******************** TXT ********************");
		//String txtText = tika.parseToString(new File(txtPath));
		////System.out.println(txtText);	
		tika.parse(new FileInputStream(txtPath), m);
		//System.out.println(m.get(Metadata.CONTENT_TYPE));
		
		//System.out.println("******************** RAR ********************");
		//String rarText = tika.parseToString(new File(rarPath));
		////System.out.println(rarText);		
		tika.parse(new FileInputStream(rarPath), m);
		//System.out.println(m.get(Metadata.CONTENT_TYPE));	
		
		//System.out.println("******************** TARGZ ********************");
		//String targzText = tika.parseToString(new File(targzPath));
		////System.out.println(targzText);		
		tika.parse(new FileInputStream(targzPath), m);
		//System.out.println(m.get(Metadata.CONTENT_TYPE));	
		//System.out.println(m);
		//System.out.println(m.get(Metadata.CREATION_DATE));
		
		
		Date date_value = Common.TikaDate2Date(m.get(Metadata.CREATION_DATE));
		Long long_value = Common.Date2Long(date_value);
		//System.out.println(date_value);
		//System.out.println(Common.Date2TikaDate(date_value));
		//System.out.println(long_value);
		//System.out.println(Common.Long2Date(long_value));
		
		
		
		
		
		//System.out.println(m.get(Metadata.LAST_MODIFIED));
	}
		
	@Test
	@Ignore
	public void testTikaZipEntry() throws Exception {
		Tika tika = new Tika();
		String zipPath = Constant.filedir+"test.zip";
		
		int max = 10;
		int i = 0;
		
		ZipFile zf = new ZipFile(new File(zipPath));
		
		List<ZipEntry> list = (List<ZipEntry>)Collections.list(zf.entries());
		
		//System.out.println("******************** ZIP ********************");
		
		Metadata m = new Metadata();
		for(ZipEntry ze: list) {
			if(ze.isDirectory())
				continue;
			tika.parse(zf.getInputStream(ze), m);
			//System.out.println("******************** ENTRY ********************");
			//System.out.println(m);
			
			//System.out.println(ze.getName());
			
			////System.out.println(tika.parseToString(zf.getInputStream(ze)));
			
			//System.out.println(m.get(Metadata.LAST_MODIFIED));
			//System.out.println(m.get(Metadata.TITLE));
			//System.out.println(m.get(Metadata.FORMAT));
			//System.out.println(m.get(Metadata.AUTHOR));
			//System.out.println(m.get(Metadata.TYPE));
			//System.out.println(m.get(Metadata.CONTENT_TYPE));
			
			i++;
			if(i>max)
				break;			
		}
	}

	
	
	
	@Test
	@Ignore
	public void testTikaTargzEntry() throws Exception {
		//*.tar or *.tar.gz
		Tika tika = new Tika();
		String targzPath = Constant.filedir+"20_newsgroups.tar.gz";
		
		int max = 10;
		int i = 0;
		
		FileInputStream fileIn = null;
		BufferedInputStream bufIn = null;
		GZIPInputStream gzipIn = null;
		TarArchiveInputStream targzIn = null;
		
		try {
			fileIn = new FileInputStream(targzPath);
			bufIn = new BufferedInputStream(fileIn);
			gzipIn = new GZIPInputStream(bufIn);
			targzIn = new TarArchiveInputStream(gzipIn);

			Metadata m = new Metadata();
			
			TarArchiveEntry entry = null;
			while((entry = targzIn.getNextTarEntry()) != null) {
				if(entry.isDirectory())
					continue;
				//System.out.println(entry);
				//System.out.println(entry.getName());
				//System.out.println(entry.getSize());
				
				File file = new File(entry.getName());
				//System.out.println(file.getName());

				FileInputStream fileinputstream = new FileInputStream(file);
				tika.parse(fileinputstream, m);
				//System.out.println("******************** ENTRY ********************");
				//System.out.println(m);
				i++;
				if(i>max)
					break;
			}
			
		} finally {
			targzIn.close();
			gzipIn.close();
			bufIn.close();
			fileIn.close();
		}
		
		

	}	
		
}
