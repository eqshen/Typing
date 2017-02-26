package app.type.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.regexp.internal.recompile;

import app.type.bean.Article;
import app.type.dao.IArticleInfoDao;

public class ArticleInfoDaoImpl implements IArticleInfoDao {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	public ArticleInfoDaoImpl(Connection conn) {
		this.conn=conn;
	}
	
	@Override
	public Article getArticleByID(int id) throws Exception {
		String sql="select id,title,content,type,status,level from article where id=? and status=1";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,id);
		ResultSet rs=pstmt.executeQuery();
		Article article=null;
		while(rs.next()){
			article=new Article();
			article.setID(rs.getInt("id"));
			article.setTitle(rs.getString("title"));
			article.setContent(rs.getString("content"));
			article.setLevel(rs.getString("level"));
			article.setType(rs.getString("type"));
			article.setStatus(rs.getInt("status"));
		}
		return article;
	}
	
	//选择article为 type 并且level为public的文章
	@Override
	public List<Article> getArticleByType(String type) throws Exception {
		String sql="select id,title,content,type,status,level from article"
				+ " where type=? and status=1 and level='public';";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,type);
		ResultSet rs=pstmt.executeQuery();
		List<Article> list=new ArrayList<Article>();
		Article article=null;
		while(rs.next()){
			article=new Article();
			article.setID(rs.getInt("id"));
			article.setTitle(rs.getString("title"));
			article.setContent(rs.getString("content"));
			article.setLevel(rs.getString("level"));
			article.setType(rs.getString("type"));
			article.setStatus(rs.getInt("status"));
			list.add(article);
		}
		return list;
	}

}
