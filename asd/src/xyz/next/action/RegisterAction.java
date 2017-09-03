package xyz.next.action;

import com.opensymphony.xwork2.ActionSupport;

import xyz.next.dao.UsersDao;
import xyz.next.dao.impl.UsersDaoImpl;
import xyz.next.model.Users;

public class RegisterAction extends ActionSupport{
	private Users users=new Users();
	private String passwords;
	UsersDao uses=new UsersDaoImpl();
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public String getPasswords() {
		return passwords;
	}
	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}
	public String regesters(){
		if(uses.loginusers(users.getUsername())){
		return "error";
	}else if(users.getPassword().equals(passwords)){
		if(uses.register(users)){
			return "success";
		}
	}
		return "error";
	}
}
