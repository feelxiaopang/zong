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
	 * µÇÂ¼
	 * @return
	 */
	@RequestMapping("/login")
	public String login(Users users, HttpServletRequest request, HttpSession session){
		/**
		 * ÅĞ¶ÏÕËºÅÎ´¿Õ
		 */
		if(users.getUsername().isEmpty() || users.getPassword().isEmpty()){
			request.setAttribute("name", "ÕËºÅÃÜÂë²»ÄÜÎª¿Õ");
		}else{
			/**
			 * ÅĞ¶ÏÕËºÅÊÇ·ñ´æÔÚ
			 */
			if(usersService.login(users).getPassword().equals(users.getPassword())){
				session.setAttribute("username", users.getUsername());
				session.setAttribute("users", users);
				return "success";
			}else{
				request.setAttribute("name", "ÕËºÅ²»´æÔÚ»òÕßÃÜÂë´íÎó");
			}
		}
		return "login";
	}

	/**
	 * ×¢²á
	 * 
	 * @return
	 */
	@RequestMapping("/register")
	public String register(Users users,String passwords, 
			HttpServletRequest request, HttpSession session) {
		/**
		 * ÅĞ¶ÏÕËºÅÃÜÂëÎ´¿Õ
		 */
		if (users.getUsername().isEmpty() || users.getPassword().isEmpty()) {
			request.setAttribute("name", "ÕËºÅÃÜÂë²»ÄÜÎª¿Õ");
		} else {
			// ÅĞ¶ÏÁ½´ÎÃÜÂëÊäÈëÊÇ·ñÒ»ÖÂ
			if (users.getPassword().equals(passwords)) {
				// ÅĞ¶ÏÕËºÅÊÇ·ñ´æÔÚ
				if (usersService.login(users)!=null) {

					request.setAttribute("name", "ÕËºÅÒÑ´æÔÚ");
				} else {
					if(usersService.register(users));
						return "success"; 
				}
			} else {
				request.setAttribute("name", "Á½´ÎÃÜÂëÊäÈë²»Ò»ÖÂ");
			}
		}
		return "register";

	}
}
