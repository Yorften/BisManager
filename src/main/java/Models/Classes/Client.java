package Models.Classes;

public class Client {

	private int Id_Client;
	private String Nom;
	private String Prenom;
	private int Code_Postal;
	private String Email;
	private String adresse;
	private String Pays;
	private String ville;
	private String tel;

	public Client() {
	}

	public Client(String nom, String prenom,  int code_Postal, String email, String adresse,
			String pays, String ville,String  tel) {

		this.Nom = nom;
		this.Prenom = prenom;		
		this.Code_Postal = code_Postal;
		this.Email = email;
		this.adresse = adresse;
		this.Pays = pays;
		this.ville = ville;
		this.tel = tel;
	}

	public int getId_Client() {
		return Id_Client;
	}

	public void setId_Client(int id_Client) {
		Id_Client = id_Client;
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

	public int getCode_Postal() {
		return Code_Postal;
	}

	public void setCode_Postal(int code_Postal) {
		Code_Postal = code_Postal;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPays() {
		return Pays;
	}

	public void setPays(String pays) {
		Pays = pays;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
