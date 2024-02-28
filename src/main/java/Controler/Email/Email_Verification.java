package Controler.Email;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Controler.JDBC.MYSQL.SQLUser;
import Models.Classes.User;

/**
 * Servlet implementation class Email_Verification
 */
@WebServlet("/Email_Verification")
public class Email_Verification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Email_Verification() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			// feth form value
			String email = request.getParameter("email");
			System.out.println("  email sent is  "+email);
			RequestDispatcher dispatcher = null;
			// create instance object of the SendEmail Class
			SendEmail sm = new SendEmail();
			if (SQLUser.isEmailExist(email)) {
				User user = SQLUser.getUserByEmail(email);
				boolean test = sm.sendEmail(user);		

				try {

					dispatcher = request.getRequestDispatcher("login.jsp");
					if (test) {
						request.setAttribute("status", "success");
System.out.println("email exist and woeking");
					} else {
						request.setAttribute("status", "failed");
						System.out.println("email exist and not woeking");
					}
					dispatcher.forward(request, response);
				} catch (Exception e) {

					e.printStackTrace();
				}

			}else {
				try {

					dispatcher = request.getRequestDispatcher("forgetPassword.jsp");
					System.out.println("email_dont_exist");
						request.setAttribute("status", "email_not_exist");						
					
					dispatcher.forward(request, response);
				} catch (Exception e) {

					e.printStackTrace();
				}

			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		processRequest(request, response);
		   
	}

}
