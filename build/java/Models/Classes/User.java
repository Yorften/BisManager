package Models.Classes;

public class User {

	private int id_user;
	private String UserName;
	private String Password;
	private String Email;
	private boolean Active;
	private String role;
	
	public User() {
		
	}
	
	public User( String userName, String password, String email, boolean active, String role) {
		super();		
		UserName = userName;
		Password = password;
		Email = email;
		Active = active;
		this.role = role;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public boolean isActive() {
		return Active;
	}
	public void setActive(boolean active) {
		Active = active;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	
}
