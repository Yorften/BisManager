package Controler.Servlets.Client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLClinet;
import Models.Classes.Client;

/**
 * Servlet implementation class AddClientServlet
 */
@WebServlet("/AddClientServlet")
public class AddClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddClientServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String Nom = request.getParameter("Nom");
		String Prenom = request.getParameter("Prenom");
		int Code_Postal = Integer.parseInt(request.getParameter("Code_Postal"));
		String email = request.getParameter("email");
		String adresse = request.getParameter("adresse");
		String Pays = request.getParameter("Pays");
		String ville = request.getParameter("ville");
		String tel = request.getParameter("Tel");

		RequestDispatcher dispatcher = null;
		Client Four = new Client(Nom, Prenom, Code_Postal, email, adresse, Pays, ville, tel);
		int num = SQLClinet.AddClinet(Four);

		try {

			dispatcher = request.getRequestDispatcher("addClient");
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
