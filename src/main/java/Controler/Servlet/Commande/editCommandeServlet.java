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
 * Servlet implementation class editCommande
 */
@WebServlet("/editCommandeServlet")
public class editCommandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public editCommandeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * this part of code sets a new seesion for the object command and redirect to
		 * the edit page
		 */
		int id_cmd = Integer.parseInt(request.getParameter("id_cmd"));

		Commande cmd = SQLCommande.getCommandeDetails(id_cmd);
		request.getSession().setAttribute("cmd", cmd);

		RequestDispatcher dispatcher = request.getRequestDispatcher("editCommande");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("status").equals("add_produit")) {

			RequestDispatcher dispatcher = null;
			Commande cmd = (Commande) request.getSession().getAttribute("cmd");
			Produit prod = SQLProduit.getProduitById(Integer.parseInt(request.getParameter("id_Produit1")));
			prod.setQuantite(Integer.parseInt(request.getParameter("Quantité_cmd")));
			
			dispatcher = request.getRequestDispatcher("editCommande");
			if (cmd.isProduitDuplicate(prod.getId_Produit())) {
				request.setAttribute("status", "Produit_is_already_in_commanded");
			} else {
				cmd.addProduitToCommande(prod);
				request.setAttribute("status", "added");
			}

			dispatcher.forward(request, response);
		}

		/*
		 * the Objective of this part is to remove a product from a Command
		 */
		if (request.getParameter("status").equals("delete_Commande")) {
			Commande cmd1 = (Commande) request.getSession().getAttribute("cmd");
			Produit prod = SQLProduit.getProduitById(Integer.parseInt(request.getParameter("id_Produit")));

			RequestDispatcher dispatcher = request.getRequestDispatcher("editCommande");

			for (Produit_Commande PC : cmd1.getProd_Cmd()) {
				if (PC.getProduit_cmd().getId_Produit() == prod.getId_Produit()) {

					cmd1.getProd_Cmd().remove(cmd1.getProd_Cmd().indexOf(PC));
					break;
				}

			}
			request.setAttribute("status", "Produit_removed_from_commande");

			dispatcher.forward(request, response);
		}
		/*
		 * the Objective of this part is to save the command after been edited
		 */
		if (request.getParameter("status").equals("add_cmd")) {
			Commande cmd = (Commande) request.getSession().getAttribute("cmd");
			cmd.setAddresse_Cmd(request.getParameter("Addresse_Cmd"));
			cmd.setId_Client(Integer.parseInt(request.getParameter("id_Client")));
			cmd.setDate_cmd(Date.valueOf(request.getParameter("Date_cmd")));
			cmd.setValidtion(Boolean.parseBoolean(request.getParameter("validation")));

			// we update command table
			int num1 = SQLCommande.UpdateCommande(cmd);

			RequestDispatcher dispatcher = null;
			dispatcher = request.getRequestDispatcher("viewCommande");
			if (num1 > 0) {
				// first we clear the old info from Produit_Commande table to avoid primary key
				// duplication
				int num2 = SQLProduit_Cmd.deleteProduitCmd(cmd);

				// then we add the new informations to the table before (produit_commande)
				int num3 = SQLProduit_Cmd.AddProduitCmd(cmd);
				if (num2 > 0 && num3 > 0) {
					request.setAttribute("status", "cmd_edited");
				} else {
					request.setAttribute("status", "edit_failed");
				}
			} else {
				request.setAttribute("status", "edit_failed");
			}
			// after the command is added we remove the session
			request.getSession().removeAttribute("cmd");
			dispatcher.forward(request, response);
		}

	}
}
