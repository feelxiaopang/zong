package xyz.next.dao;

import xyz.next.model.Users;

public interface UsersDao {
	/**
	 * ��ѯ���ݿ����Ƿ���User����
	 * @param user
	 * @return
	 */
	public Boolean login(Users users);
	
	/**
	 * ע��
	 * @param user
	 * @return
	 */
	public Boolean register(Users users);
	
	/**
	 * �ж��˺��Ƿ����
	 * @param username
	 * @return
	 */
	public Boolean loginusers(String username);
}
