<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="org.justeat.service.ViewPendingVendorOrders"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="ajax.js"></script>
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
					ViewPendingVendorOrders viewPendingVendorOrders = new ViewPendingVendorOrders();
					ResultSet rs = viewPendingVendorOrders.getOrderList(userid, 2);

					while (rs.next()) {
				%>
				<div data-role="collapsible" id="vendor<%=rs.getInt(1)%>"
					name="vendor<%=rs.getInt(1)%>">
					<h3><table align="right" width="100%">
						<tr><td>Order ID:</td>
						<td><%=rs.getInt(1)%>&nbsp;-</td><td> &nbsp;<%=rs.getString(2)%></td><td align="right" width="100%"><a
									href="javascript:updateStatus('vendor<%=rs.getInt(1)%>','<%=rs.getInt(3)%>','<%= 2%>')">Deliver</a></td>
						</tr></table>
					</h3>




					<%
						ResultSet rs1 = null;
							rs1 = viewPendingVendorOrders.getItemList(rs.getInt(3));
					%>




					<ul data-role="listview">

						<table align="right" width="100%">
							<tr>
								<td align="right" width="100%"><a
									href="javascript:updateStatus('vendor<%=rs.getInt(1)%>','<%=rs.getInt(3)%>','<%= 3%>')">Deliver</a></td>

							</tr>
						</table>

						<%
							while (rs1.next()) {
						%>


						<li>
							<div class="container"
								style="overflow: hidden; padding-right: .5em;" id="menu">

								<table width="100%">
									<tr>
										<td width="60%"><%=rs1.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>Quantity : <%=rs1.getInt(2)%></td>
										<td>Amount : <%=rs1.getInt(3)%></td>

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

				</td>
				</tr>
				</table>

			</div>
	</form>
</body>

</body>

</body>
</html>