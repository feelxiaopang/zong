package xyz.next.action;

import com.opensymphony.xwork2.ActionSupport;

import xyz.next.dao.UsersDao;
import xyz.next.dao.impl.UsersDaoImpl;
import xyz.next.model.Users;

public class LoginAction extends ActionSupport{
	private Users users=new Users();
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	UsersDao uses=new UsersDaoImpl();
	/*
	 * (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 * µÇÂ¼
	 */
	@Override
	public String execute() throws Exception {
		if(users.getUsername().isEmpty()&&users.getPassword().isEmpty()){
		return "error";
		}else{
			if(uses.login(users))
				return "success";
		}
		return "error";
	}
	/*
	 *À¹½Ø
	 */
	public String iterceptorLogin(){
		
		
		return "error";
		
	}
	
}
