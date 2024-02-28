package Controler.JDBC.MYSQL;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.Part;

import Models.Classes.informations;

public class SQLinformations {

	@SuppressWarnings("resource")
	public static int updateInformation(informations info) {
		int num = 0;
		PreparedStatement PS;
		Connection conn = SqlConnection.getConnection();
		ResultSet RS;
		try {
			String sql1 = "SELECT * FROM `entreprise_info`";
			PS = conn.prepareStatement(sql1);
			RS = PS.executeQuery();
			if (RS.next()) {
				String sql2 = "UPDATE `entreprise_info` SET `Nom`=?,`Adresse`=?,`Raison Social`=?,"
						+ "`Capiltal`=?,`Email`=?,`Tel`=?,`Fax`=? WHERE `Nom`=?";
				PS = conn.prepareStatement(sql2);
				PS.setString(1, info.getNom());
				PS.setString(2, info.getAdresse());
				PS.setString(3, info.getRaison());
				PS.setDouble(4, info.getCapiltal());
				PS.setString(5, info.getEmail());
				PS.setString(6, info.getTel());
				PS.setString(7, info.getFax());
				PS.setString(8, RS.getString(2));			
				num = PS.executeUpdate();
				PS.close();
			} else {
				String sql3 = "INSERT INTO `entreprise_info`(`Nom`, `Adresse`, `Raison Social`, `Capiltal`,"
						+ " `Email`, `Tel`, `Fax`) VALUES(?,?,?,?,?,?,?)";
				PS = conn.prepareStatement(sql3);
				PS.setString(1, info.getNom());
				PS.setString(2, info.getAdresse());
				PS.setString(3, info.getRaison());
				PS.setDouble(4, info.getCapiltal());
				PS.setString(5, info.getEmail());
				PS.setString(6, info.getTel());
				PS.setString(7, info.getFax());
				num = PS.executeUpdate();
				PS.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return num;
	}

	public static informations getinfos() {
		informations info = new informations();		 
		
		try {
			Connection conn = SqlConnection.getConnection();
			String sql1 = "SELECT * FROM `entreprise_info`";
			PreparedStatement	PS = conn.prepareStatement(sql1);
			ResultSet	RS = PS.executeQuery();
			if(RS.next()) {
			info.setNom(RS.getString(2));
			info.setAdresse(RS.getString(3));
			info.setRaison(RS.getString(4));
			info.setCapiltal(RS.getDouble(5));
			info.setEmail(RS.getString(6));
			info.setTel(RS.getString(7));
			info.setFax(RS.getString(8));
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}

		return info;
	}
	
	public static int addLogoImage(Part img) {
		int check=0;
		FileInputStream input=null;	  
		try {

			String sql = "UPDATE `entreprise_info` SET `Logo`=? where `code`='0'";
			Connection con = SqlConnection.getConnection();
			PreparedStatement PS = con.prepareStatement(sql);
			 input  =(FileInputStream) img.getInputStream();
			
			PS.setBlob(1, input);

			check = PS.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return check;
	}

}
