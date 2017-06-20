package org.justeat.actions;

import org.justeat.service.UpdateMenuService;

public class UpdateMenuAction {

	private String itemName;

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

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public int getVendorID() {
		return vendorID;
	}

	public void setVendorID(int vendorID) {
		this.vendorID = vendorID;
	}

	private int price;
	private String availability;
	private int vendorID;

	public String execute() {

		UpdateMenuService updateMenuService = new UpdateMenuService();

		updateMenuService.updateMenu(getItemName(), getPrice(), getAvailability(), getVendorID());
		return "success";

	}

}
