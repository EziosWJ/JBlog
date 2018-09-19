package com.cn.jblog.controller;

import java.util.List;

import com.cn.jblog.model.ArticleMain;
import com.cn.jblog.service.ArticleService;
import com.cn.jblog.utils.MsgResponse;
import com.jfinal.core.Controller;

public class ArticleController extends Controller {

	private ArticleService articleService = new ArticleService();
	
	public void index(){
		render("/page/blog_list.jsp");
	}
	public void showArticleWrite(){
		render("/page/blog_write.jsp");
	}
	public void showArticle(){
		String article_Id = getPara("article_Id");
		getRequest().setAttribute("article_Id", article_Id);
		render("/page/blog_article.jsp");
	}
	public void getArticleDetailed(){
		String id = getPara("article_Id");
		ArticleMain articleMain = articleService.getArticle(id);
		boolean update = articleService.viewArticle(articleMain);
		if(update){
			renderJson(MsgResponse.success().put("article",articleMain));
		}else {
			renderJson(MsgResponse.fail());
		}
	}
	public void getArticleList(){
		List<?> list = articleService.getArticleList();
		renderJson(MsgResponse.success().put("list", list));;
	}
	public void submitArticle() {
		System.out.println(getPara("article_Content"));
		ArticleMain articleMain  = getModel(ArticleMain.class,"");
		articleMain.setArticleCreateTime(new java.util.Date());
		articleMain.setArticleViews(1).setArticleComments(0).setArticleHeart(0);
		articleService.submitArticle(articleMain);
		renderJson(articleMain);
	}
	
	
}
