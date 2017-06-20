package org.justeat.actions;

import java.util.ArrayList;

import org.justeat.beans.VendorBeans;
import org.justeat.service.VendorService;

public class VendorAction {
	ArrayList<VendorBeans> vendorList = new ArrayList<VendorBeans>();

	public String execute() {
		System.out.println("I am in execute function");

		VendorService vendorService = new VendorService();
		//vendorList = vendorService.getVendorList();
		return "success";

	}

	public ArrayList<VendorBeans> getVendorList() {
		return vendorList;
	}

	public void setVendorList(ArrayList<VendorBeans> vendorList) {
		this.vendorList = vendorList;
	}

}
