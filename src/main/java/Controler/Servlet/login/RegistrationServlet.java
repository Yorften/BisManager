package Controler.Servlet.login;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import Controler.JDBC.MYSQL.SqlConnection;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uname = request.getParameter("name");
		String umail = request.getParameter("email");
		String upwd = request.getParameter("pass");
		String umobile = request.getParameter("contact");
		RequestDispatcher dispatcher = null;
		Connection con = null;

		if (uname == null || uname.equals("")) {
			request.setAttribute("status", "Invalidusr");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if (upwd == null || upwd.equals("")) {
			request.setAttribute("status", "Invalidpwd");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if (umail == null || umail.equals("")) {
			request.setAttribute("status", "Invalidmail");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if (umobile == null || umobile.equals("")) {
			request.setAttribute("status", "Invalidgsm");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = SqlConnection.getConnection();
			String sql = "INSERT INTO `users`(`UserName`, `Password`, `Email`) VALUES (?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, uname);
			pst.setString(2, upwd);
			pst.setString(3, umail);

			int rowcount = pst.executeUpdate();

			dispatcher = request.getRequestDispatcher("registration.jsp");
				if (rowcount > 0) {
					request.setAttribute("status", "added");

				} else {
					request.setAttribute("status", "failed");
				}
				dispatcher.forward(request, response);
				con.close();
			} catch (Exception e) {

				e.printStackTrace();
			}


	}

}
