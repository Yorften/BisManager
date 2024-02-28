package Models.Classes;

import java.sql.Date;

public class Produit_Fournisseur {
	private Produit Produits_Fourni;
	private Fournisseur ident_Fournisseur;
	private int Quantite_fourn;
    private Date date;
    private boolean Valide;
	public Produit_Fournisseur(Produit produits_Fourni, Fournisseur ident_Fournisseur, int quantite_fourn) {
		Produits_Fourni = produits_Fourni;
		this.ident_Fournisseur = ident_Fournisseur;
		Quantite_fourn = quantite_fourn;
	}

	public Produit getProduits_Fourni() {
		return Produits_Fourni;
	}

	public void setProduits_Fourni(Produit Produits_Fourni) {
		this.Produits_Fourni = Produits_Fourni;
	}

	public Fournisseur getIdent_Fournisseur() {
		return ident_Fournisseur;
	}

	public void setIdent_Fournisseur(Fournisseur ident_Fournisseur) {
		this.ident_Fournisseur = ident_Fournisseur;
	}

	public int getQuantite_fourn() {
		return Quantite_fourn;
	}

	public void setQuantite_fourn(int quantite_fourn) {
		Quantite_fourn = quantite_fourn;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isValide() {
		return Valide;
	}

	public void setValide(boolean valide) {
		Valide = valide;
	}

}
