package Controler.JDBC.MYSQL;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.Produit;

public class SQLProduit {

	public static int AddProduit(Produit Produit) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();

		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");

			String sql = "INSERT INTO `produit`(`Desegnation`, `Categorie`, `Prix`, `Quantite`, `TVA`,`Prix_Total`) "
					+ "VALUES  (?,?,?,?,?,?)";
			PreparedStatement PS = conn.prepareStatement(sql);

			PS.setString(1, Produit.getDesegnation());
			PS.setString(2, Produit.getCategorie());
			PS.setDouble(3, Produit.getPrix());
			PS.setDouble(4, Produit.getQuantite());
			PS.setDouble(5, Produit.getTVA());			
			PS.setDouble(6, Produit.getPrix() * Produit.getQuantite());			
			st = PS.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}

		return st;
	}

	public static int UpdateProduit(Produit Produit) {
		int st = 0;
		try {
			String sql = "UPDATE `Produit` SET `Desegnation`=?,`Categorie`=?,`Prix`=?,`Quantite`=?, `TVA`=? , `Prix_Total`=?"
					+ "WHERE Id_Produit=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setString(1, Produit.getDesegnation());
			PS.setString(2, Produit.getCategorie());
			PS.setDouble(3, Produit.getPrix());
			PS.setDouble(4, Produit.getQuantite());
			PS.setDouble(5, Produit.getTVA());
			PS.setDouble(6, Produit.getPrix() * Produit.getQuantite());
			PS.setLong(7, Produit.getId_Produit());

			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {
			System.err.println(e);
		}

		return st;
	}

	public static int DeleteProduit(int id_Produit) {
		int st = 0;
		try {
			String sql = "DELETE FROM `Produit` WHERE id_Produit=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setLong(1, id_Produit);

			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return st;
	}

	public static Produit getProduitById(int id_Produit) {
		Produit Produit = new Produit();
		try {
			String sql = "SELECT *FROM `Produit` WHERE id_Produit=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setInt(1, id_Produit);
			ResultSet RS = PS.executeQuery();

			if (RS.next()) {
				Produit.setId_Produit(RS.getInt(1));
				Produit.setDesegnation(RS.getString(2));
				Produit.setCategorie(RS.getString(3));
				Produit.setPrix(RS.getDouble(4));
				Produit.setQuantite(RS.getDouble(5));
				Produit.setTVA(RS.getDouble(6));
				Produit.setImg(RS.getBlob(7));
				Produit.setPrix_Total(RS.getDouble(8));
			}

			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return Produit;
	}

	public static List<Produit> getListOfProduits() {
		List<Produit> List = new ArrayList<Produit>();
		try {
			String sql = "SELECT *FROM `Produit`";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {
				Produit Produit = new Produit();
				Produit.setId_Produit(RS.getInt(1));
				Produit.setDesegnation(RS.getString(2));
				Produit.setCategorie(RS.getString(3));
				Produit.setPrix(RS.getDouble(4));
				Produit.setQuantite(RS.getDouble(5));
				Produit.setTVA(RS.getDouble(6));
				Produit.setImg(RS.getBlob(7));
				Produit.setPrix_Total(RS.getDouble(8));
				List.add(Produit);
			}
			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return List;
	}

	public int insertImageProduit(File img, int id) {
		int st = 0;
		try {

			String sql = "update `produit` set  `image`=? where id_produit=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			FileInputStream f = new FileInputStream(img);
			PS.setInt(1, id);
			PS.setBinaryStream(2, (InputStream) f, (int) (img.length()));

			st = PS.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return st;
	}

}
