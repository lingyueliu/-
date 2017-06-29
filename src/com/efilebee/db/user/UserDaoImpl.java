package com.efilebee.db.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.efilebee.db.User;

public class UserDaoImpl extends SqlMapClientDaoSupport implements UserDao {

	public int deltId(int id) {
		return getSqlMapClientTemplate().delete("t_user.dId", id);
	}

	public User inst(User user) {
		getSqlMapClientTemplate().insert("t_user.i", user);
		return user;
	}

	public User seltId(int id) {
		return (User)getSqlMapClientTemplate().queryForObject("t_user.sId", id);
	}

	public User seltNmPw(String name, String password) {
		Map map = new HashMap();
		map.put("name", name);
		map.put("password", password);
		return (User)getSqlMapClientTemplate().queryForObject("t_user.sNmPw", map);
	}

	public ArrayList<User> seltNmRl(String name, String role) {
		Map map = new HashMap();
		map.put("name", name);
		map.put("role", role);
		return (ArrayList<User>)getSqlMapClientTemplate().queryForList("t_user.sNmRl", map);
	}

	public int updtId(User user) {
		return getSqlMapClientTemplate().update("t_user.uId", user);
	}

}
