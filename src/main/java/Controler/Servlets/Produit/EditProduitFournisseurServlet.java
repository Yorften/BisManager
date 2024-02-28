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
 * Servlet implementation class EditProduitFournisseurServlet
 */
@WebServlet("/EditProduitFournisseur")
public class EditProduitFournisseurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProduitFournisseurServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id_Produit = Integer.parseInt(request.getParameter("id_Produit"));
		int id_fournisseur = Integer.parseInt(request.getParameter("id_fournisseur"));
		RequestDispatcher dispatcher = null;
		if (request.getParameter("status").equals("supprimer")) {
			int num = SQLProduit_Fournisseur.DeleteProduit_Forni(id_Produit);

			try {

				dispatcher = request.getRequestDispatcher("achatesDetails?id_fournisseur=" + id_fournisseur);
				if (num > 0) {
					request.setAttribute("status", "Produit_removed");

				} else {
					request.setAttribute("status", "failed");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}

		} else {
			int num = 0;
			if (Boolean.parseBoolean(request.getParameter("validation"))) {
				num = SQLProduit_Fournisseur.EditProduitValidation(id_Produit, false);
			} else {
				num = SQLProduit_Fournisseur.EditProduitValidation(id_Produit, true);
			}
			try {

				dispatcher = request.getRequestDispatcher("achatesDetails?id_fournisseur=" + id_fournisseur);
				if (num > 0) {
					request.setAttribute("status", "validation_changed");

				} else {
					request.setAttribute("status", "failed");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}

		}

	}

}
