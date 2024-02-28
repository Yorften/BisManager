package Controler.Servlet.Commande;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLCommande;

/**
 * Servlet implementation class DeleteCommandeServlet
 */
@WebServlet("/DeleteCommandeServlet")
public class DeleteCommandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCommandeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id_cmd = Integer.parseInt(request.getParameter("id_cmd"));

		int num = SQLCommande.DeleteCommande(id_cmd);

		RequestDispatcher dispatcher = null;
		try {

			dispatcher = request.getRequestDispatcher("viewCommande.jsp");
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
