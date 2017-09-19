package org.justeat.actions;


import org.justeat.service.UpdateMenuService;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;


public class UpdateMenuAction {

	private String itemName;
	private int oneShotQuantity;
	private int oneShotTime;

	public int getOneShotQuantity() {
		return oneShotQuantity;
	}

	public void setOneShotQuantity(int oneShotQuantity) {
		this.oneShotQuantity = oneShotQuantity;
	}

	public int getOneShotTime() {
		return oneShotTime;
	}

	public void setOneShotTime(int oneShotTime) {
		this.oneShotTime = oneShotTime;
	}

	public int getPrice() {
		return price;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAvailability() {
		return availability;
	}

	public void setAvailability(int availability) {
		this.availability = availability;
	}

	public int getVendorID() {
		return vendorID;
	}

	public void setVendorID(int vendorID) {
		this.vendorID = vendorID;
	}

	private int price;
	private int availability;
	private int vendorID;

	public String execute() {

		UpdateMenuService updateMenuService = new UpdateMenuService();
		HttpSession session=ServletActionContext.getRequest().getSession();
		
		Integer userid = Integer.parseInt((String)session.getAttribute("userId"));
		setVendorID(userid);
		updateMenuService.updateMenu(getItemName(), getPrice(), getAvailability(), getVendorID(), getOneShotQuantity(), getOneShotTime());
		return "success";

	}

}
