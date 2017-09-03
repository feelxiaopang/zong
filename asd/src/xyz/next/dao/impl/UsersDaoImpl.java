package xyz.next.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



import xyz.next.dao.UsersDao;
import xyz.next.model.Users;

public class UsersDaoImpl implements UsersDao{
	//��������
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
	/**
	 * �ر�
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
		//��ʼ����
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
