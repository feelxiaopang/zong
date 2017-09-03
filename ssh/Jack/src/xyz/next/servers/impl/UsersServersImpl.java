package xyz.next.servers.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xyz.next.dao.UsersDao;
import xyz.next.dao.impl.Long;
import xyz.next.model.Users;
import xyz.next.servers.UsersServers;
@Service("usersServers")
public class UsersServersImpl implements UsersServers{
	@Autowired
	private UsersDao usersdao;
	
	@Transactional
	@Override
	public Boolean inserts(Users users) {
		usersdao.insert(users);
		return usersdao.select(users)!=null;
	}

	@Override
	public Boolean findAll(Users users) {
		Users use = null;
		List<Users> list = usersdao.select(users);
		for (Users users2 : list) {
			if(users2.getPassword().equals(users.getPassword())){
				use = users2;
			}
			System.out.println(users2);
		}
		return use!=null;
		
		
	}

	@Override
	public void update(Users users) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Users users) {
		// TODO Auto-generated method stub
		
	}

}
