package test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.eduask.controller.UsersController;
import com.eduask.dao.impl.UsersDaoImpl;
import com.eduask.model.Users;

public class BeanTest {

	public static void main(String[] args) {
		BeanFactory bf = new ClassPathXmlApplicationContext("/applicationContext.xml");
		UsersController sc = bf.getBean("studentController",UsersController.class);
//		sc.show();
		System.out.println(sc);
	}
}
