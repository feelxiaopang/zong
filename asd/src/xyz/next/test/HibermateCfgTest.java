//package xyz.next.test;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.cfg.Configuration;
//
//import xyz.next.model.Users;
//
//public class HibermateCfgTest {
//	public static void main(String[] args) {
//		//����һ��������
//				Configuration cfg = new Configuration();
//				//���ص�ǰ����Ĭ��hibernate.cfg.xml
//				cfg.configure();
//				//ͨ�����ù���session������ͬʱִ��ddl����
//				SessionFactory factory = cfg.buildSessionFactory();
//				//ͨ��session������/����session
//				Session session = factory.openSession();
//				//��ʼ����
//				session.beginTransaction();
//				
//				Users users = new Users();	
//				
//				users.setUsername("zhangsan");
//				users.setPassword("123456");
//				users.setNickname("zhangsan");
//				
//				session.save(users);
//				Users u  = (Users) session.get(Users.class, 1L);
//				
//				System.out.println(u);
//				
//				
//				
//				
//				session.getTransaction().commit();
//				
//				session.close();
//				factory.close();
//	}
//
//	public static void main1(String[] args) {
//		//����һ��������
//		Configuration cfg = new Configuration();
//		//���ص�ǰ����Ĭ��hibernate.cfg.xml
//		cfg.configure();
//		//ͨ�����ù���session������ͬʱִ��ddl����
//		SessionFactory factory = cfg.buildSessionFactory();
//		//ͨ��session������/����session
//		Session session = factory.openSession();
//		//��ʼ����
//		session.beginTransaction();
//		//insert
//		Users users = new Users();
//		users.setNickname("����");
//		users.setUsername("zhangsan");
//		users.setPassword("123456");
//		session.save(users);
//		//select
//		//Users u = (Users) session.get(Users.class, 1L);
////		System.out.println(u);
//		//update
////		u.setName("����");
////		session.update(u);
//		//delete
////		session.delete(u);
////		System.out.println(u.getName());
//		//�ύ����
//		session.getTransaction().commit();
//		
//		session.close();
//		factory.close();
//		
//		
//	}
//	
//	
//}
