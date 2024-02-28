package Controler.Servlet.Facture;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLCommande;
import Controler.JDBC.MYSQL.SQLFacture;

/**
 * Servlet implementation class AddFactureServlet
 */
@WebServlet("/AddFactureServlet")
public class AddFactureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddFactureServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		int id_cmd = Integer.parseInt(request.getParameter("id_cmd"));
		RequestDispatcher dispatcher = null;

		if (SQLFacture.checkDuplicatCmd(id_cmd)) {
			dispatcher = request.getRequestDispatcher("CommandeDetails?id_cmd=" + id_cmd + "");
			request.setAttribute("status", "duplication");
			dispatcher.forward(request, response);
		} else if (!SQLCommande.getCommande(id_cmd).isValidtion()) {
			dispatcher = request.getRequestDispatcher("CommandeDetails?id_cmd=" + id_cmd + "");
			request.setAttribute("status", "command_not_valid");
			dispatcher.forward(request, response);
		} else {

			int num = SQLFacture.AddFacture(id_cmd);

			try {

				dispatcher = request.getRequestDispatcher("viewCommande");
				if (num > 0) {
					request.setAttribute("status", "ajoute");

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
