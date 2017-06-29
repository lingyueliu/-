package com.efilebee.search;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.FuzzyQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.PrefixQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
//import org.apache.lucene.search.Searcher;//for 2.4
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
//import org.apache.lucene.search.TopDocCollector;//for 2.4

import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
//import org.apache.lucene.search.vectorhighlight.BaseFragmentsBuilder;
//import org.apache.lucene.search.vectorhighlight.FastVectorHighlighter;
//import org.apache.lucene.search.vectorhighlight.FieldQuery;
//import org.apache.lucene.search.vectorhighlight.FragListBuilder;
//import org.apache.lucene.search.vectorhighlight.FragmentsBuilder;
//import org.apache.lucene.search.vectorhighlight.ScoreOrderFragmentsBuilder;
//import org.apache.lucene.search.vectorhighlight.SimpleFragListBuilder;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.efilebee.db.File;
import com.efilebee.db.file.FileDao;
import com.efilebee.util.Common;
import com.efilebee.util.Constant;

public class AdvancedSearch {
	private String contIncl;
	private String contExcl;
	
	private String srchTp = "term";
	private int pgNum = 10;
	private int tpNum = 100;
	
	private String dtRng = "0";
	private String docTp = "all";
	private String role = "";
	
	private FileDao fileOpr;
	
	public FileDao getFileOpr() {
		return fileOpr;
	}
	public void setFileOpr(FileDao fileOpr) {
		this.fileOpr = fileOpr;
	}
	public String getContIncl() {
		return contIncl;
	}
	public void setContIncl(String contIncl) {
		this.contIncl = contIncl;
	}
	public String getContExcl() {
		return contExcl;
	}
	public void setContExcl(String contExcl) {
		this.contExcl = contExcl;
	}
	public String getSrchTp() {
		return srchTp;
	}
	public void setSrchTp(String srchTp) {
		this.srchTp = srchTp;
	}
	public int getPgNum() {
		return pgNum;
	}
	public void setPgNum(int pgNum) {
		this.pgNum = pgNum;
	}

	public int getTpNum() {
		return tpNum;
	}
	public void setTpNum(int tpNum) {
		this.tpNum = tpNum;
	}
	public String getDtRng() {
		return dtRng;
	}
	public void setDtRng(String dtRng) {
		this.dtRng = dtRng;
	}
	public String getDocTp() {
		return docTp;
	}
	public void setDocTp(String docTp) {
		this.docTp = docTp;
	}
	

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public AdvancedSearch() {
		super();
	}
		
	public AdvancedSearch(String contIncl, String contExcl, String srchTp,
			int pgNum, int tpNum, String dtRng, String docTp, String role) {
		super();
		this.contIncl = contIncl;
		this.contExcl = contExcl;
		this.srchTp = srchTp;
		this.pgNum = pgNum;
		this.tpNum = tpNum;
		this.dtRng = dtRng;
		this.docTp = docTp;
		this.role = role;
	}
	
	
	public Query doQuery() throws Exception {
		//Analyzer anlyr = new StandardAnalyzer();//for 2.4
		Analyzer anlyr = new StandardAnalyzer(Version.LUCENE_30);

		Query query_incl = null;
		Query query_excl = null;
		Query query = null;
		
		BooleanQuery boolean_query = new BooleanQuery();
		
		if(this.srchTp.equals("term")) {
			Term term_incl = new Term(Constant.contfld, contIncl);
			Term term_excl = new Term(Constant.contfld, contExcl);
			query_incl = new TermQuery(term_incl);
			query_excl = new TermQuery(term_excl);			
			
		} else if(this.srchTp.equals("prefix")) {
			Term term_incl = new Term(Constant.contfld, contIncl);
			Term term_excl = new Term(Constant.contfld, contExcl);
			query_incl = new PrefixQuery(term_incl);
			query_excl = new PrefixQuery(term_excl);
	
		} else if(this.srchTp.equals("wildcard")) {
			Term term_incl = new Term(Constant.contfld, contIncl);
			Term term_excl = new Term(Constant.contfld, contExcl);
			query_incl = new WildcardQuery(term_incl);
			query_excl = new WildcardQuery(term_excl);			
			
		} else if(this.srchTp.equals("fuzzy")) {
			Term term_incl = new Term(Constant.contfld, contIncl);
			Term term_excl = new Term(Constant.contfld, contExcl);
			query_incl = new FuzzyQuery(term_incl);
			query_excl = new FuzzyQuery(term_excl);			
			
		} else if(this.srchTp.equals("free")) {
			QueryParser parser = new QueryParser(Version.LUCENE_30, Constant.contfld, anlyr);
			query = parser.parse(contIncl);		
		}
		if(!"all".equals(this.docTp)) {
			Term term_tp = new Term("TYPE", this.docTp);
			TermQuery query_tp = new TermQuery(term_tp);
			boolean_query.add(query_tp, BooleanClause.Occur.MUST);
		}
		
		
		//if(query_incl != null)
		if(query_incl != null && !contIncl.equals(""))
			boolean_query.add(query_incl, BooleanClause.Occur.MUST);
		//if(query_excl != null)
		if(query_excl != null && !contExcl.equals(""))
			boolean_query.add(query_excl, BooleanClause.Occur.MUST_NOT);
		if(query != null)
			boolean_query.add(query, BooleanClause.Occur.MUST);
				
		return boolean_query;
	}
	
	public ScoreDoc[] doScore() throws Exception {
		//Searcher searcher = new IndexSearcher(Constant.getRealPath("index"));//for 2.4
		//TopDocCollector collector = new TopDocCollector(this.tpNum);//for 2.4
		Directory dir = FSDirectory.open(new java.io.File(Constant.getRealPath("index")));
		
		IndexReader reader = IndexReader.open(dir);
		IndexSearcher searcher = new IndexSearcher(reader);
		
		Query query = this.doQuery();
		//System.out.println(query.toString());
		
		//searcher.search(query, collector);//for 2.4
		//ScoreDoc[] hits = collector.topDocs().scoreDocs;//for 2.4
		TopDocs topDocs = searcher.search(query, this.tpNum);
		
		return topDocs.scoreDocs;		
	}
	
	public List<FileEntity> doFilter() throws Exception {
		List<FileEntity> list = new ArrayList<FileEntity>();
		//Searcher searcher = new IndexSearcher(Constant.getRealPath("index"));//for 2.4
		Directory dir = FSDirectory.open(new java.io.File(Constant.getRealPath("index")));
		
		IndexReader reader = IndexReader.open(dir);
		IndexSearcher searcher = new IndexSearcher(reader);
		
		Highlighter highlighter = null;//for 2.4
		SimpleHTMLFormatter formatter = new SimpleHTMLFormatter("<font color='red'><b>", "</b></font>");//for 2.4

		//FragListBuilder fragListBuilder = new SimpleFragListBuilder();
		//FragmentsBuilder fragmentBuilder = new ScoreOrderFragmentsBuilder(BaseFragmentsBuilder.COLORED_PRE_TAGS, BaseFragmentsBuilder.COLORED_POST_TAGS);
		//FastVectorHighlighter highlighter = new FastVectorHighlighter(true, true, fragListBuilder, fragmentBuilder);
		Query query = this.doQuery();//for 2.4
		//FieldQuery fieldQuery = highlighter.getFieldQuery(query);

		//System.out.println(query.toString());
		
		//searcher.search(query, collector);//for 2.4
		//ScoreDoc[] hits = collector.topDocs().scoreDocs;//for 2.4
		TopDocs topDocs = searcher.search(query, this.tpNum);		
		ScoreDoc[] hits = topDocs.scoreDocs;
		
		highlighter = new Highlighter(formatter, new QueryScorer(query, Constant.contfld));//for 2.4
		highlighter.setTextFragmenter(new SimpleFragmenter(200));//for 2.4
		

		ArrayList<File> files_retrieved = fileOpr.seltRl(this.role);
		ArrayList<String> ids_retrieved = new ArrayList<String>();
		
		//Access Control
		//role == "*" : administrator
		if(!"*".equals(this.role)) {
			for(File file: files_retrieved) {
				ids_retrieved.add(""+file.getId());
			}			
		}			
		
		//Access Control
		//role == "*" : administrator
		HashMap<Integer, String> id_role_map = new HashMap<Integer, String>();
		if("*".equals(this.role)) {
			ArrayList<File> files_all = fileOpr.selt();
			for(File file: files_all) {
				id_role_map.put(file.getId(), file.getRole());
			}
		}
		
		Document doc;
		String file_name;
		
		//for(int i=0; i<hits.length; i++) {//for 2.4
		for(ScoreDoc scoreDoc : hits) {
			//doc = searcher.doc(hits[i].doc);//for 2.4
			doc = searcher.doc(scoreDoc.doc);
				
			
			//Access Control
			//role == "*" : administrator
			if(!"*".equals(this.role)) {
				if(!ids_retrieved.contains(doc.get("ID")))
					continue;				
			}
			
			
			FileEntity file_entity = new FileEntity();
			
			//String snippet = highlighter.getBestFragment(fieldQuery, searcher.getIndexReader(), scoreDoc.doc, Constant.contfld, 100);
			//file_entity.setContent(snippet);
			TokenStream token_stream = new StandardAnalyzer(Version.LUCENE_30).tokenStream(Constant.contfld, new StringReader(doc.get(Constant.contfld)));//for 2.4
			file_entity.setContent(highlighter.getBestFragment(token_stream, doc.get(Constant.contfld)));//for 2.4

			
			file_name = doc.get("NAME");
			file_entity.setName(file_name);			
			file_entity.setPath(Common.ExtractFileUri(doc.get("PATH")));
			file_entity.setType(doc.get("TYPE"));
			file_entity.setId(Integer.valueOf(doc.get("ID")));
			//Access Control
			//role == "*" : administrator
			if("*".equals(this.role)) {
				file_entity.setRole(id_role_map.get(file_entity.getId()));
			}
			
			list.add(file_entity);
		}
		
		
		return list;
	}
	
	public List<FileEntity> doRetrieve(int curPgNum) throws Exception {
		List<FileEntity> list = this.doFilter();
		rsNum = list.size();
		
		List<FileEntity> list_retrieved = new ArrayList<FileEntity>();
		
		int total_number = curPgNum * pgNum;
		if (total_number > list.size())
			total_number = list.size();
		
		for(int i=(curPgNum-1)*pgNum; i<total_number; i++) {
			list_retrieved.add(list.get(i));
		}
		
		return list_retrieved;
		
	}
		
	
	
	private int rsNum = 0;

	public int getRsNum() {
		return rsNum;
	}
	public void setRsNum(int rsNum) {
		this.rsNum = rsNum;
	}
	
}
