package Controler.statics;

import java.util.List;

import Controler.JDBC.MYSQL.SQLCommande;
import Controler.JDBC.MYSQL.SQLProduit_Fournisseur;
import Models.Classes.Commande;
import Models.Classes.Produit_Commande;
import Models.Classes.Produit_Fournisseur;

public class CommandeStatics {

	@SuppressWarnings("deprecation")
	public static double getVentesbyMonth(int month) {		
		List<Commande> CmdList =SQLCommande.getListOfCommandes();
		double Montant=0;
		for (Commande cmd : CmdList) {
			if ((cmd.getDate_cmd().getMonth() + 1) == month) { // +1 is to correct the delay in the date by 1 month				
				Montant+=cmd.getMontant();
			}				
		}
		return Montant;
	}
	
	public static double getStaticsCommmande(int month) {			
		switch (month) {
		case 1: return getVentesbyMonth(1); 
		case 2: return getVentesbyMonth(2);
		case 3: return getVentesbyMonth(3);
		case 4: return getVentesbyMonth(4);
		case 5: return getVentesbyMonth(5);
		case 6: return getVentesbyMonth(6);
		case 7: return getVentesbyMonth(7);
		case 8: return getVentesbyMonth(8);
		case 9: return getVentesbyMonth(9);
		case 10: return getVentesbyMonth(10);
		case 11: return getVentesbyMonth(11);
		case 12: return getVentesbyMonth(12);			
		default:
			throw new IllegalArgumentException("Unexpected value: " + month);
		}
	}
	@SuppressWarnings("deprecation")
	public static double getAchatesbyMonth(int month) {		
		List<Produit_Fournisseur> AchatesList =SQLProduit_Fournisseur.getListOfAchates();
		double Montant=0;
		for (Produit_Fournisseur achate : AchatesList) {
			if ((achate.getDate().getMonth() + 1) == month) { // +1 is to correct the delay in the date by 1 month				
				Montant+=achate.getMontant();
			}				
		}
		return Montant;
	}
	
	public static double getStaticsAchates(int month) {			
		switch (month) {
		case 1: return getAchatesbyMonth(1); 
		case 2: return getAchatesbyMonth(2);
		case 3: return getAchatesbyMonth(3);
		case 4: return getAchatesbyMonth(4);
		case 5: return getAchatesbyMonth(5);
		case 6: return getAchatesbyMonth(6);
		case 7: return getAchatesbyMonth(7);
		case 8: return getAchatesbyMonth(8);
		case 9: return getAchatesbyMonth(9);
		case 10: return getAchatesbyMonth(10);
		case 11: return getAchatesbyMonth(11);
		case 12: return getAchatesbyMonth(12);			
		default:
			throw new IllegalArgumentException("Unexpected value: " + month);
		}
	}
	
	
	
	
	
	
}
