package com.efilebee.db.file;

import java.util.ArrayList;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.efilebee.db.File;

public class FileDaoImpl extends SqlMapClientDaoSupport implements FileDao {

	public int delt() {
		return this.getSqlMapClientTemplate().delete("t_file.d");
	}

	public int deltId(int id) {
		return this.getSqlMapClientTemplate().delete("t_file.dId", id);
	}

	public int deltNm(String name) {
		return this.getSqlMapClientTemplate().delete("t_file.dNm", name);
	}

	public File inst(File file) {
		getSqlMapClientTemplate().insert("t_file.i", file);
		return file;
	}

	public File seltId(int id) {
		return (File)this.getSqlMapClientTemplate().queryForObject("t_file.sId", id);
	}

	public long seltMaxLM() {
		File f = (File)this.getSqlMapClientTemplate().queryForObject("t_file.sMaxLM");
		if(f == null)
			return 0;
		else
			return f.getLastModified();
	}

	public long seltMinLM() {
		File f = (File)this.getSqlMapClientTemplate().queryForObject("t_file.sMinLM");
		if(f == null)
			return 0;
		else
			return f.getLastModified();
	}

	public File seltNm(String name) {
		return (File)this.getSqlMapClientTemplate().queryForObject("t_file.sNm", name);
	}

	public int updtId(File file) {
		return this.getSqlMapClientTemplate().update("t_file.uId", file);
	}

	public ArrayList<File> seltRl(String role) {
		return (ArrayList<File>)getSqlMapClientTemplate().queryForList("t_file.sRl", role);
	}

	public ArrayList<File> selt() {
		return (ArrayList<File>)getSqlMapClientTemplate().queryForList("t_file.s");
	}

}
