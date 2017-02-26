package app.type.dao.proxy;

import java.util.List;

import app.type.bean.Article;
import app.type.dao.IArticleInfoDao;
import app.type.dao.impl.ArticleInfoDaoImpl;
import app.type.dbc.DatabaseConnection;

public class ArticleInfoDaoProxy implements IArticleInfoDao {
	private DatabaseConnection dbc=null;
	private IArticleInfoDao dao=null;
	public ArticleInfoDaoProxy() throws Exception {
		this.dbc=new DatabaseConnection();
		this.dao=new ArticleInfoDaoImpl(this.dbc.getConnection());
	}
	@Override
	public Article getArticleByID(int id) throws Exception {
		Article article=null;
		try {
			article=this.dao.getArticleByID(id);
		} catch (Exception e) {
			throw e;
		}finally{
			if(this.dbc!=null){
				this.dbc.close();
			}
		}
		return article;
	}

	@Override
	public List<Article> getArticleByType(String type) throws Exception {
		List<Article> list=null;
		try {
			list=this.dao.getArticleByType(type);
		} catch (Exception e) {
			throw e;
		}finally{
			if(this.dbc!=null){
				this.dbc.close();
			}
		}
		return list;
	}

}
