package xyz.next.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import xyz.next.model.Users;

public interface PagesDao {
	/**
	 * 查询总条数
	 * @return
	 */
	public List<Users> counts();
	
	
	
	/**
	 * 根据页数查询
	 * @return
	 */
	public List<Users> page(int currentPage);
}
