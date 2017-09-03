package xyz.next.controller;


import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import xyz.next.dao.UsersDao;
import xyz.next.dao.impl.UsersDaoImpl;
import xyz.next.model.Users;
import xyz.next.servers.UsersServers;
import xyz.next.servers.impl.UsersServersImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@ParentPackage("struts-default")
@Namespace("/")
@Results(value={
		@Result(name="success",location="/success.jsp"),
		@Result(name="error",location="/error.jsp"),
		@Result(name="boss",location="/views/boss.jsp")
})
public class LoginController extends ActionSupport{
	@Autowired
	private UsersServers usersServers;
	
	private Users user=new Users();
	
	UsersDao ud = new UsersDaoImpl();
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	Map<String, Object> request = (Map<String, Object>) ActionContext
			.getContext().get("request");

//	Map<String, Object> session = (Map<String, Object>) ActionContext
//			.getContext().get("session");
	@Action(value="login")
	public String login(){
		Map<String, Object> session = (Map<String, Object>) ActionContext.getContext().get("session");
		if(user.getUsername().isEmpty()){		
		return "error";
		}else if(usersServers.findAll(user)){
			session.put("name",user.getUsername());
		return "boss";
		}
		return "error";
	}
	
}
