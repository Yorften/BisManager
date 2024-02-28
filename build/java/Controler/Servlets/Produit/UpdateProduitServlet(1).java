package Controler.Servlets.Produit;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLProduit;
import Models.Classes.Produit;

/**
 * Servlet implementation class UpdateProduitServlet
 */
@WebServlet("/UpdateProduitServlet")
public class UpdateProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProduitServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		int id_Produit=Integer.parseInt(request.getParameter("id_Produit"));
		String desegnation = request.getParameter("desegnation");
		String categorie = request.getParameter("categorie");
		double prix = Double.parseDouble(request.getParameter("prix"));
		double quantite =Double.parseDouble(request.getParameter("quantite"));
		double TVA =Double.parseDouble(request.getParameter("TVA"));

		Produit Prod = new Produit(desegnation, categorie, prix, quantite, TVA);
		Prod.setId_Produit(id_Produit);
		
		int num1 = SQLProduit.UpdateProduit(Prod);
		RequestDispatcher dispatcher = null;
		try {
			dispatcher = request.getRequestDispatcher("viewProduit.jsp");
			if (num1 > 0) {

				request.setAttribute("status","edited");
				 
			}else {
				
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
