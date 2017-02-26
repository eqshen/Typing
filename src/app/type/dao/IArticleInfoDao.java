package app.type.dao;


import java.util.List;

import app.type.bean.Article;

public interface IArticleInfoDao {
	public Article getArticleByID(int id) throws Exception;
	public List<Article> getArticleByType(String type) throws Exception;
}
