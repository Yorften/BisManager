package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.Facture;

public class SQLFacture {
	
	
	public static int AddFacture(int id_cmd) {
		int st=0;
	Connection conn=SqlConnection.getConnection();	
	PreparedStatement PS;
	try {		
		 String sql ="INSERT INTO `facture`(`Id_cmd`) "
				   +"VALUES  (?)";		 
	     PS = conn.prepareStatement(sql);	
	     PS.setInt(1,id_cmd);	     	     
	     st=PS.executeUpdate();
         conn.close();		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}										
	    return st;	
	}
	

	public static int DeleteFacture(int id_Facture) {
		int st=0;
		try {
			String sql="DELETE FROM `Facture` WHERE id_Facture=?"; 
			Connection con=SqlConnection.getConnection();
			PreparedStatement PS=con.prepareStatement(sql);
			PS.setLong(1,id_Facture);
			
        st=PS.executeUpdate();
        con.close();
		} catch (SQLException e) {
			
			System.err.println(e);
		}
		
		return st;
	}

	
	public static Facture getFactureById(int id_Facture) {
		Facture Facture =new Facture();
		try {
			String sql="SELECT *FROM `Facture` WHERE id_Facture=?"; 
			Connection con=SqlConnection.getConnection();
			PreparedStatement PS=con.prepareStatement(sql);
			PS.setInt(1,id_Facture);
			ResultSet	RS=PS.executeQuery(); 
       
			if(RS.next()) {
				Facture.setId_facture(RS.getInt(1));
				Facture.setCmd(SQLCommande.getCommandeDetails(RS.getInt(2)));
				}					
			con.close();
		} catch (SQLException e) {
			
		    System.err.println(e);
		}
		
		return Facture;
		}
	public static List<Facture> getListOfFactures() {
		 List<Facture> List =new ArrayList<Facture>();
		try {
			String sql="SELECT *FROM `Facture`"; 
			Connection con=SqlConnection.getConnection();
			PreparedStatement PS=con.prepareStatement(sql);
			ResultSet	RS=PS.executeQuery(); 
      
			while(RS.next()) {
			  Facture facture=new Facture(); 
			    facture.setId_facture(RS.getInt(1));
				facture.setCmd(SQLCommande.getCommandeDetails(RS.getInt(2)));
				List.add(facture);
			}
			con.close();
		} catch (SQLException e) {
			
			System.err.println(e);
		}
		
		return List;
		}

	
	//this methode checks if there is a duplication of cmd in facture table
	public static boolean checkDuplicatCmd(int id_Cmd) {
		boolean check=false;
		try {
			String sql="SELECT *FROM `Facture` WHERE id_cmd=?"; 
			Connection con=SqlConnection.getConnection();
			PreparedStatement PS=con.prepareStatement(sql);
			PS.setInt(1,id_Cmd);
			ResultSet	RS=PS.executeQuery(); 
			if(RS.next()) {
				check=true;
				}					
			con.close();
		} catch (SQLException e) {
			
		    System.err.println(e);
		}
		
		return check;
		}
	
	
	
	

}
