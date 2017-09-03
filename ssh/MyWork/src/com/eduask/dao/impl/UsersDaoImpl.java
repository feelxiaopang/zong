package com.eduask.dao.impl;

import java.util.List;

















import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.eduask.dao.UsersDao;
import com.eduask.model.Users;


@Repository("studentDao")
public class UsersDaoImpl implements UsersDao{

	@Autowired
	private  SessionFactory sessionFactory;
	
	@Autowired
	private TransactionTemplate transactionTemplate;

	@Override
	public List<Users> findAll() {
		List<Users> list =null;
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from users");
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}

}
