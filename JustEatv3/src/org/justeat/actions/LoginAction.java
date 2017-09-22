package org.justeat.actions;

import javax.servlet.http.HttpSession;
//import com.opensymphony.webwork.ServletActionContext;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.justeat.beans.LoginBean;
import org.justeat.beans.VendorBeans;
import org.justeat.service.LoginService;

import com.opensymphony.xwork2.Action;

public class LoginAction implements Action {
	private String userID;
	

	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String execute() {

		LoginService loginService = new LoginService();
		LoginBean loginBean = new LoginBean();

		loginBean = loginService.authenticate(getUserID(), getPassword());
		System.out.println("user type printing: "+loginBean.getUserType());
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		if (!"LOGIN".equalsIgnoreCase(loginBean.getUserType())) {
			session.setAttribute("userId", loginBean.getUserID());

		}
		return loginBean.getUserType();

	}

}
