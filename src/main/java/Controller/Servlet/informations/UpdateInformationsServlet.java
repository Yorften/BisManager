package Controller.Servlet.informations;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controler.JDBC.MYSQL.SQLinformations;
import Models.Classes.informations;

/**
 * Servlet implementation class UpdateInformationsServlet
 */
@WebServlet("/Updateinfo")

public class UpdateInformationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateInformationsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Nom = request.getParameter("Nom");
		String Adresse = request.getParameter("Adresse");
		String RaisonSocial = request.getParameter("Raison_Sociale");
		double Capital = Double.parseDouble(request.getParameter("Capital"));
		String Email = request.getParameter("Email");
		String tel = request.getParameter("tel");
		String fax = request.getParameter("fax");
		informations info = new informations(Nom, Adresse, RaisonSocial, RaisonSocial, Capital, Email, tel, fax);
		int num = SQLinformations.updateInformation(info);

		RequestDispatcher dispatcher = null;

		try {

			dispatcher = request.getRequestDispatcher("informations");
			if (num > 0) {
				request.setAttribute("status", "infoUpdated");

			} else {
				request.setAttribute("status", "infoError");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}