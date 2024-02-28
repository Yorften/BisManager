package Models.Classes;

public class Categorie {

	private String Designation;
	private int Quntite_Produit;
	public Categorie() {
	}

	public Categorie(String designation) {
		super();
		Designation = designation;
	}

	public String getDesignation() {
		return Designation;
	}

	public void setDesignation(String designation) {
		Designation = designation;
	}

	public int getQuntite_Produit() {
		return Quntite_Produit;
	}

	public void setQuntite_Produit(int quntite_Produit) {
		Quntite_Produit = quntite_Produit;
	}

}
