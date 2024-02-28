package Models.Classes;

import java.sql.Blob;

public class informations {

	private String Nom;
	private String Adresse;
	private String Raison;
	private String Social;
	private int Capiltal;
	private String Email;
	private int Tel;
	private int Fax;
	private Blob Logo;

	public informations(String nom, String adresse, String raison, String social, int capiltal, String email, int tel,
			int fax) {
		super();
		Nom = nom;
		Adresse = adresse;
		Raison = raison;
		Social = social;
		Capiltal = capiltal;
		Email = email;
		Tel = tel;
		Fax = fax;
	}

	public String getNom() {
		return Nom;
	}

	public void setNom(String nom) {
		Nom = nom;
	}

	public String getAdresse() {
		return Adresse;
	}

	public void setAdresse(String adresse) {
		Adresse = adresse;
	}

	public String getRaison() {
		return Raison;
	}

	public void setRaison(String raison) {
		Raison = raison;
	}

	public String getSocial() {
		return Social;
	}

	public void setSocial(String social) {
		Social = social;
	}

	public int getCapiltal() {
		return Capiltal;
	}

	public void setCapiltal(int capiltal) {
		Capiltal = capiltal;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public int getTel() {
		return Tel;
	}

	public void setTel(int tel) {
		Tel = tel;
	}

	public int getFax() {
		return Fax;
	}

	public void setFax(int fax) {
		Fax = fax;
	}

	public Blob getLogo() {
		return Logo;
	}

	public void setLogo(Blob logo) {
		Logo = logo;
	}

}
