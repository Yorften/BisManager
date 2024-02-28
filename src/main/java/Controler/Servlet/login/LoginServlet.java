package Controler.Servlet.login;

import java.io.IOException;

import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Controler.JDBC.MYSQL.SqlConnection;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uname = request.getParameter("username");
		String upwd = request.getParameter("password");
		HttpSession session = request.getSession();
		Connection con = null;
		RequestDispatcher dispatcher = null;

		if (uname == null || uname.equals("")) {
			request.setAttribute("status", "Invalidusr");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		if (upwd == null || upwd.equals("")) {
			request.setAttribute("status", "Invalidpwd");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = SqlConnection.getConnection();
			PreparedStatement pst = con.prepareStatement("select * from users where UserName = ? and Password = ?");
			pst.setString(1, uname);
			pst.setString(2, upwd);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				if (rs.getInt(5) != 1) {
					//checking id acounte is activated  
					request.setAttribute("status", "noActive");
					dispatcher = request.getRequestDispatcher("Home");
				} else {
					session.setAttribute("name", rs.getString(6));
					dispatcher = request.getRequestDispatcher("Home");
				}
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
