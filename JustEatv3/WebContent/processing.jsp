<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="org.justeat.service.OrderService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Top.jsp" %> 
<%Integer userid = Integer.parseInt((String)session.getAttribute("userId"));%>

<%String Vendor[]=request.getParameterValues("vendorID");%>
<%String ItemName[]=request.getParameterValues("itemID");%>
<%String Quantity[]=request.getParameterValues("quantity");%>
<%String Amount[]=request.getParameterValues("amount");%>




<%new OrderService().updateOrder(Vendor,ItemName,Quantity,Amount,userid); 
response.sendRedirect("OrderSummary.jsp");%>



</body>
</html>