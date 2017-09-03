package xyz.next.dao;

import java.util.List;

import xyz.next.model.Users;


public interface UsersDao {
	/**
	 * 添加
	 * @param users
	 */
	public void insert(Users users);
	
	/**
	 * 查询
	 * @return
	 */
	public List<Users> select(Users users);
	/**
	 * 修改
	 */
	public void update(Users users);
	/**
	 * 删除
	 */
	public void delete(Users users);
}
