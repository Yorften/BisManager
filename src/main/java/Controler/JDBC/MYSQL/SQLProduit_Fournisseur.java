package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.Fournisseur;
import Models.Classes.Produit;
import Models.Classes.Produit_Fournisseur;

public class SQLProduit_Fournisseur {

	public static int AddProduit_fournisseur(Produit prod, int id_fournisseur, Date date) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();

		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");

			String sql = "INSERT INTO `Produit_fournisseur`(`id_Fournisseur`, `id_Produit`, `Quantite_Prod`, `valide`, `date`,`Montant`)"
					+ "VALUES  (?,?,?,?,?,?)";
			PreparedStatement PS = conn.prepareStatement(sql);

			PS.setInt(1, id_fournisseur);
			PS.setInt(2, prod.getId_Produit());
			PS.setDouble(3, prod.getQuantite());
			PS.setBoolean(4, false);
			PS.setDate(5, date);
			PS.setInt(6, (int) (prod.getQuantite() * prod.getPrix()));
			st = PS.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}

		return st;
	}

	public static List<Fournisseur> getListOfFourni_Fournisseur() {
		List<Fournisseur> List = new ArrayList<Fournisseur>();
		try {
			String sql = "SELECT DISTINCT id_Fournisseur  FROM `produit_fournisseur` ";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {
				Fournisseur Fourni = SQLFournisseur.getProduitFournisseur(RS.getInt(1));
				List.add(Fourni);
			}
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return List;
	}

    //delete all products that a fournisseur have
	public static int DeleteProduits_Forni(int id_Fournisseur) {
		int st = 0;
		try {
			String sql = "DELETE FROM `produit_fournisseur` WHERE id_Fournisseur=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setLong(1, id_Fournisseur);
			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return st;
	}

    //delete only a one Product each time
	public static int DeleteProduit_Forni(int id_Produit) {
		int st = 0;
		try {
			String sql = "DELETE FROM `produit_fournisseur` WHERE id_Produit=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setLong(1, id_Produit);
			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return st;
	}

	public static int EditProduitValidation(int id_Produit,Boolean Validation) {
		int st = 0;
		try {
			String sql = "UPDATE `produit_fournisseur` SET `valide`=? WHERE id_Produit=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);			
			PS.setBoolean(1, Validation);
			PS.setLong(2, id_Produit);			
			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return st;
	}

	
	public static List<Produit_Fournisseur> getAchates() {
		List<Produit_Fournisseur> List = new ArrayList<Produit_Fournisseur>();
		try {
			String sql = "SELECT * FROM `produit_fournisseur`";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {
				Fournisseur Fourn = SQLFournisseur.getFournisseur(RS.getInt(1));
				Produit prod = SQLProduit.getProduitById(RS.getInt(2));
				int Quantite = Integer.parseInt(RS.getString(3));

				Produit_Fournisseur prod_forni = new Produit_Fournisseur(prod, Fourn, Quantite);
				prod_forni.setDate(RS.getDate(5));
				prod_forni.setValide(RS.getBoolean(4));

				List.add(prod_forni);
			}
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return List;

	}

}
