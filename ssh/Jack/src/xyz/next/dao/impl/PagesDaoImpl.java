package xyz.next.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xyz.next.dao.PagesDao;
import xyz.next.model.Users;

@Repository("pagesDao")
public class PagesDaoImpl implements PagesDao{
	
	@Autowired
	private  SessionFactory sessionFactory;


	@Override
	public List<Users> counts() {
		//开启session
		Session session = sessionFactory.openSession();
		List<Users> list = null;
		try {
			list = session.createQuery("from users").list();
		}finally {
			if(session!=null)
				//关闭session
				session.close();
		}
		return list;
	}

	
	@Override
	public List<Users> page(int currentPage) {
		Session session = sessionFactory.openSession();
		List<Users> list = null;
		int num = (currentPage-1)*5;
		try {
			list = session.createQuery("from users").setFirstResult(num)
					.setMaxResults(5).list();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}



	
}