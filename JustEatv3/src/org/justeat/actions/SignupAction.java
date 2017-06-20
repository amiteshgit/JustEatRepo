package org.justeat.actions;

import org.justeat.service.SignupService;

public class SignupAction {
	
	private String fullname;
	private String emailID;
	private String password;
	private String usertype;
	
	
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
		System.out.println("in signup");
		
		
		SignupService signupService = new SignupService();
		
String response1 =signupService.signup(getFullname(), getEmailID() , getUsertype(),getPassword());

System.out.println(response1);
return response1;


}
}
