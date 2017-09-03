package xyz.next.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import xyz.next.dao.PagesDao;

import xyz.next.model.Users;

public class PagesDaoImpl implements PagesDao{
	static Configuration cfg = new Configuration();
	static SessionFactory factory;
	static Session session;
	static{
		//���ص�ǰ����Ĭ��hibernate.cfg.xml
		cfg.configure();
		//ͨ�����ù���session������ͬʱִ��ddl����
		factory = cfg.buildSessionFactory();
		//ͨ��session������/����session
		session = factory.openSession();
		
	}
	
	
	@Override
	public Long cout() {
		List<Users> list = session.createQuery("from Users").list();
		return (long) list.size();
	}


	@Override
	public List<Users> page(int currentPage) {
		int num = (currentPage-1)*5;
		List<Users> list = session.createQuery("from Users").setFirstResult(num)
				.setMaxResults(5).list();
		return list;
	}


}
