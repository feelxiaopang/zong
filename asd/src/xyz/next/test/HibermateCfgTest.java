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
//		//创建一个配置类
//				Configuration cfg = new Configuration();
//				//加载当前配置默认hibernate.cfg.xml
//				cfg.configure();
//				//通过配置构建session工厂，同时执行ddl操作
//				SessionFactory factory = cfg.buildSessionFactory();
//				//通过session工厂打开/创建session
//				Session session = factory.openSession();
//				//开始事务
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
//		//创建一个配置类
//		Configuration cfg = new Configuration();
//		//加载当前配置默认hibernate.cfg.xml
//		cfg.configure();
//		//通过配置构建session工厂，同时执行ddl操作
//		SessionFactory factory = cfg.buildSessionFactory();
//		//通过session工厂打开/创建session
//		Session session = factory.openSession();
//		//开始事务
//		session.beginTransaction();
//		//insert
//		Users users = new Users();
//		users.setNickname("张三");
//		users.setUsername("zhangsan");
//		users.setPassword("123456");
//		session.save(users);
//		//select
//		//Users u = (Users) session.get(Users.class, 1L);
////		System.out.println(u);
//		//update
////		u.setName("李四");
////		session.update(u);
//		//delete
////		session.delete(u);
////		System.out.println(u.getName());
//		//提交事务
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
