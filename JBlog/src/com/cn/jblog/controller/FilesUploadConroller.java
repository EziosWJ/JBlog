package com.cn.jblog.controller;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

public class FilesUploadConroller extends Controller {
	
	public void idex() {
		
	}
	public void uploadImg() {
		System.out.println(getPara("project"));
		UploadFile file = getFile();
		System.out.println(file.toString());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("errno", 0);
		List<Object> data = new ArrayList<>();
		data.add(file.getUploadPath());
		System.out.println(data.toString());
		jsonObject.put("data", data);
		renderJson(jsonObject);
	}
	public void uploadImges() {
		List<UploadFile> uploadFiles = getFiles();
		System.out.println(uploadFiles.toString());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("errno", 0);
		List<Object> data = new ArrayList<>();
		for (int i = 0; i < uploadFiles.size(); i++) {
			data.add(getRequest().getContextPath()+ "/upload/" + uploadFiles.get(i).getOriginalFileName());
		}
		jsonObject.put("data", data);
		renderJson(jsonObject);
	}
}
