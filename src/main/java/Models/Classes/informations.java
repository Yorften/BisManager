package Models.Classes;

import java.sql.Blob;

public class informations {

	private String Nom;
	private String Adresse;
	private String Raison;
	private String Social;
	private double Capiltal;
	private String Email;
	private String Tel;
	private String Fax;
	private Blob Logo;

	public informations(String nom, String adresse, String raison, String social, double capital, String email, String tel2,
			String fax2) {
		super();
		Nom = nom;
		Adresse = adresse;
		Raison = raison;
		Social = social;
		Capiltal = capital;
		Email = email;
		Tel = tel2;
		Fax = fax2;
	}

	public informations() {
		// TODO Auto-generated constructor stub
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

	public double getCapiltal() {
		return Capiltal;
	}

	public void setCapiltal(double capiltal) {
		Capiltal = capiltal;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getTel() {
		return Tel;
	}

	public void setTel(String tel) {
		Tel = tel;
	}

	public String getFax() {
		return Fax;
	}

	public void setFax(String fax) {
		Fax = fax;
	}

	public Blob getLogo() {
		return Logo;
	}

	public void setLogo(Blob logo) {
		Logo = logo;
	}

}
