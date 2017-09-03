package xyz.next.model;



public class Users {
	/**
	 * 主键
	 */
	private Long id;
	
	//账号
	private String username;
	
	//密码
	private String password;
	
	//真实姓名
	private String nickname;
	//set和get方法
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password 
				+ ", nickname=" + nickname + "]";
	}
	
}
