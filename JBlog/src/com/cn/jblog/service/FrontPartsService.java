package com.cn.jblog.service;

import java.util.ArrayList;
import java.util.List;

import com.cn.jblog.model.LeftBarClass;

public class FrontPartsService {

	private static final LeftBarClass dao = new LeftBarClass().dao();
	
	public List<?> getLeftBarClassList(){
		List<?> list = dao.find("SELECT * FROM jblog_left_bar_class");
		return list;
	}
}
