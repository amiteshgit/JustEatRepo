<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--<%@ page import=" javax.servlet.http.HttpSession"%>
    <%@ page import=" org.apache.struts2.ServletActionContext"%>
    --%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="ajax.js"></script>

<%
	//HttpSession session = ServletActionContext.getRequest().getSession();
	String userId = "";
	try {
		userId = session.getAttribute("userId").toString();
		session.setAttribute("userId", userId);
	} catch (Exception e) {

		response.sendRedirect("logout.jsp");
	}
%>
<a href="logout.jsp">Logout</a>


