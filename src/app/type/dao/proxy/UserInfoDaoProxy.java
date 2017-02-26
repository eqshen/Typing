package app.type.dao.proxy;

import app.type.bean.UserInfo;
import app.type.dao.IUserInfoDao;
import app.type.dao.impl.UserInfoDaoImpl;
import app.type.dbc.DatabaseConnection;

public class UserInfoDaoProxy  implements IUserInfoDao{
	private DatabaseConnection dbc=null;
	private IUserInfoDao dao=null;
	public  UserInfoDaoProxy() throws Exception {
		this.dbc=new DatabaseConnection();
		this.dao=new UserInfoDaoImpl(this.dbc.getConnection());
	}
	@Override
	public UserInfo getUserByName(String username) throws Exception {
		UserInfo info=null;
		try {
			info=this.dao.getUserByName(username);
		} catch (Exception e) {
			throw e;
		}finally{
			if(this.dbc!=null){
				this.dbc.close();
			}
		}
		return info;
	}

}
