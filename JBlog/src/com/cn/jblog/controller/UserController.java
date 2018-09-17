package com.cn.jblog.controller;

import com.cn.jblog.enums.UserEnum;
import com.cn.jblog.model.User;
import com.cn.jblog.service.UserService;
import com.cn.jblog.utils.MsgResponse;
import com.jfinal.core.Controller;

public class UserController extends Controller {

	private UserService userService = new UserService();
	
	public void index(){
		renderText("user");
		render("/xxx.jsp");
		renderJson(MsgResponse.success());
	}
	
	public void login(){
		User req_User = getBean(User.class);
		User user = userService.login(req_User);
		if(user != null){
			setSessionAttr(UserEnum.USER_ID.toString(), user.getUserId());
			setSessionAttr(UserEnum.USER_ID.toString(), user.getUserId());
			setSessionAttr(UserEnum.USER_ID.toString(), user.getUserId());
			renderJson(MsgResponse.success());
		}else{
			renderJson(MsgResponse.fail());
		}
	}
	
	public void logout(){
		getSession().invalidate();
		render("");
	}
}
