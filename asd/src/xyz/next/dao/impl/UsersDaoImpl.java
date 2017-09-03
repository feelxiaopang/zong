package xyz.next.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



import xyz.next.dao.UsersDao;
import xyz.next.model.Users;

public class UsersDaoImpl implements UsersDao{
	//创建配置
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
	/**
	 * 关闭
	 */
	public void close(){
		
		session.close();
		factory.close();
	}
	@Override
	public Boolean login(Users users) {

		
		Users uses = (Users) session.createQuery("from Users where username=? and password=?")
				.setParameter(0, users.getUsername()).
				setParameter(1, users.getPassword()).uniqueResult();
		
		if(uses!=null)
			return true; 
		return false;
		
	}

	@Override
	public Boolean register(Users users) {
		//开始事务
		session.beginTransaction();
		Long i = (Long) session.save(users);
		Users u = (Users) session.get(Users.class,i);
		session.getTransaction().commit();
		if(u!=null)
			return true;
		return false;
	}

	@Override
	public Boolean loginusers(String username) {

		
		Users uses = (Users) session.createQuery("from Users where username=?")
				.setParameter(0, username).uniqueResult();

		if(uses!=null)
			return true;
		return false;
	}

}
