package xyz.next.servers;

import java.util.List;

import xyz.next.model.Users;


public interface UsersServers {
	/**
	 * 新增
	 * @param users
	 */
	public Boolean inserts(Users users);
	
	/**
	 * 查询所有
	 * @return
	 */
	public Boolean findAll(Users users);
	/**
	 * 修改
	 */
	public void update(Users users);
	/**
	 * 删除
	 */
	public void delete(Users users);
}
