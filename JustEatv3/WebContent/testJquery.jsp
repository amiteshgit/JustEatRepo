<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="org.justeat.service.VendorService"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
<%@ include file="Top.jsp" %> 
<%Integer userid = Integer.parseInt((String)session.getAttribute("userId"));%>

<form action=Proceed.jsp>
<input type="text" name="quantity1">
	<div data-role="page" id="pageone">
		<div data-role="header">
			<h1>Collapsible Lists</h1>
		</div>

		<div data-role="main" class="ui-content">
			<h2>Vendors:</h2>
			<%
				VendorService vendorService = new VendorService();
				ResultSet rs = null;

				rs = vendorService.getVendorList();

				while (rs.next()) {
			%>
			<div data-role="collapsible" id="vendor" name="vendor">
				<h4><%=rs.getString("vendor_name")%></h4>
				<%
					ResultSet rs1 = null;
						VendorService vendorService1 = new VendorService();
						rs1 = vendorService1.getMenuList(rs.getInt("vendor_id"));
				%>




				<ul data-role="listview">



					<%
						while (rs1.next()) {
					%>


					<li>
						<div class="container"
							style="overflow: hidden; padding-right: .5em;" id="menu">

							<table width="100%">
								<tr>
									<td width="60%"><%=rs1.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td><input type="button" style="float: right"
										onclick="decrementValue(<%=rs1.getString(2)%>)" value="-" /></td>
									<td><input style="text-align: center;" type="text"
										name="quantity" value="0" maxlength="2" max="10" size="1"
										id="<%=rs1.getString(2)%>" width="10" /></td>
									<td><input type="button"
										onclick="incrementValue(<%=rs1.getString(2)%>)" value="+"
										width="10" /></td>
								</tr>
							</table>
						</div>
					</li>


					<%
						}
					%>
				</ul>
			</div>
			<%
				}
			%>
			<table>
				<tr>
					<td><a href="javascript:proceed(22)">Proceed</a></td>
				</tr>
			</table>


			</td>
			</tr>
			</table>

		</div>

		<div data-role="footer">
			<h1>Insert Footer Text Here</h1>
		</div>
	</div>
	<input type="submit" value="Submit">

</body>
</html>

<script type="text/javascript">
function incrementValue(quantID)
{
    var value = parseInt(document.getElementById(quantID).value, 10);
    value = isNaN(value) ? 0 : value;
    if(value<10){
        value++;
            document.getElementById(quantID).value = value;
    }
}
function decrementValue(quantID)
{
    var value = parseInt(document.getElementById(quantID).value, 10);
    value = isNaN(value) ? 0 : value;
    if(value>1){
        value--;
            document.getElementById(quantID).value = value;
    }

}

function proceed(id){
	
    var val=document.getElementById(id).value ;
    
    window.location="Proceed.jsp";
    
}
</script>