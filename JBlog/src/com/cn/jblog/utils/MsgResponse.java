package com.cn.jblog.utils;

import java.util.HashMap;
import java.util.Map;

public class MsgResponse {
	
	private int code;
	private String msg;
	private Map<Object, Object> content = new HashMap<>();
	
	public MsgResponse() {
		// TODO Auto-generated constructor stub
	}
	
	public static MsgResponse fail() {
		MsgResponse msgResponse = new MsgResponse();
		msgResponse.setCode(555);
		msgResponse.setMsg("处理失败！");
		return msgResponse;
	}
	
	public static MsgResponse success() {
		MsgResponse msgResponse = new MsgResponse();
		msgResponse.setCode(200);
		msgResponse.setMsg("处理成功！");
		return msgResponse;
	}


	public MsgResponse put(Object key,Object value){
		this.getContent().put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public MsgResponse setCode(int code) {
		this.code = code;
		return this;
	}

	public String getMsg() {
		return msg;
	}

	public MsgResponse setMsg(String msg) {
		this.msg = msg;
		return this;
	}

	public Map<Object, Object> getContent() {
		return content;
	}

	public void setContent(Map<Object, Object> content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "MsgResponse [code=" + code + ", msg=" + msg + ", content=" + content + "]";
	}
	
	
	
}
