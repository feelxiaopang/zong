package xyz.next.dao;

import xyz.next.model.Users;

public interface UsersDao {
	/**
	 * 查询数据库中是否有User对象
	 * @param user
	 * @return
	 */
	public Boolean login(Users users);
	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public Boolean register(Users users);
	
	/**
	 * 判断账号是否存在
	 * @param username
	 * @return
	 */
	public Boolean loginusers(String username);
}
