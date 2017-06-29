package com.efilebee.db.file;

import java.util.ArrayList;

import com.efilebee.db.File;

public interface FileDao {
	
	public ArrayList<File> selt();
	public File seltId(int id);
	public File seltNm(String name);
	public ArrayList<File> seltRl(String role);
	public long seltMaxLM();
	public long seltMinLM();
	
	public int updtId(File file);
	
	public int deltId(int id);
	public int deltNm(String name);
	public int delt();
	
	public File inst(File file);
}
