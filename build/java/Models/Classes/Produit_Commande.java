package Models.Classes;

public class Produit_Commande {
	private Produit produit;
	private Commande Cmd;
	private int Quantite_Cmd;

	public Produit_Commande(Produit produit, Commande Cmd, int Quantite_Cmd) {
		super();
		this.produit = produit;
		this.Cmd = Cmd;
		this.Quantite_Cmd = Quantite_Cmd;
	}

	public Produit getProduit_cmd() {
		return produit;
	}

	public void setProduit_cmd(Produit produit) {
		this.produit = produit;
	}

	public Commande getCmd() {
		return Cmd;
	}

	public void setCmd(Commande Cmd) {
		this.Cmd = Cmd;
	}

	public int getQuantite_Cmd() {
		return Quantite_Cmd;
	}

	public void setQuantite_Cmd(int Quantite_Cmd) {
		this.Quantite_Cmd = Quantite_Cmd;
	}

}
