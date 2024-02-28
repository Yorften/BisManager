package Controler.Servlets.Fournisseur;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLFournisseur;
import Models.Classes.Fournisseur;



/**
 * Servlet implementation class FournisseurServlet
 */
@WebServlet("/fournisseur")
public class addFournisseurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
			String Nom =request.getParameter("Nom");
			String Prenom=request.getParameter("Prenom");	
			String Entreprise  =request.getParameter("Entreprise");	
			String email = request.getParameter("email");
			int capital = Integer.parseInt(request.getParameter("capital"));
			String Tel = request.getParameter("Tel");
			String fax = request.getParameter("fax");
			String adresse = request.getParameter("adresse");
			String pays = request.getParameter("pays");
			System.out.println(request.getParameter("contryyy"));
			
			RequestDispatcher dispatcher = null ;
			Fournisseur Four=new Fournisseur(Nom , Prenom,  Entreprise, email, capital ,Tel,  fax, adresse,  pays);
			int num=SQLFournisseur.AddFournisseur(Four);
			
			try {

				dispatcher = request.getRequestDispatcher("addFournisseur");
				if (num > 0) {
					request.setAttribute("status", "success");
					 
				}else {
					request.setAttribute("status", "failed");
				}
				dispatcher.forward(request,response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		
	}


}
		
	


