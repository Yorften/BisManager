package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.Categorie;

public class SQLCategorie {

	public static int addCategorie(Categorie catg) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();
		try {
			String sql = "INSERT INTO `categorie`(`categorie`)" + "VALUES  (?)";
			PreparedStatement PS = conn.prepareStatement(sql);
			PS.setString(1, catg.getDesignation());
			st = PS.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}
		return st;
	}

	public static int DeleteCategorie(String Designation) {
		int st = 0;
		try {
			String sql = "DELETE FROM `categorie` WHERE `categorie`=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setString(1, Designation);
			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return st;
	}

	public static Categorie getCategorie(String Desegnation) {
		Categorie Categorie = new Categorie();
		try {
			String sql = "SELECT *FROM `Categorie` WHERE Categorie=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setString(1, Desegnation);
			ResultSet RS = PS.executeQuery();

			if (RS.next()) {
				Categorie.setDesignation(RS.getString(1));
			}

			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return Categorie;
	}

	public static List<Categorie> getListOfCategories() {
		List<Categorie> List = new ArrayList<Categorie>();
		try {
			String sql = "SELECT *FROM `Categorie`";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {
				Categorie Categorie = new Categorie();
				Categorie.setDesignation(RS.getString(1));
				Categorie.setQuntite_Produit(CategorieProduitsQuantite(RS.getString(1)));
				List.add(Categorie);
			}
			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return List;
	}

	public static int CategorieProduitsQuantite(String Categorie) {
		int Quant = 0;
		try {
			String sql = "SELECT *FROM `Produit` where Categorie=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setString(1, Categorie);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {
			Quant++;
			}
			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}
		return Quant;
	}

}
