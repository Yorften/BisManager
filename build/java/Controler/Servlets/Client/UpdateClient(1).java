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
 * Servlet implementation class UpdateClient
 */
@WebServlet("/UpdateClient")
public class UpdateClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int Id_Client=Integer.parseInt(request.getParameter("id_Client"));
		String Nom =request.getParameter("Nom");
		String Prenom=request.getParameter("Prenom");	
		int Code_Postal = Integer.parseInt(request.getParameter("Code_Postal"));
		String email = request.getParameter("email");
		String adresse =request.getParameter("adresse");
		String Pays = request.getParameter("Pays");
		String ville = request.getParameter("ville");
		int tel = Integer.parseInt(request.getParameter("Tel"));
		
	
		RequestDispatcher dispatcher = null ;
		Client Client=new Client(Nom , Prenom, Code_Postal, email, adresse ,Pays,  ville, tel);
		Client.setId_Client(Id_Client);
		int num=SQLClinet.UpdateClient(Client);	
		try {

			dispatcher = request.getRequestDispatcher("viewClient.jsp");
			if (num > 0) {
			
				request.setAttribute("status", "edited");
				 
			}else {

				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request,response);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
	
	}

}
