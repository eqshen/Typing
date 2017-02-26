package app.type.dao.proxy;

import app.type.bean.NoRegisterUser;
import app.type.dao.INoRegisterUserDao;
import app.type.dao.impl.NoRegisterUserDaoImpl;
import app.type.dbc.DatabaseConnection;

public class NoRegisterUserDaoProxy implements INoRegisterUserDao {
	private DatabaseConnection dbc=null;
	private INoRegisterUserDao dao=null;
	public NoRegisterUserDaoProxy() throws Exception {
		this.dbc=new DatabaseConnection();
		this.dao=new NoRegisterUserDaoImpl(this.dbc.getConnection());
	}
	@Override
	public boolean addUser(NoRegisterUser info) throws Exception {
		boolean flag=false;
		try {
			flag=this.dao.addUser(info);
		} catch (Exception e) {
			throw e;
		}finally{
			if(this.dbc!=null){
				this.dbc.close();
			}
		}
		return flag;
	}

	@Override
	public boolean deleteUser(String uesrname) throws Exception {
		boolean flag=false;
		try {
			flag=this.dao.deleteUser(uesrname);
		} catch (Exception e) {
			throw e;
		}finally{
			if(this.dbc!=null){
				this.dbc.close();
			}
		}
		return flag;
	}

	@Override
	public NoRegisterUser getUser(String uesrname) throws Exception {
		NoRegisterUser info=null;
		try {
			info=this.dao.getUser(uesrname);
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
