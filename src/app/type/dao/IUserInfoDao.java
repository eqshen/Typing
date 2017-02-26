package app.type.dao;

import app.type.bean.UserInfo;

public interface IUserInfoDao {
	UserInfo getUserByName(String username) throws Exception;
}
