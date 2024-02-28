package Controler.JDBC.MYSQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Classes.Client;


public class SQLClinet {
	
	public static int AddClinet(Client client) {
		int st=0;
		Connection conn=SqlConnection.getConnection();
		
		try {
			// Class.forName("com.mysql.cj.jdbc.Driver");
			
			String sql ="INSERT INTO `client`(`Nom`, `Prenom`, `Code_Postal`, `Email`, `Adresse`, `Pays`, `ville`, `tel`)"
					   +"VALUES  (?,?,?,?,?,?,?,?)"; 
			PreparedStatement PS=conn.prepareStatement(sql);
			
			PS.setString(1,client.getNom());
			PS.setString(2,client.getPrenom());			
			PS.setLong(3,client.getCode_Postal());
			PS.setString(4,client.getEmail());
			PS.setString(5,client.getAdresse());
			PS.setString(6,client.getPays() );
			PS.setString(7,client.getVille());
			PS.setString(8,client.getTel());
			
            st=PS.executeUpdate();
            conn.close();
		} catch (SQLException e) {
			System.err.println(e);
		    e.printStackTrace();
		}
		
		return st;
		}
	
	public static int UpdateClient(Client client) {
		int st=0;
		try {
			String sql="UPDATE `client` SET `Nom`=?,`Prenom`=?,`Code_Postal`=?,`Email`=?,"
					+ "`Adresse`=?,`Pays`=?,`ville`=?,`tel`=? WHERE Id_Client=?"; 
			Connection con=SqlConnection.getConnection();
			PreparedStatement PS=con.prepareStatement(sql);					
			PS.setString(1,client.getNom());
			PS.setString(2,client.getPrenom());			
			PS.setLong(3,client.getCode_Postal());
			PS.setString(4,client.getEmail());
			PS.setString(5,client.getAdresse());
			PS.setString(6,client.getPays() );
			PS.setString(7,client.getVille());
			PS.setString(8,client.getTel());
			
			PS.setLong(9,client.getId_Client());
			
        st=PS.executeUpdate();
        con.close();
		} catch (SQLException e) {
			System.err.println(e);
		}
		
		return st;
	}

	

	public static int DeleteClient(int id_clinet) {
		int st=0;
		try {
			String sql="DELETE FROM `client` WHERE id_Client=?"; 
			Connection con=SqlConnection.getConnection();
			PreparedStatement PS=con.prepareStatement(sql);
			PS.setLong(1,id_clinet);
			
        st=PS.executeUpdate();
        con.close();
		} catch (SQLException e) {
			
			System.err.println(e);
		}
		
		return st;
	}

	
	public static Client getClient(int id_client) {
		Client client =new Client();
		try {
			String sql="SELECT *FROM `client` WHERE id_Client=?"; 
			Connection con=SqlConnection.getConnection();
			PreparedStatement PS=con.prepareStatement(sql);
			PS.setInt(1,id_client);
			ResultSet	RS=PS.executeQuery(); 
       
			if(RS.next()) {
				client.setId_Client(RS.getInt(1));
				client.setNom(RS.getString(2));
				client.setPrenom(RS.getString(3));				
				client.setCode_Postal(RS.getInt(4));
				client.setEmail(RS.getString(5));
				client.setAdresse(RS.getString(6));
				client.setPays(RS.getString(7));
				client.setVille(RS.getString(8));
				client.setTel(RS.getString(9));
				
			}
			
			
			con.close();
		} catch (SQLException e) {
			
		    System.err.println(e);
		}
		
		return client;
		}
	public static List<Client> getListOfClients() {
		 List<Client> List =new ArrayList<Client>();
		try {
			String sql="SELECT *FROM `client`"; 
			Connection con=SqlConnection.getConnection();
			PreparedStatement PS=con.prepareStatement(sql);
			ResultSet	RS=PS.executeQuery(); 
      
			while(RS.next()) {
			  Client client=new Client(); 
			  client.setId_Client(RS.getInt(1));
				client.setNom(RS.getString(2));
				client.setPrenom(RS.getString(3));				
				client.setCode_Postal(RS.getInt(4));
				client.setEmail(RS.getString(5));
				client.setAdresse(RS.getString(6));
				client.setPays(RS.getString(7));
				client.setVille(RS.getString(8));
				client.setTel(RS.getString(9));
			
			 List.add(client);
			}
			con.close();
		} catch (SQLException e) {
			
			System.err.println(e);
		}
		
		return List;
		}
	
	
	
	


}
