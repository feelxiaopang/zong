package xyz.next.service;


import xyz.next.model.Users;

public interface UsersService {
public Users login(Users users);
	
	public Boolean register(Users users);
}
