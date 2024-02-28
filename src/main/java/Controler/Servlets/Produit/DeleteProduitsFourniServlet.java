package Controler.Servlets.Produit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLProduit_Fournisseur;

/**
 * Servlet implementation class DeleteProduitsFourniServlet
 */
@WebServlet("/DeleteProduitsFourniServlet")
public class DeleteProduitsFourniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteProduitsFourniServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id_fournisseur = Integer.parseInt(request.getParameter("id_fournisseur"));

		int num = SQLProduit_Fournisseur.DeleteProduits_Forni(id_fournisseur);

		RequestDispatcher dispatcher = null;
		try {

			dispatcher = request.getRequestDispatcher("viewCommande");
			if (num > 0) {
				request.setAttribute("status", "Ach_Deleted");

			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
