package bbsModel1;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public DBConnect() {}
	
	public Connection getConnection()
	{
		Connection conn = null;
		try {
			Class.forName("org.apache.commons.dbcp.PoolingDriver");
			conn = DriverManager.getConnection
					("jdbc:apache:commons:dbcp:/wdbpool");
			
			if(conn==null)
			{
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return conn;
	}
}
