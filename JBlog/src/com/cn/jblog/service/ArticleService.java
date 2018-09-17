package com.cn.jblog.service;

import java.util.List;

import com.cn.jblog.model.ArticleMain;

public class ArticleService {
	
	private ArticleMain dao = new ArticleMain().dao();
	
	public boolean submitArticle(ArticleMain articleMain) {
		List<?> list = dao.find("SELECT MAX(article_Id) as article_Id FROM jblog_article_main");
		ArticleMain a = (ArticleMain) list.get(0);
		articleMain.setArticleId("AM100020180913"+String.valueOf(Integer.parseInt(a.getArticleId().substring(13))+1).substring(1));
		return articleMain.save();
	}
	
}
