package Controler.Servlets.Produit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLCategorie;


/**
 * Servlet implementation class DeleteCategorieServlet
 */
@WebServlet("/DeleteCategorieServlet")
public class DeleteCategorieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategorieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String Categorie =request.getParameter("Categorie");
	     
			int num= SQLCategorie.DeleteCategorie(Categorie);			 			 		
			RequestDispatcher dispatcher = null ;
			try {

				dispatcher = request.getRequestDispatcher("addProduit.jsp");
				if (num > 0) {
					request.setAttribute("status", "Deleted");
					 
				}else {
					request.setAttribute("status", "failed");
				}
				dispatcher.forward(request,response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}

	}

}
