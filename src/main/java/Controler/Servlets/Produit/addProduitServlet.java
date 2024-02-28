
package Controler.Servlets.Produit;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLProduit;
import Controler.JDBC.MYSQL.SQLProduit_Fournisseur;
import Models.Classes.Produit;

/**
 * Servlet implementation class addPeoduitServlet
 */
@WebServlet("/addProduitServlet")
public class addProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduitServlet() {
        super();

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
			int id_fournisseur =Integer.parseInt(request.getParameter("id_fournisseur"));
			String desegnation =request.getParameter("desegnation");
			String categorie=request.getParameter("categorie");		
			double prix = Double.parseDouble(request.getParameter("prix"));
			int quantite = Integer.parseInt(request.getParameter("quantite"));
			double TVA= Double.parseDouble(request.getParameter("TVA"));
			Date date= Date.valueOf(request.getParameter("date"));
			
			
		

	
		 //Fournisseur fournisseur =SQLFournisseur.getFournisseur(id_fournisseur);
		 Produit Prod=new Produit( desegnation, categorie, prix, quantite, TVA);
		 
		 
		 
		 int num1=SQLProduit.AddProduit(Prod);			
		 RequestDispatcher dispatcher = null ;
		 try {

			dispatcher = request.getRequestDispatcher("addProduit");
			if (num1 > 0 ) {
			 /* get the id of the product to use it in produit_fournisseur table*/
			 List<Produit> L=SQLProduit.getListOfProduits();
			 Prod=L.get(L.size()-1);	
			 
			 int num2=SQLProduit_Fournisseur.AddProduit_fournisseur(Prod,id_fournisseur,date);
	         if(num2>0) {
			 request.setAttribute("status", "success");			 
	          }else {request.setAttribute("status", "failed");}
			 }else {
				request.setAttribute("status", "failed");
			 }
			 dispatcher.forward(request,response);
		} catch (Exception e) {		
			e.printStackTrace();
		}

	
	}

}
