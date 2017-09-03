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
		//加载当前配置默认hibernate.cfg.xml
		cfg.configure();
		//通过配置构建session工厂，同时执行ddl操作
		factory = cfg.buildSessionFactory();
		//通过session工厂打开/创建session
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
