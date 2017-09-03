package xyz.next.servers.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.next.dao.PagesDao;
import xyz.next.model.Users;
import xyz.next.servers.PagesServers;

public class PagesServersImpl {
	@Service("pagesServers")
	public class PageServiceImpl implements PagesServers{

		@Autowired
		private PagesDao pagesDao;

		@Override
		public Long count() {
			
			return (long) pagesDao.counts().size();
		}

		@Override
		public List<Users> findPage(int currentPage) {
			
			return pagesDao.page(currentPage);
		}

		
		
		
		
	}

}
