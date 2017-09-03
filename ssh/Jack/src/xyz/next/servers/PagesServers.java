package xyz.next.servers;

import java.util.List;

import xyz.next.model.Users;

public interface PagesServers {
	/**
	 * 返回条数
	 * @return
	 */
	public Long count();
	
	/**
	 * 返回页
	 * @return
	 */
	public List<Users> findPage(int currentPage);
	
}
