package Controler.Servlets.Produit;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SqlConnection;

@WebServlet("/GetImage")
public class GetImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int id = Integer.parseInt(request.getParameter("id"));
    	Connection con =SqlConnection.getConnection(); //get your connection object here		
    	ResultSet rs =null;
    	PreparedStatement pstmt = null;
    	OutputStream oImage;
    	try {
    	pstmt = con.prepareStatement("SELECT  image FROM `produit` WHERE id_Produit=?");
    	pstmt.setInt(1, id);
    	rs = pstmt.executeQuery();
    	    if(rs.next()) {
    	        byte barray[] = rs.getBytes(1);
    	        response.setContentType("image/gif");
    	        oImage=response.getOutputStream();
    	        oImage.write(barray);
    	        oImage.flush();
    	        oImage.close();
    	    }
    	}
    	catch(Exception ex){
    	    ex.printStackTrace();
    	
    	}
    
    
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
