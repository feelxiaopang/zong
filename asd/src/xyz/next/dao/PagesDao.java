package xyz.next.dao;

import java.util.List;


import xyz.next.model.Pages;
import xyz.next.model.Users;

public interface PagesDao {
	
	/**
	 * 查询总条数
	 * @return
	 */
	public Long cout();
	
	/**
	 * 根据页数查询
	 * @return
	 */
	public List<Users> page(int currentPage);
}
