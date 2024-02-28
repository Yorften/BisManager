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
import Models.Classes.Produit_Commande;

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
		dispatcher = req.getRequestDispatcher("addCommande");
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
		if (request.getParameter("status").equals("add_produit")) {
			Commande commande;
			RequestDispatcher dispatcher = null;
			int id_produit = Integer.parseInt(request.getParameter("id_Produit1"));
			int Quantité_cmd = Integer.parseInt(request.getParameter("Quantité_cmd"));
			Produit produit = SQLProduit.getProduitById(id_produit);
			// check the quantity available of product
			if (Quantité_cmd <= produit.getQuantite()) {

				produit.setQuantite(Quantité_cmd);
				// check if the the status of the command
				// (null==fist time || else=command in progress)
				if (request.getSession().getAttribute("cmd1") == null) {
					commande = new Commande();
					commande.addProduitToCommande(produit);
					request.getSession().setAttribute("cmd1", commande);
					request.setAttribute("status", "Produit_is_added");
				} else {
					commande = (Commande) request.getSession().getAttribute("cmd1");
					// check if the product is already commanded or not
					if (commande.isProduitDuplicate(id_produit)) {
						request.setAttribute("status", "Produit_is_already_in_commanded");
					} else {
						commande.addProduitToCommande(produit);
						request.setAttribute("status", "Produit_is_added");
					}
				}

			} else {
				request.setAttribute("status", "Quantity_not_available");
			}
			dispatcher = request.getRequestDispatcher("addCommande");
			dispatcher.forward(request, response);
		}

		/*
		 * the Objective of this part is to remove a product from a Command
		 */
		if (request.getParameter("status").equals("delete_Commande")) {
			Commande commande = (Commande) request.getSession().getAttribute("cmd1");
			Produit prod = SQLProduit.getProduitById(Integer.parseInt(request.getParameter("id_Produit")));

			RequestDispatcher dispatcher = request.getRequestDispatcher("addCommande");

			for (Produit_Commande PC : commande.getProd_Cmd()) {
				if (PC.getProduit_cmd().getId_Produit() == prod.getId_Produit()) {

					commande.getProd_Cmd().remove(commande.getProd_Cmd().indexOf(PC));
					break;
				}

			}
			request.setAttribute("status", "Produit_removed_from_commande");

			dispatcher.forward(request, response);
		}

		/*
		 * part of add commande
		 */
		if (request.getParameter("status").equals("add_Commande")) {
			// this one is for the Commaande
			int id_Client = Integer.parseInt(request.getParameter("id_Client"));
			String Addresse_Cmd = request.getParameter("Addresse_Cmd");
			Date Date_cmd = Date.valueOf(request.getParameter("Date_cmd"));			
			boolean isvalide = Boolean.parseBoolean(request.getParameter("validation"));
			RequestDispatcher dispatcher = null;

			if (request.getSession().getAttribute("cmd1") == null) {
				// if the products are not inserted first means the commande is emty
				dispatcher = request.getRequestDispatcher("addCommande");
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
					dispatcher = request.getRequestDispatcher("addCommande");
					if (num > 0) {
						// here we add the information to the Produit_commande table
						int num2 = SQLProduit_Cmd.AddProduitCmd(cmd2);
						if (num2 > 0) {
							// int num3=
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
