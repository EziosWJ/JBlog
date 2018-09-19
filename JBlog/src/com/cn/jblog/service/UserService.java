package com.cn.jblog.service;

import com.cn.jblog.model.User;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.activerecord.tx.TxConfig;

public class UserService {

	Record rd = new Record();
	private static final User dao = new User().dao();
	
	@Before(Tx.class)
	public User login(User user) {
		User rtnUser = new User();
		rtnUser = user.findFirst("SELECT * FROM jblog_user WHERE user_Name = ? AND user_Password = ?", user.getUserName(),user.getUserPassword());
		return rtnUser;
	}
	@Before(Tx.class)
	public User getUser (String user_Id){
		User user = dao.findById(user_Id);
		return user;
	}
	
	@TxConfig("otherConfigName")
	@Before(Tx.class)
	public boolean saveUser(User user){
		return user.save();
	}
	@TxConfig("otherConfigName")
	@Before(Tx.class)
	public boolean updateUser(User user){
		return user.update();
	}
}
