package Models.Classes;

import java.util.ArrayList;
import java.util.Date;

public class Commande {
	private int id_cmd;
	private Client client;
	private int Id_Client;
	private int id_Fournisseur;
	private int id_Produit;
	private String Addresse_Cmd;
	private Date Date_cmd;
	private double Montant;
	private boolean Validtion;
	private ArrayList<Produit_Commande> Prod_Cmd = new ArrayList<Produit_Commande>();;

	// Constructor for sells
	public Commande(int id_Client, String addresse_Cmd, Date date_cmd, boolean validtion) {
		this.Id_Client = id_Client;
		this.Addresse_Cmd = addresse_Cmd;
		this.Date_cmd = date_cmd;
		this.Validtion = validtion;

	}

	public Commande() {
		// TODO Auto-generated constructor stub
	}

	public Commande(int id_cmd, int id_Fournisseur, int id_Produit, String addresse_Cmd, Date date_cmd,
			boolean validtion, double montant) {
		super();
		this.id_cmd = id_cmd;
		this.id_Fournisseur = id_Fournisseur;
		this.id_Produit = id_Produit;
		Addresse_Cmd = addresse_Cmd;
		Date_cmd = date_cmd;
		Montant = montant;
		Validtion = validtion;

	}

	public int getId_Produit() {
		return id_Produit;
	}

	public void setId_Produit(int id_Produit) {
		this.id_Produit = id_Produit;
	}

	public int getId_Client() {
		return Id_Client;
	}

	public void setId_Client(int id_Client) {
		Id_Client = id_Client;
	}

	public String getAddresse_Cmd() {
		return Addresse_Cmd;
	}

	public void setAddresse_Cmd(String addresse_Cmd) {
		Addresse_Cmd = addresse_Cmd;
	}

	public Date getDate_cmd() {
		return Date_cmd;
	}

	public void setDate_cmd(Date date_cmd) {
		Date_cmd = date_cmd;
	}

	public double getMontant() {
		return Montant;
	}

	public void setMontant(double montant) {
		Montant = montant;
	}

	public boolean isValidtion() {
		return Validtion;
	}

	public void setValidtion(boolean validtion) {
		Validtion = validtion;
	}

	public int getId_cmd() {
		return id_cmd;
	}

	public void setId_cmd(int id_cmd) {
		this.id_cmd = id_cmd;
	}

	public int getId_Fournisseur() {
		return id_Fournisseur;
	}

	public void setId_Fournisseur(int id_Fournisseur) {
		this.id_Fournisseur = id_Fournisseur;
	}

	public ArrayList<Produit_Commande> getProd_Cmd() {
		return Prod_Cmd;
	}

	public void setProd_Cmd(ArrayList<Produit_Commande> prod_Cmd) {
		Prod_Cmd = prod_Cmd;
	}

	public void addProduitToCommande(Produit Prod) {
		Prod_Cmd.add(new Produit_Commande(Prod, this, (int) Prod.getQuantite()));
		Montant += Prod.getPrix_Total() * (1 + (Prod.getTVA() / 100));

	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

}
