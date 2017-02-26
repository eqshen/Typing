package app.type.dbc;

import java.sql.Connection;
//import java.sql.DriverManager;

//import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DatabaseConnection {
	private static final String DSNAME = "java:comp/env/jdbc/TypingDataSource";
	private static final String DBDRIVER = "com.mysql.jdbc.Driver";
	// private static final String DBURL =
	// "jdbc:mysql://test1.server:3306/kqsystem_dev";
	// private static final String DBUSER = "root";
	// private static final String DBPASSWORD = ""; // for mysql
	private Connection conn = null;

	public DatabaseConnection() throws Exception {
		try {
			Class.forName(DBDRIVER);
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup(DSNAME);
			this.conn = ds.getConnection();
		} catch (Exception e) {
			throw e;
		}
	}

	public Connection getConnection() {
		return this.conn;
	}

	public void close() throws Exception {
		if (this.conn != null) {
			try {
				this.conn.close();
			} catch (Exception e) {
				throw e;
			}
		}
	}
}
