package com.cn.jblog.controller;

import com.cn.jblog.service.FrontPartsService;
import com.cn.jblog.utils.MsgResponse;
import com.jfinal.core.Controller;

public class FrontPartsController extends Controller {

	private static final FrontPartsService FRONT_PARTS_SERVICE = new FrontPartsService();
	
	public void index(){
		
	}
	
	public void getLeftBarClassList(){
		renderJson(MsgResponse.success().put("list", FRONT_PARTS_SERVICE.getLeftBarClassList()));
	}
}
