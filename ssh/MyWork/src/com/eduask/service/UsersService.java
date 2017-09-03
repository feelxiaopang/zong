package com.eduask.service;

import java.util.List;

import com.eduask.model.Users;

public interface UsersService {
	/**
	 * 查询所有学生
	 * @return
	 */
	public List<Users> findAll();
}
