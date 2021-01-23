package book;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.transform.Result;

import org.omg.CORBA.PUBLIC_MEMBER;




public class DBUtil {
	static String driver="com.mysql.jdbc.Driver";
	static String user="root";
	static String password="123456";
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//¾²Ì¬´úÂë¶Î
	
}
	

	public static Connection connect(String dbname) {
		Connection conn=null;
		String url="jdbc:mysql://localhost:3306/" + dbname
				+ "?useUnicode=true&&characterEncoding=utf-8";
		try {
			conn=DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
		
		public static void closeJDBC(ResultSet rs,java.sql.Statement stmt,Connection conn)
		{
			if(rs!=null)
			{
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
	}
	

