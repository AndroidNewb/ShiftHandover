package shifthandover_app.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	private String racfID;
	private String userName;
	private String role;
	private String email;
	
	

	public User()
	{}
	
	public User(String racfID, String username, String role)
	{
		this.racfID=racfID;
		this.userName=username;
		this.role=role;
	}
	
	public String getRacfID() {
		return racfID;
	}
	public void setRacfID(String racfID) {
		this.racfID = racfID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString()
	{
		return this.getRacfID()+" | "+this.getUserName()+" | "+this.getRole();
	}
	
	
}
