package xyz.next.dao;

import java.util.List;


import xyz.next.model.Pages;
import xyz.next.model.Users;

public interface PagesDao {
	
	/**
	 * ��ѯ������
	 * @return
	 */
	public Long cout();
	
	/**
	 * ����ҳ����ѯ
	 * @return
	 */
	public List<Users> page(int currentPage);
}
