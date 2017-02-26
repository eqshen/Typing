package app.type.factory;

import app.type.dao.IArticleInfoDao;
import app.type.dao.INoRegisterUserDao;
import app.type.dao.IUserInfoDao;
import app.type.dao.proxy.ArticleInfoDaoProxy;
import app.type.dao.proxy.NoRegisterUserDaoProxy;
import app.type.dao.proxy.UserInfoDaoProxy;

public class DaoFactory {
	public static IUserInfoDao getUserInfoDaoInstance() throws Exception{
		return new UserInfoDaoProxy();
	}
	public static IArticleInfoDao getArticleInfoDaoInstance() throws Exception{
		return new ArticleInfoDaoProxy();
	}
	public static INoRegisterUserDao getNoRegisterUserDaoInstance()throws Exception{
		return new NoRegisterUserDaoProxy();
	}
}
