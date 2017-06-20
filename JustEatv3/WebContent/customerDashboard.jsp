<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Top.jsp" %>  
<%Integer userid = Integer.parseInt((String)session.getAttribute("userId"));%>

<form action="">
         <input type="button" value="Choose Your Meal" onclick="window.location.href='ChooseMenu.jsp';"/><br><br>
         <input type="button" value="View Orders" onclick="window.location.href='viewCustomerOrders.jsp';"/><br><br>
         
			  <br> <br>    
    </form> 


</a>


</body>
</html>