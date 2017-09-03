package com.eduask.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eduask.dao.UsersDao;
import com.eduask.model.Users;
import com.eduask.service.UsersService;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDao usersDao;

	@Transactional
	@Override
	public List<Users> findAll() {
		return usersDao.findAll();
	}

}
