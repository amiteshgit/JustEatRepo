<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.justeat.service.EditMenuService"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="Top.jsp"%>
	<%
		Integer userid = Integer.parseInt((String) session.getAttribute("userId"));
	%>

	<%
		String itemName = request.getParameter("itemName") == null ? "0"
				: request.getParameter("itemName");
		String price = request.getParameter("price") == null ? "0" : request.getParameter("price");
		String availability = request.getParameter("availability") == null ? "0" : request.getParameter("availability");
		String oneShotQuantity = request.getParameter("oneShotQuantity") == null ? "0" : request.getParameter("oneShotQuantity");
		String oneShotTime = request.getParameter("oneShotTime") == null ? "0" : request.getParameter("oneShotTime");
		String itemID = request.getParameter("itemID") == null ? "0" : request.getParameter("itemID");
		int itemIDInt = Integer.parseInt(itemID);
		int priceInt = Integer.parseInt(price);
		int availabilityInt = Integer.parseInt(availability);
		int oneShotQuantityInt = Integer.parseInt(oneShotQuantity);
		int oneShotTimeInt = Integer.parseInt(oneShotTime);

		
		EditMenuService editMenuService = new EditMenuService();
		int res =editMenuService.editMenu(itemIDInt,itemName,priceInt, availabilityInt, oneShotQuantityInt,oneShotTimeInt);
		
		 
		 
		
	%>
</body>
</html>