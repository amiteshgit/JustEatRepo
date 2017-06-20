<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
	<%@ page import="java.sql.*"%>
	<%@ page import="org.justeat.service.ViewPendingVendorOrders"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Top.jsp" %> 
<%Integer userid = Integer.parseInt((String)session.getAttribute("userId"));%>

<%
String vendorOrderId=request.getParameter("vendorOrderId")==null?"0":request.getParameter("vendorOrderId");
int vendorOrderIdInt=Integer.parseInt(vendorOrderId);  

System.out.println("vendorOrderId=proc jsp="+vendorOrderId);
ViewPendingVendorOrders ob = new ViewPendingVendorOrders();
ob.updateMenu(vendorOrderIdInt);
%>
</body>
</html>