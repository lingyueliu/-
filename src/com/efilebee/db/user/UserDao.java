package com.efilebee.db.user;

import java.util.ArrayList;

import com.efilebee.db.User;

public interface UserDao {
	public User seltId(int id);
	public User seltNmPw(String name, String password);
	public ArrayList<User> seltNmRl(String name, String role);
	public int deltId(int id);	
	public int updtId(User user);
	
	public User inst(User user);
}
