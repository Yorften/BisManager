package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.Fournisseur;
import Models.Classes.Produit;
import Models.Classes.Produit_Fournisseur;

public class SQLFournisseur {

	public static int AddFournisseur(Fournisseur fournisseur) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();

		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");

			String sql = "INSERT INTO fournisseur(Nom,Prenom,Entreprise,Email, Capital, tel, fax, adresse, pays) VALUES  (?,?,?,?,?,?,?,?,?)";
			PreparedStatement PS = conn.prepareStatement(sql);

			PS.setString(1, fournisseur.getNom());
			PS.setString(2, fournisseur.getPrenom());
			PS.setString(3, fournisseur.getEntreprise());
			PS.setString(4, fournisseur.getEmail());
			PS.setInt(5, fournisseur.getCapital());
			PS.setString(6, fournisseur.getTel());
			PS.setString(7, fournisseur.getFax());
			PS.setString(8, fournisseur.getAdresse());
			PS.setString(9, fournisseur.getPays());

			st = PS.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}

		return st;
	}

	public static int UpdateFournisseur(Fournisseur fournisseur) {
		int st = 0;
		try {
			String sql = "UPDATE `fournisseur` SET `Nom`=?,`Prenom`=?,`Entreprise`=?,`Email`=?,`Capital`=?,`tel`=?,`fax`=?,`adresse`=?,`pays`=? WHERE Id_fournisseur=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);

			PS.setString(1, fournisseur.getNom());
			PS.setString(2, fournisseur.getPrenom());
			PS.setString(3, fournisseur.getEntreprise());
			PS.setString(4, fournisseur.getEmail());
			PS.setInt(5, fournisseur.getCapital());
			PS.setString(6, fournisseur.getTel());
			PS.setString(7, fournisseur.getFax());
			PS.setString(8, fournisseur.getAdresse());
			PS.setString(9, fournisseur.getPays());

			PS.setLong(10, fournisseur.getId_fournisseur());

			st = PS.executeUpdate();

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}

		return st;
	}

	public static int DeleteFournisseur(int id_Fournisseur) {
		int st = 0;
		try {
			String sql = "DELETE FROM `fournisseur` WHERE Id_fournisseur=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setLong(1, id_Fournisseur);

			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}

		return st;
	}

	public static Fournisseur getFournisseur(int id_fournisseur) {
		Fournisseur fournisseur = new Fournisseur();
		try {
			String sql = "SELECT *FROM `fournisseur` WHERE Id_fournisseur=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setInt(1, id_fournisseur);
			ResultSet RS = PS.executeQuery();

			if (RS.next()) {

				fournisseur.setId_fournisseur(RS.getInt(1));
				fournisseur.setNom(RS.getString(2));
				fournisseur.setPrenom(RS.getString(3));
				fournisseur.setEntreprise(RS.getString(4));
				fournisseur.setEmail(RS.getString(5));
				fournisseur.setCapital(RS.getInt(6));
				fournisseur.setTel(RS.getString(7));
				fournisseur.setFax(RS.getString(8));
				fournisseur.setAdresse(RS.getString(9));
				fournisseur.setPays(RS.getString(10));

			}

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}

		return fournisseur;
	}

	public static List<Fournisseur> getListOfFournisseurs() {
		List<Fournisseur> List = new ArrayList<Fournisseur>();
		try {
			String sql = "SELECT *FROM `Fournisseur`";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {
				Fournisseur fournisseur = new Fournisseur();
				fournisseur.setId_fournisseur(RS.getInt(1));
				fournisseur.setNom(RS.getString(2));
				fournisseur.setPrenom(RS.getString(3));
				fournisseur.setEntreprise(RS.getString(4));
				fournisseur.setEmail(RS.getString(5));
				fournisseur.setCapital(RS.getInt(6));
				fournisseur.setTel(RS.getString(7));
				fournisseur.setFax(RS.getString(8));
				fournisseur.setAdresse(RS.getString(9));
				fournisseur.setPays(RS.getString(10));

				List.add(fournisseur);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}

		return List;
	}

	/*
	 * this method return ALL products which a provider(fournisseur) have
	 */
	public static Fournisseur getProduitFournisseur(int id_fournisseur) {
		Fournisseur fourn = SQLFournisseur.getFournisseur(id_fournisseur);

		try {
			String sql = "SELECT * FROM `produit_fournisseur` WHERE Id_fournisseur=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setInt(1, id_fournisseur);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {			
				Produit produit = SQLProduit.getProduitById(RS.getInt(2));
				produit.setQuantite(RS.getInt(3));
				produit.setPrix_Total(produit.getPrix() * produit.getQuantite());
				Produit_Fournisseur prod_forni = new Produit_Fournisseur(produit, fourn, RS.getInt(3));
				prod_forni.setDate(RS.getDate(5));
				prod_forni.setValide(RS.getBoolean(4));
				fourn.getProd_Four().add(prod_forni);

			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}
		return fourn;

	}

}
