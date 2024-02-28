package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.Fournisseur;
import Models.Classes.Produit;

public class SQLProduit_Fournisseur {

	public static int AddProduit_fournisseur(Produit prod, int id_fournisseur) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();

		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");

			String sql = "INSERT INTO `Produit_fournisseur`(`id_Fournisseur`, `id_Produit`, `Quantite_Prod`, `valide`, `date`,Montant)"
					+ "VALUES  (?,?,?,?,curdate(),?)";
			PreparedStatement PS = conn.prepareStatement(sql);

			PS.setInt(1, id_fournisseur);
			PS.setInt(2, prod.getId_Produit());
			PS.setDouble(3, prod.getQuantite());
			PS.setBoolean(4, false);
			PS.setInt(5, (int) (prod.getQuantite() * prod.getPrix()));
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
				Fournisseur Fourni = SQLFournisseur.getFournisseur(RS.getInt(1));

				// this is to get all the products of the Fournisseur
				String sql2 = "SELECT * FROM `produit_fournisseur` WHERE id_Fournisseur=?";
				PreparedStatement PS2 = con.prepareStatement(sql2);
				PS2.setInt(1, RS.getInt(1));
				ResultSet RS2 = PS2.executeQuery();
				while (RS2.next()) {
					Fourni.addProduit(SQLProduit.getProduitById(RS2.getInt(2)));
				}

				List.add(Fourni);
			}
			con.close();
		} catch (SQLException e) {

			System.err.println(e);
		}

		return List;
	}

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

			System.err.println(e);
		}

		return st;
	}

}
