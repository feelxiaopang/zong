package xyz.next.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xyz.next.dao.UsersDao;
import xyz.next.model.Users;

@Repository("usersDao")
public class UsersDaoImpl implements UsersDao{
	@Autowired
	private  SessionFactory sessionFactory;//session宸ュ巶

	@Override
	public void insert(Users users) {
		Session session = sessionFactory.openSession();//鎵撳紑session
		Transaction transaction = session.beginTransaction();//寮�惎浜嬪姟
		try {
			session.save(users);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();//鍥炴粴
		}finally{
			if(session!=null)
				session.close();//鍏抽棴session
		}
	}

	@Override
	public List<Users> select(Users users) {
		Users user = null;
		Session session = sessionFactory.openSession();//鎵撳紑session

			List<Users> list =  session.createQuery("from Users where username=:username").setParameter("username", users.getUsername()).list();
		
			return list;
	}

	@Override
	public void update(Users users) {
		Session	session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();//寮�惎浜嬪姟
		try {
			session.update(users);
			transaction.commit();		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null)
				session.close();//鍏抽棴session
		}
	}

	@Override
	public void delete(Users users) {
		Session	session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();//寮�惎浜嬪姟
		try {
			session.delete(users);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null)
				session.close();//鍏抽棴session
		}
	}
	
	
}
