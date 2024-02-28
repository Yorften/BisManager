package Controler.Servlet.Utilisateur;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLUser;
import Models.Classes.User;

/**
 * Servlet implementation class addUserServlet
 */
@WebServlet("/addUserServlet")
public class addUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String UserName = request.getParameter("UserName");
		String Password = request.getParameter("Password");
		String Email = request.getParameter("Email");
		String Role = request.getParameter("Role");
		boolean Active = Boolean.parseBoolean(request.getParameter("Active"));

		User user = new User(UserName, Password, Email, Active, Role);

		int num = SQLUser.AddUser(user);

		RequestDispatcher dispatcher = null;

		try {

			dispatcher = request.getRequestDispatcher("Utilisateurs.jsp");
			if (num > 0) {
				request.setAttribute("status", "added");

			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
