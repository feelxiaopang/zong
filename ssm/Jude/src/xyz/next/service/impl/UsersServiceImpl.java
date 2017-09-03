package xyz.next.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.next.mapper.UsersMapper;
import xyz.next.model.Users;
import xyz.next.service.UsersService;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersMapper usersmapper;

	@Override
	public Users login(Users users) {
		Users uses = usersmapper.SelectUser(users.getUsername());
		return uses;
	}

	@Override
	public Boolean register(Users users) {
		usersmapper.InsertUser(users);
		return usersmapper.SelectUser(users.getUsername())!=null;
	}

}
