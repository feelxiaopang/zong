package com.eduask.dao;

import java.util.List;

import com.eduask.model.Users;

public interface UsersDao {

	/**
	 * 查询所有
	 * @return
	 */
	public List<Users> findAll();

}
