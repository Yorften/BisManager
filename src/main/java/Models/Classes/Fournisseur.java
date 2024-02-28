package Models.Classes;

import java.util.ArrayList;

public class Fournisseur {

	private int Id_fournisseur;
	private String Nom;
	private String Prenom;
	private String Entreprise;
	private String Email;
	private int Capital;
	private String tel;
	private String fax;
	private String adresse;
	private String pays;
	private ArrayList<Produit_Fournisseur> Prod_Four = new ArrayList<Produit_Fournisseur>();

	public Fournisseur(String nom, String prenom, String entreprise, String email, int capital, String tel, String fax,
			String adresse, String pays) {
		super();

		this.Nom = nom;
		this.Prenom = prenom;
		this.Entreprise = entreprise;
		this.Email = email;
		this.Capital = capital;
		this.tel = tel;
		this.fax = fax;
		this.adresse = adresse;
		this.pays = pays;

	}

	public Fournisseur() {
		// TODO Auto-generated constructor stub
	}

	public int getId_fournisseur() {
		return Id_fournisseur;
	}

	public void setId_fournisseur(int id_fournisseur) {
		Id_fournisseur = id_fournisseur;
	}

	public String getNom() {
		return Nom;
	}

	public void setNom(String nom) {
		Nom = nom;
	}

	public String getPrenom() {
		return Prenom;
	}

	public void setPrenom(String prenom) {
		Prenom = prenom;
	}

	public String getEntreprise() {
		return Entreprise;
	}

	public void setEntreprise(String entreprise) {
		Entreprise = entreprise;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public int getCapital() {
		return Capital;
	}

	public void setCapital(int capital) {
		Capital = capital;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public void addProduit(Produit Prod) {
		Prod_Four.add(new Produit_Fournisseur(Prod, this, (int) Prod.getQuantite()));

	}

	public double getTotalMontant() {
		double Montant = 0;
		for (Produit_Fournisseur PF : Prod_Four) {
			Montant += PF.getProduits_Fourni().getPrix_Total();
		}
		return Montant;
	}

	public ArrayList<Produit_Fournisseur> getProd_Four() {
		return Prod_Four;
	}

	public void setProd_Four(ArrayList<Produit_Fournisseur> prod_Four) {
		Prod_Four = prod_Four;
	}

	public boolean CommandeAchateValidtion() {
		for (Produit_Fournisseur prod_fourni : this.getProd_Four()) {
			if (!prod_fourni.isValide()) {
				return false;
			}
		}
		return true;
	}

}
