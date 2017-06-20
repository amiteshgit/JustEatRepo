<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delight the Customers with More....</title>
<script type="text/javascript">

function callServlet(methodType){
	
	document.getElementById("HelloWorldForm").action="js_servlet/HelloWorldServlet";
	document.getElementById("HelloWorldForm").method=methodType;
	document.getElementById("HelloWorldForm").submit();
}

</script>

</head>
<body>
<%@ include file="Top.jsp" %> 
<%Integer userid = Integer.parseInt((String)session.getAttribute("userId"));%>

<s:form action="UpdateMenu">
<s:textfield label="Item Name" key="itemName" />
<s:textfield label="Price" key="price" />
<s:textfield label="Availability" key="availability" />
<s:textfield label="Vendor ID" key="vendorID" />


<s:submit />
</s:form>




</body>
</html>