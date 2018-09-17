package com.cn.jblog.controller;

import java.util.List;

import com.cn.jblog.model.ArticleMain;
import com.cn.jblog.service.ArticleService;
import com.cn.jblog.utils.MsgResponse;
import com.jfinal.core.Controller;

public class ArticleController extends Controller {

	private ArticleService articleService = new ArticleService();
	
	public void index(){
		redirect("/page/blog_list.html");
	}
	public void showArticleWrite(){
		redirect("/page/blog_write.html");
	}
	public void showArticle(){
		String article_Id = getPara("article_Id");
		getSession().setAttribute("article_Id", article_Id);
		redirect("/page/blog_article.html");
	}
	public void getArticleDetailed(){
		String id = (String) getSession().getAttribute("article_Id");
		ArticleMain articleMain = articleService.getArticle(id);
		renderJson(MsgResponse.success().put("article",articleMain));
	}
	public void getArticleList(){
		List<?> list = articleService.getArticleList();
		renderJson(MsgResponse.success().put("list", list));;
	}
	public void submitArticle() {
		System.out.println(getPara("article_Content"));
		ArticleMain articleMain  = getModel(ArticleMain.class,"");
		articleService.submitArticle(articleMain);
		renderJson(articleMain);
	}
	
	
}
