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
 * Servlet implementation class UpdateFournisseur
 */
@WebServlet("/UpdateFournisseur")
public class UpdateFournisseur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFournisseur() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);	
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
		response.setContentType("text/html");
		int Id_fournisseur=Integer.parseInt(request.getParameter("Id_fournisseur"));
		String Nom =request.getParameter("Nom");
		String Prenom=request.getParameter("Prenom");	
		String Entreprise  =request.getParameter("Entreprise");	
		String email = request.getParameter("email");
		int capital = Integer.parseInt(request.getParameter("capital"));
		String Tel = request.getParameter("Tel");
		String Fax = request.getParameter("Fax");
		String adresse = request.getParameter("adresse");
		String Pays = request.getParameter("Pays");
		
		
		RequestDispatcher dispatcher = null ;
		Fournisseur Four=new Fournisseur(Nom , Prenom,  Entreprise, email, capital ,Tel,  Fax, adresse,  Pays);
		Four.setId_fournisseur(Id_fournisseur);
		int num=SQLFournisseur.UpdateFournisseur(Four);
		
		try {

			dispatcher = request.getRequestDispatcher("viewFournisseur");
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
