package Controler.statics;

import java.util.List;

import Controler.JDBC.MYSQL.SQLCommande;
import Controler.JDBC.MYSQL.SQLProduit_Fournisseur;
import Models.Classes.Commande;
import Models.Classes.Produit_Fournisseur;

public class GetStatics {

	@SuppressWarnings("deprecation")
	public static double getVentesbyMonth(int month) {
		double Montant = 0;
		List<Commande> Cmdlist = SQLCommande.getListOfCommandes();
		for (Commande cmd : Cmdlist) {
			if ((cmd.getDate_cmd().getMonth() + 1) == month) {
				Montant += cmd.getMontant();
			}
		}
		return Montant;
	}

	@SuppressWarnings("deprecation")
	public static double getAchatesbyMonth(int month) {
		double Montant = 0;
		List<Produit_Fournisseur> achates = SQLProduit_Fournisseur.getAchates();
		for (Produit_Fournisseur prod_fourni : achates) {
			if ((prod_fourni.getDate().getMonth() + 1) == month) {
				Montant += prod_fourni.getProduits_Fourni().getPrix_Total();
		}
	}
		return Montant;
	}

	
	
}
