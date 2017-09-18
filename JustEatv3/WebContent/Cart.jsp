<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ include file="Top.jsp" %>   
<%Integer userid = Integer.parseInt((String)session.getAttribute("userId"));%>

<form action=processing.jsp>
	<table border="2" style="border-collapse:collapse;" >
		<tr>
			<th style=""><font size="2">Vendor</font></th>
			<th><font size="2" width="2">Item Name</font></th>
			<th><font size="2" width="2">Quantity</font></th>
			<th><font size="2" width="2">Amount</font></th>
		</tr>
		

		<%
		
		
		String tempId="";
		String tempName="";
		int counter=0;
		String tableValue=null;
			String dataF[] = request.getParameterValues("dataField");
			for (int i = 0; i < dataF.length; i++) {

				StringTokenizer st = new StringTokenizer(dataF[i], "@");
		%>

		<tr><%counter=0;
		while (st.hasMoreTokens()){
		counter++;
		tableValue=st.nextToken();
		
		if(counter==1){
			//vendor[i]=tableValue;
			tempId="vendor"+i;
			tempName="vendor";
		}
		if(counter==2){
			//itemName[i]=tableValue;
		tempId="itemName"+i;
		tempName="itemName";
		}
		if(counter==3)
		{
			//quantity[i]=tableValue;
			tempId="quantity"+i;
			tempName="quantity";
		}
		if(counter==4){
			
		
			//amount[i]=tableValue;
			tempId="amount"+i;
			tempName="amount";
		
		}
		if(counter==5){
			
			
			//amount[i]=tableValue;
			tempId="vendorID"+i;
			tempName="vendorID";
		
		}
		if(counter==6){
			
			
			//amount[i]=tableValue;
			tempId="itemID"+i;
			tempName="itemID";
		
		}
		%>
			
		<%-- <td width="3"><font size="6"><%=tableValue %></font></td>--%>
			<td><input readonly type="text" id="<%=tempId%>" value="<%=tableValue%>" name="<%=tempName%>">
			</td>
			
			<%	
		} 
		%>
			<%st=null;
			tableValue=null;%>
		</tr>
	

	<%
		}
			
			
	%>

</table>
<input type="submit" value="Check out">
</form>

</body>
</html>