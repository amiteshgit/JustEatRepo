package org.justeat.actions;
import javax.servlet.http.HttpSession;
//import com.opensymphony.webwork.ServletActionContext;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.justeat.beans.VendorBeans;
import org.justeat.service.LoginService;

import com.opensymphony.xwork2.Action;

public class LoginAction implements Action {
	private String userID;
	private String xyz;
	public String getXyz() {
		return xyz;
	}

	public void setXyz(String xyz) {
	this.xyz = xyz;
	}

	private String password;
	private ArrayList<VendorBeans> vendorList = new ArrayList<VendorBeans>();

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public ArrayList<VendorBeans> getVendorList() {
		return vendorList;
	}

	public void setVendorList(ArrayList<VendorBeans> vendorList) {
		this.vendorList = vendorList;
	}

	public String execute() {
		System.out.println("in execute");
		
		System.out.println(getXyz());
		LoginService loginService = new LoginService();


		
String response =loginService.authenticate(getUserID(), getPassword());
HttpSession session = ServletActionContext.getRequest().getSession();

if(!"LOGIN".equalsIgnoreCase(response) ){
//session.setAttribute("logined","true");
session.setAttribute("userId",getUserID());

}
return response;


	}



	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
