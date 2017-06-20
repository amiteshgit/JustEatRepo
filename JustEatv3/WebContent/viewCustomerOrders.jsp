<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="org.justeat.service.CustomerOrders"%>
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
	<%@ include file="Top.jsp"%>
	<%
		Integer userid = Integer.parseInt((String) session.getAttribute("userId"));
	%>

	<form>
		<input type="text" name="quantity1">
		<div data-role="page" id="pageone">
			<div data-role="header">
				<h1>Order Summary</h1>
			</div>


			<div data-role="main" class="ui-content">
				<h2>Order Summary:</h2>
				<%
					CustomerOrders customerOrders = new CustomerOrders();
					ResultSet rs = customerOrders.getOrderList(userid);
					while (rs.next()) {
				%>
				<h3>
					Order ID:
					<%=rs.getInt(1)%>
				</h3>

				<%
					ResultSet rs1 = null;

						rs1 = customerOrders.getVendorList(rs.getInt(1));

						while (rs1.next()) {
				%>
				<div data-role="collapsible" id="vendor" name="vendor">
					<h4>
						<table>
							<tr>
								<td>Vendor Name:</td>
								<td width="600"><%=rs1.getString(1)%></td>
								<td>Status:</td>
								<td width="400"><%=rs1.getString(2)%></td>
								<td>Expected time of delivery:</td>
								<td><%=rs1.getInt(4)%></td>
							</tr>
						</table>
					</h4>
					<%
						ResultSet rs2 = null;
								rs2 = customerOrders.getItemDetails(rs1.getInt(3));
					%>




					<ul data-role="listview">



						<%
							while (rs2.next()) {
						%>


						<li>
							<div class="container"
								style="overflow: hidden; padding-right: .5em;" id="menu">

								<table width="100%">
									<tr>
										<td width="60%"><%=rs2.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>Quantity : <%=rs2.getInt(2)%></td>
										<td>Amount : <%=rs2.getInt(3)%></td>

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
					}
				%>



			</div>
	</form>
</body>

</body>
</html>