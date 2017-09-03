package xyz.next.mapper;

import org.apache.ibatis.annotations.Select;



import xyz.next.model.Users;

public interface UsersMapper {
	
	public void InsertUser(Users user);
	
	@Select("select * from users where username=#{username}")
	public Users SelectUser(String username);

}
