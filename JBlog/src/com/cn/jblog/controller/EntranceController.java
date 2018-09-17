package com.cn.jblog.controller;

import com.jfinal.core.Controller;

public class EntranceController extends Controller {
	
	public void index() {
		renderText("這就是入口！");
	}
	public void home() {
		renderText("這就是家！");
	}
}
