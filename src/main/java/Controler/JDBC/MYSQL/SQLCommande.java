package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.Commande;

public class SQLCommande {

	public static int AddCommande(Commande commande) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();

		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");

			String sql = "INSERT INTO `commande`(`Id_Client`, `Addresse_Cmd`, `Date_cmd`, `Montant`, `Validtion`)"
					+ "VALUES  (?,?,?,?,?)";
			PreparedStatement PS = conn.prepareStatement(sql);

			PS.setInt(1, commande.getId_Client());
			PS.setString(2, commande.getAddresse_Cmd());
			PS.setDate(3, (Date) commande.getDate_cmd());
			PS.setDouble(4, commande.getMontant());
			PS.setBoolean(5, commande.isValidtion());
			st = PS.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}

		return st;
	}

	public static int UpdateCommande(Commande commande) {
		int st = 0;
		try {
			String sql = "UPDATE `Commande` SET `Id_Client`=?,`Addresse_Cmd`=?,`Date_cmd`=?,`Montant`=?,"
					+ "`Validtion`=? WHERE Id_cmd=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setInt(1, commande.getId_Client());
			PS.setString(2, commande.getAddresse_Cmd());
			PS.setDate(3, (Date) commande.getDate_cmd());
			PS.setDouble(4, commande.getMontant());
			PS.setBoolean(5, commande.isValidtion());

			PS.setLong(6, commande.getId_cmd());

			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}

		return st;
	}

	public static int DeleteCommande(int id_cmd) {
		int st = 0;
		try {
			String sql = "DELETE FROM `Commande` WHERE id_cmd=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setLong(1, id_cmd);

			st = PS.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}

		return st;
	}

	public static Commande getCommande(int id_cmd) {
		Commande commande = new Commande();
		try {
			String sql = "SELECT *FROM `Commande` WHERE id_cmd=?";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setInt(1, id_cmd);
			ResultSet RS = PS.executeQuery();

			if (RS.next()) {
				commande.setId_cmd(RS.getInt(1));
				commande.setClient(SQLClinet.getClient(RS.getInt(2)));
				commande.setId_Client(RS.getInt(2));
				commande.setAddresse_Cmd(RS.getString(3));
				commande.setDate_cmd(RS.getDate(4));
				commande.setValidtion(RS.getBoolean(6));

			}

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}

		return commande;
	}

	public static List<Commande> getListOfCommandes() {
		List<Commande> List = new ArrayList<Commande>();
		try {
			String sql = "SELECT *FROM `Commande`";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			ResultSet RS = PS.executeQuery();

			while (RS.next()) {
				Commande commande = new Commande();
				commande.setId_cmd(RS.getInt(1));
				commande.setId_Client(RS.getInt(2));
				commande.setAddresse_Cmd(RS.getString(3));
				commande.setDate_cmd(RS.getDate(4));
				commande.setMontant(RS.getInt(5));
				commande.setValidtion(RS.getBoolean(6));

				commande.setClient(SQLClinet.getClient(RS.getInt(2)));

				List.add(commande);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}

		return List;
	}

	public static Commande getCommandeDetails(int id_cmd) {
		Commande commande = getCommande(id_cmd);
		Connection con = SqlConnection.getConnection();

		try {
			String sql = "SELECT *FROM `commande_produit` WHERE id_cmd=?";
			PreparedStatement PS = con.prepareStatement(sql);
			PS.setInt(1, id_cmd);
			ResultSet RS = PS.executeQuery();
			while (RS.next()) {
				commande.addProduitToCommande(SQLProduit.getProduitById(RS.getInt(2)));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println(e);
		}
		return commande;
	}

}
