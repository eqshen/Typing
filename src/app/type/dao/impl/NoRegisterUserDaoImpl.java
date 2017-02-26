package app.type.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import app.type.bean.Article;
import app.type.bean.NoRegisterUser;
import app.type.dao.INoRegisterUserDao;

public class NoRegisterUserDaoImpl implements INoRegisterUserDao {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	public NoRegisterUserDaoImpl(Connection conn) {
		this.conn=conn;
	}
	@Override
	public boolean addUser(NoRegisterUser info) throws Exception {
		String sql="INSERT INTO no_regisiteruser(userid,username,`STATUS`) VALUES(?,?,?);";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,info.getUserid());
		pstmt.setString(2,info.getUsername());
		pstmt.setInt(3,info.getStatus());
		int n=pstmt.executeUpdate();
		if(n>=1)
			return true;
		return false;
	}

	@Override
	public boolean deleteUser(String uesrname) throws Exception {
		String sql="delete from no_regisiteruser where username=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,uesrname);
		boolean res=pstmt.execute();
		return res;
	}
	@Override
	public NoRegisterUser getUser(String uesrname) throws Exception {
		String sql="select * from no_regisiteruser where username=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,uesrname);
		ResultSet rs=pstmt.executeQuery();
		NoRegisterUser info=null;
		while(rs.next()){
			info=new NoRegisterUser();
			info.setId(rs.getInt("id"));
			info.setUserid(rs.getString("userid"));
			info.setUsername(rs.getString("username"));
		}
		return info;
	}

}
