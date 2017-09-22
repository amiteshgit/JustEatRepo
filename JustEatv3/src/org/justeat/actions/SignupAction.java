package org.justeat.actions;

import org.justeat.service.SignupService;

public class SignupAction {

	private String firstName;
	private String lastName;
	private String fullname;


	private String emailID;
	private String password;
	private String usertype;
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String execute() {

		SignupService signupService = new SignupService();
		
		setFullname(getFirstName()+" "+getLastName());
		setUsertype("CUSTOMER");

		String response = signupService.signup(getFullname(), getEmailID(), getUsertype(), getPassword());

		return response;

	}
}
