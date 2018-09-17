package com.cn.jblog.controller;

import com.cn.jblog.model.ArticleMain;
import com.cn.jblog.service.ArticleService;
import com.jfinal.core.Controller;

public class ArticleController extends Controller {

	private ArticleService articleService = new ArticleService();
	
	public void index(){
		
	}
	public void getArticleDetailed(){
		
	}
	public void getArticleList(){
		
	}
	public void submitArticle() {
		System.out.println(getPara("article_Content"));
		ArticleMain articleMain  = getModel(ArticleMain.class,"");
		articleService.submitArticle(articleMain);
		renderJson(articleMain);
	}
	
	
}
