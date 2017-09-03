package xyz.next.controller;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import xyz.next.model.Users;
import xyz.next.servers.UsersServers;

@SuppressWarnings("serial")
@ParentPackage("struts-default")
@Namespace("/")
@Results(value={
		@Result(name="error",location="/error.jsp"),
		@Result(name="boss",location="/views/boss.jsp")
})
public class RegisterController extends ActionSupport{
	@Autowired
	private UsersServers usersServers;
	
	private Users user=new Users();
	
	
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	private String passwords;

	public String getPasswords() {
		return passwords;
	}

	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}
	
	Map<String, Object> request = (Map<String, Object>) ActionContext
			.getContext().get("request");

	Map<String, Object> session = (Map<String, Object>) ActionContext
			.getContext().get("session");
	
	@Action(value="registers")
	public String registers(){
		if (user.getUsername().isEmpty() || user.getPassword().isEmpty()) {
			return "error";
		} else {
			if (user.getPassword().equals(passwords)) {
				if (usersServers.findAll(user)) {
					return "error";
				} else {
					if(usersServers.inserts(user)){
						if(usersServers.findAll(user).equals(user)){
							session.put("name", user.getIdcard());
							return "boss";
						}else{
							return "error";
						}
					}else{
						return "error";
					}
				}
			}else{
				return "error";
			}
		}
	}
}
