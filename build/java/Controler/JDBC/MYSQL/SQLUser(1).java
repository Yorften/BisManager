package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.User;

public class SQLUser {

	

	public static int AddUser(User User) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();

		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");
			String sql = "INSERT INTO `users`(`UserName`, `Password`, `Email`, `active`, `role`)VALUES (?,?,?,?,?)";
			PreparedStatement PS = conn.prepareStatement(sql);
			PS.setString(1,User.getUserName());		
			PS.setString(2,User.getPassword());
			PS.setString(3,User.getEmail());
			PS.setBoolean(4,User.isActive());
			PS.setString(5,User.getRole());
			st = PS.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}

		return st;
	}

	public static int UpdateUser(User User) {
		int st = 0;
		try {
			String sql = "UPDATE `users` SET `UserName`=?,`Password`=?,`Email`=?,`active`=?,`role`=?"					
					+ "WHERE Id_User=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setString(1,User.getUserName());		
			PS.setString(2,User.getPassword());
			PS.setString(3,User.getEmail());
			PS.setBoolean(4,User.isActive());
			PS.setString(5,User.getRole());
			PS.setInt(6, User.getId_user());

			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {
			System.err.println(e);
		}

		return st;
	}

	public static int DeleteUser(int id_User) {
		int st = 0;
		try {
			String sql = "DELETE FROM `users` WHERE id_user=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setLong(1, id_User);
			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return st;
	}

	public static User getUserById(int id_User) {
		User User = new User();
		try {
			String sql = "SELECT *FROM `users` WHERE id_User=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setInt(1, id_User);
			ResultSet RS = PS.executeQuery();

			if (RS.next()) {
				User.setId_user(RS.getInt(1));
				User.setUserName(RS.getString(2));
				User.setPassword(RS.getString(3));
				User.setEmail(RS.getString(4));
				User.setActive(RS.getBoolean(5));
				User.setRole(RS.getString(6));
				
			}

			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return User;
	}

	public static List<User> getListOfUsers() {
		List<User> List = new ArrayList<User>();
		try {
			String sql = "SELECT *FROM `users`";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {
				User User = new User();
				User.setId_user(RS.getInt(1));
				User.setUserName(RS.getString(2));
				User.setPassword(RS.getString(3));
				User.setEmail(RS.getString(4));
				User.setActive(RS.getBoolean(5));
				User.setRole(RS.getString(6));
				List.add(User);
			}
			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return List;
	}

	
	
	
}
