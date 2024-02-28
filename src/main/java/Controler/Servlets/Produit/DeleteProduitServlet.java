package Controler.Servlets.Produit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLProduit;

/**
 * Servlet implementation class DeleteProduitServlet
 */
@WebServlet("/DeleteProduitServlet")
public class DeleteProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteProduitServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id_Produit = Integer.parseInt(request.getParameter("id_Produit"));

		int num = SQLProduit.DeleteProduit(id_Produit);

		RequestDispatcher dispatcher = null;
		try {

			dispatcher = request.getRequestDispatcher("viewProduit");
			if (num > 0) {
				request.setAttribute("status", "success");

			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
