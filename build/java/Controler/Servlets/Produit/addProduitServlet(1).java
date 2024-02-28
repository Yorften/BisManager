
package Controler.Servlets.Produit;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
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
			int prix = Integer.parseInt(request.getParameter("prix"));
			int quantite = Integer.parseInt(request.getParameter("quantite"));
			int TVA= Integer.parseInt(request.getParameter("TVA"));
			String img=request.getParameter("img");
			
		
		 InputStream is = new ByteArrayInputStream(img.getBytes());
	
		 
		 Produit Prod=new Produit( desegnation, categorie, prix, quantite, TVA);
		 int num1=SQLProduit.AddProduit(Prod,is);	
		 
		 RequestDispatcher dispatcher = null ;
		 try {

			dispatcher = request.getRequestDispatcher("addProduit.jsp");
			if (num1 > 0 ) {
			 /* get the id of the product to use it in produit_fournisseur table*/
			 List<Produit> L=SQLProduit.getListOfProduits();
			 Prod=L.get(L.size()-1);	
			 
			 int num2=SQLProduit_Fournisseur.AddProduit_fournisseur(Prod,id_fournisseur);
	         if(num2>0) {
			 request.setAttribute("status", "success");
			 dispatcher.forward(request,response);
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
