package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import Models.Classes.Commande;
import Models.Classes.Produit_Commande;

public class SQLProduit_Cmd {

	public static int AddProduitCmd(Commande commande) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();
		List<Produit_Commande> Prod_cmd = commande.getProd_Cmd();

		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");
			for (Produit_Commande PC : Prod_cmd) {
				String sql = "INSERT INTO `commande_produit`(`id_cmd`, `id_Produit`, `Quantite_cmd`)"
						+ "VALUES  (?,?,?)";
				PreparedStatement PS = conn.prepareStatement(sql);
				PS.setInt(1, commande.getId_cmd());
				PS.setInt(2, PC.getProduit_cmd().getId_Produit());
				PS.setInt(3, PC.getQuantite_Cmd());
				st = PS.executeUpdate();
				if (st != 1)
					break;
			}

			conn.close();
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}

		return st;
	}

	public static int deleteProduitCmd(Commande commande) {
		int st = 0;
		Connection conn = SqlConnection.getConnection();
		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");
			String sql = "DELETE FROM `commande_produit` WHERE id_cmd=?";
			PreparedStatement PS = conn.prepareStatement(sql);
			PS.setInt(1, commande.getId_cmd());
			st = PS.executeUpdate();

			conn.close();
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}

		return st;
	}

}
