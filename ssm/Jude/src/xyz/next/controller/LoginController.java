package xyz.next.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import xyz.next.model.Users;
import xyz.next.service.UsersService;

@Controller
public class LoginController {
	@Autowired
	private UsersService usersService;

	/**
	 * ��¼
	 * @return
	 */
	@RequestMapping("/login")
	public String login(Users users, HttpServletRequest request, HttpSession session){
		/**
		 * �ж��˺�δ��
		 */
		if(users.getUsername().isEmpty() || users.getPassword().isEmpty()){
			request.setAttribute("name", "�˺����벻��Ϊ��");
		}else{
			/**
			 * �ж��˺��Ƿ����
			 */
			if(usersService.login(users).getPassword().equals(users.getPassword())){
				session.setAttribute("username", users.getUsername());
				session.setAttribute("users", users);
				return "success";
			}else{
				request.setAttribute("name", "�˺Ų����ڻ����������");
			}
		}
		return "login";
	}

	/**
	 * ע��
	 * 
	 * @return
	 */
	@RequestMapping("/register")
	public String register(Users users,String passwords, 
			HttpServletRequest request, HttpSession session) {
		/**
		 * �ж��˺�����δ��
		 */
		if (users.getUsername().isEmpty() || users.getPassword().isEmpty()) {
			request.setAttribute("name", "�˺����벻��Ϊ��");
		} else {
			// �ж��������������Ƿ�һ��
			if (users.getPassword().equals(passwords)) {
				// �ж��˺��Ƿ����
				if (usersService.login(users)!=null) {

					request.setAttribute("name", "�˺��Ѵ���");
				} else {
					if(usersService.register(users));
						return "success"; 
				}
			} else {
				request.setAttribute("name", "�����������벻һ��");
			}
		}
		return "register";

	}
}
