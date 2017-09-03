package com.eduask.controller;


import org.jboss.logging.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.eduask.dao.impl.UsersDaoImpl;
import com.eduask.model.Users;
import com.eduask.service.UsersService;

@Controller
@RequestMapping(value="/login/")
public class UsersController {

	@Autowired
	private UsersService usersService;
	private UsersDaoImpl uses;
	//responseBody : 返回json
	@RequestMapping(value="/login",method=RequestMethod.GET)
	@ResponseBody
	public String show(ModelAndView mav,String name){
		Users ut = new Users();
		if(ut.getUsername().isEmpty()||ut.getPassword().isEmpty()){
			return "error";
		}else{
				if(usersService.findAll() != null)
					return "success";
			}
			return "error";
		
		}
	
}
