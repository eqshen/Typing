package app.type.dao;

import app.type.bean.NoRegisterUser;

public interface INoRegisterUserDao {
	public boolean addUser(NoRegisterUser info)throws Exception;
	public boolean deleteUser(String uesrname)throws Exception;
	public NoRegisterUser getUser(String uesrname)throws Exception;
}
