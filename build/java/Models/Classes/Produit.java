package Models.Classes;

import java.sql.Blob;

public class Produit {

	private int id_Produit;
	private String Desegnation;
	private String Categorie;
	private double Prix;
	private double Quantite;
	private double TVA;
	private double Prix_Total;
	private Blob img;

	public Produit(String desegnation, String categorie, double prix, double quantite, double tVA) {

		this.Desegnation = desegnation;
		this.Categorie = categorie;
		this.Prix = prix;
		this.Quantite = quantite;
		this.TVA = tVA;
		this.Prix_Total = prix * quantite;
	}

	public Produit() {
		// TODO Auto-generated constructor stub
	}

	public int getId_Produit() {
		return id_Produit;
	}

	public void setId_Produit(int id_Produit) {
		this.id_Produit = id_Produit;
	}

	public String getDesegnation() {
		return Desegnation;
	}

	public void setDesegnation(String desegnation) {
		Desegnation = desegnation;
	}

	public String getCategorie() {
		return Categorie;
	}

	public void setCategorie(String categorie) {
		Categorie = categorie;
	}

	public double getPrix() {
		return Prix;
	}

	public void setPrix(double prix) {
		Prix = prix;
	}

	public double getQuantite() {
		return Quantite;
	}

	public void setQuantite(double quantite) {
		Quantite = quantite;
	}

	public double getTVA() {
		return TVA;
	}

	public void setTVA(double tVA) {
		TVA = tVA;
	}

	public Blob getImg() {
		return img;
	}

	public void setImg(Blob img) {
		this.img = img;
	}

	public double getPrix_Total() {
		return Prix_Total;
	}

	public void setPrix_Total(double prix_Total) {
		Prix_Total = prix_Total;
	}

}
