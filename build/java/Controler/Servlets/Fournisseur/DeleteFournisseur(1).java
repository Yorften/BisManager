package Controler.Servlets.Fournisseur;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLFournisseur;



/**
 * Servlet implementation class DeleteFournisseur
 */
@WebServlet("/DeleteFournisseur")
public class DeleteFournisseur extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
    public DeleteFournisseur() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int id_fournisseur =Integer.parseInt(request.getParameter("id_fournisseur"));
	     
		int num= SQLFournisseur.DeleteFournisseur(id_fournisseur);
		 
		 
	  
		
		RequestDispatcher dispatcher = null ;
		
		
		try {

			dispatcher = request.getRequestDispatcher("viewFournisseur.jsp");
			if (num > 0) {
				request.setAttribute("status", "success");
				 
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request,response);
		} catch (Exception e) {
			
			e.printStackTrace();
		}

	  
	  
	
	}

}
