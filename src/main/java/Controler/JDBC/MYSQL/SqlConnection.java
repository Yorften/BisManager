package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection {

	
		public static Connection getConnection() {
			 Connection con=null;
	        try {
				 Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/gestion","AdminUser","belcaid2001");					
			} catch (SQLException | ClassNotFoundException e) {
				System.err.println(e);
				e.printStackTrace();
			} 	
		return con;	
		}
	
	

}
