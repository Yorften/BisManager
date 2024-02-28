package Controler.Servlet.Facture;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLFacture;

/**
 * Servlet implementation class DeleteFactureServlet
 */
@WebServlet("/DeleteFactureServlet")
public class DeleteFactureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteFactureServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id_Facture = Integer.parseInt(request.getParameter("id_Facture"));

		int num = SQLFacture.DeleteFacture(id_Facture);

		RequestDispatcher dispatcher = null;

		try {

			dispatcher = request.getRequestDispatcher("viewFacture");
			if (num > 0) {
				request.setAttribute("status", "deleted");

			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
