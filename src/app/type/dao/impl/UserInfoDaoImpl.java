package app.type.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import app.type.bean.UserInfo;
import app.type.dao.IUserInfoDao;

public class UserInfoDaoImpl implements IUserInfoDao {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	public UserInfoDaoImpl(Connection conn) {
		this.conn=conn;
	}
	@Override
	public UserInfo getUserByName(String username) throws Exception {
		String sql="select userid,username,password,email,status from userinfo where username=?;";
		this.pstmt=conn.prepareStatement(sql);
		this.pstmt.setString(1,username);
		ResultSet rs =this.pstmt.executeQuery();
		UserInfo info =null;
		while(rs.next()){
			info=new UserInfo();
			info.setUserid(rs.getString("userid"));
			info.setPassword(rs.getString("password"));
			info.setUsername(rs.getString("username"));
			info.setEmail(rs.getString("email"));
			info.setStatus(rs.getInt("status"));
		}
		this.pstmt.close();
		return info;
	}

}
