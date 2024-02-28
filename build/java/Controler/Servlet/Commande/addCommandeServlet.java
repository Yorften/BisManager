package Controler.Servlet.Commande;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controler.JDBC.MYSQL.SQLCommande;
import Controler.JDBC.MYSQL.SQLProduit;
import Controler.JDBC.MYSQL.SQLProduit_Cmd;
import Models.Classes.Commande;
import Models.Classes.Produit;

/**
 * Servlet implementation class addCommande
 */
@WebServlet("/addCommandeServlet")
public class addCommandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addCommandeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// this part is to remove a session from a command that's not complet
		req.getSession().getAttribute("cmd1");
		req.getSession().removeAttribute("cmd1");
		RequestDispatcher dispatcher = null;
		dispatcher = req.getRequestDispatcher("addCommande.jsp");
		dispatcher.forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		/*
		 * the idea of this part is that we take command object from the commande.jsp
		 * through a Session and each time we add a product if the state equals 1 means
		 * add a product if 2 means add the command which contains the products once the
		 * Command is added the Session loses it's validation
		 */

		/*
		 * this part is to add products to your command
		 */
		if (Integer.parseInt(request.getParameter("state")) == 1) {
			int id_produit = Integer.parseInt(request.getParameter("id_Produit1"));
			int Quantité_cmd = Integer.parseInt(request.getParameter("Quantité_cmd"));

			Produit p = SQLProduit.getProduitById(id_produit);
			p.setQuantite(Quantité_cmd);
			Commande cmd1 = new Commande();
			cmd1.addProduitToCommande(p);
			RequestDispatcher dispatcher = null;
			// if the ob
			if (request.getSession().getAttribute("cmd1") == null) {
				request.getSession().setAttribute("cmd1", cmd1);
			} else {
				Commande cmd2 = (Commande) request.getSession().getAttribute("cmd1");
				cmd2.addProduitToCommande(
						SQLProduit.getProduitById(Integer.parseInt(request.getParameter("id_Produit1"))));
				
			}
			dispatcher = request.getRequestDispatcher("addCommande.jsp");
			request.setAttribute("status", "Produit_is_added");
			dispatcher.forward(request, response);
		}
		/*
		 * part of add commande
		 */
		if (Integer.parseInt(request.getParameter("state")) == 2) {
			// this one is for the Commaande
			int id_Client = Integer.parseInt(request.getParameter("id_Client"));
			String Addresse_Cmd = request.getParameter("Addresse_Cmd");
			Date Date_cmd = Date.valueOf(request.getParameter("Date_cmd"));
			boolean isvalide = false;
			RequestDispatcher dispatcher = null;

			if (request.getSession().getAttribute("cmd1") == null) {
				// if the products are not inserted first means the commande is emty
				dispatcher = request.getRequestDispatcher("addCommande.jsp");
				request.setAttribute("status", "Produit_is_Emty");
				dispatcher.forward(request, response);
			} else {
				Commande cmd2 = (Commande) request.getSession().getAttribute("cmd1");
				cmd2.setId_Client(id_Client);
				cmd2.setAddresse_Cmd(Addresse_Cmd);
				cmd2.setDate_cmd(Date_cmd);
				cmd2.setValidtion(isvalide);
				// here we add the Command to both tables Command and Produit_Commande
				// first commande table
				int num = SQLCommande.AddCommande(cmd2);
				// then we retrieve the its id (because id is auto increment and not added
				// manually)
				cmd2.setId_cmd(
						SQLCommande.getListOfCommandes().get(SQLCommande.getListOfCommandes().size() - 1).getId_cmd());
				try {
					dispatcher = request.getRequestDispatcher("addCommande.jsp");
					if (num > 0) {
						// here we add the information to the Produit_commande table
						int num2 = SQLProduit_Cmd.AddProduitCmd(cmd2);
						if (num2 > 0) {
							request.setAttribute("status", "success");
						} else {
							request.setAttribute("status", "failed");
						}
					} else {
						request.setAttribute("status", "failed");
					}
					// after the command is added we remove the session
					request.getSession().removeAttribute("cmd1");
					dispatcher.forward(request, response);
				} catch (Exception e) {

					e.printStackTrace();
				}

			}
		}

	}
}
