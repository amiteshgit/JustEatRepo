<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="org.justeat.service.ViewPendingVendorOrders"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Summary</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet" type="text/css" href="../assets-2/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Abeezee:400|Open+Sans:400,600,700|Source+Sans+Pro:400,600">
<link rel="stylesheet" type="text/css" href="defaults.css">


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="accordion.js"></script>
<script>
	
</script>




<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" type="text/css" href="demo.css">
<script src="ajax.js"></script>

</head>

<body>
	<%
		//check now
		//Integer userid = Integer.parseInt((String)session.getAttribute("userId"));
	%>
	<form action="Cart.jsp">
		<input type="hidden" name="quantity1">
		<div id="wrapper">

			<!-- Sidebar -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="#"> Just Eat </a></li>
					<li	style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a href="viewPendingVendorOrders.jsp">View Orders</a></li>
						<li
						style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a
						href="UpdateMenu.jsp">Add New item</a></li>
						<li
						style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a
						href="EditMenu.jsp">View/Edit Menu</a></li>
					<li	style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a href="viewConfirmedVendorOrder.jsp">View Packed orders</a></li>
					<li	style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a href="CookView.jsp">Chef de' Kitchen</a></li>
					<li style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><%@ include file="Top.jsp"%></li>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>
			<!-- /#sidebar-wrapper -->

			<!-- Page Content -->
			<div id="container">

				<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">=</a>
				<div class="main" style="position: relative;">
					<div class="accordion">
						<h4 size="20">New Orders:</h4>
						<%
							int userid = Integer.parseInt((String) session.getAttribute("userId"));
							System.out.println("in viewCustomerOrdersNew.jsp----userid=" + userid);
							ViewPendingVendorOrders viewPendingVendorOrders = new ViewPendingVendorOrders();
							ResultSet rs = viewPendingVendorOrders.getOrderList(userid, 1);
							int counter1 = 0;
							while (rs.next()) {

								counter1++;
						%>

						<div class="accordion-section1" id="vendor<%=rs.getInt(1)%>"
							name="vendor<%=rs.getInt(1)%>">

							<%--<a class="accordion-section-title" href="#accordion-<%=counter1%>-<%=counter2%>"> --%>
							<a class="accordion-section-title"
								href="javascript:showHideAcc('accordion-<%=counter1%>')">
								<table width="100%">
									<tr>
										<td width="10%">Order ID:</td>

										<td width="10%"><%=rs.getInt(1)%>&nbsp;</td>
										<td width="10%">Customer Name:</td>
										<td width="80%">&nbsp;<%=rs.getString(2)%></td>
										<%--<td width="50%" align="right">Expected time of delivery:</td>
								<td width="10%"><select id="<%="time" + rs.getInt(3)%>">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
								</select>&nbsp;mins</td>
								 --%>
									</tr>
								</table>
							</a>


							<div id="accordion-<%=counter1%>" style="display: none"
								class="accordion-section-content">

								<%
									ResultSet rs1 = null;
										rs1 = viewPendingVendorOrders.getItemList(rs.getInt(3));
								%>

								<%-- <table align="right" width="100%" style="border: 1px solid wheat;">
							<tr>
								<td align="right" width="100%"><a
									href="javascript:updateStatus('vendor<%=rs.getInt(1)%>','<%=rs.getInt(3)%>','<%=2%>')">Confirm</a></td>

							</tr>
						</table>
--%>
								<table width="100%">
									<tr>
										<td width="90%">
											<%
												while (rs1.next()) {
											%>
											<table width="100%" height="50px"
												style="border: 1px solid wheat;">

												<tr>
													<td style="padding-left: 20px" width="60%"><%=rs1.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td width="20%">Quantity : <%=rs1.getInt(2)%></td>
													<td width="20%">Amount : <%=rs1.getInt(3)%></td>

												</tr>
											</table> <%
 	}
 %>


										</td>
										<td width="10%" style="padding-left: 10px"><a
											href="javascript:updateStatus('vendor<%=rs.getInt(1)%>','<%=rs.getInt(3)%>','<%=2%>')">Package</a>
										</td>

									</tr>
								</table>


							</div>
							<!--end .accordion-section-content-->

						</div>
						<!--end .accordion-section-->

						<%
							}
						%>

						<!--end .accordion-section-->
					</div>
					<!--end .accordion-->
				</div>



			</div>
			<!-- /#page-content-wrapper -->

		</div>



		<script type="text/javascript">
			function incrementValue(quantID, vname, iname, price, vID) {
				//alert("kiirttii");
				var value = parseInt(document.getElementById(quantID).value, 10);
				var dataID = quantID + "data";
				var priceID = quantID + "price";

				value = isNaN(value) ? 0 : value;
				if (value < 10) {
					value++;
					document.getElementById(quantID).value = value;

					var itemprice = value * price;

					var res = vname + "@" + iname + "@" + value + "@"
							+ itemprice + "@" + vID + "@" + quantID;
					document.getElementById(dataID).value = res;
					document.getElementById(priceID).value = itemprice;

				}
			}
			function decrementValue(quantID, vname, iname, price, vID) {
				var value = parseInt(document.getElementById(quantID).value, 10);
				var dataID = quantID + "data";
				var priceID = quantID + "price";
				var str = document.getElementById(dataID).value;
				value = isNaN(value) ? 0 : value;
				if (value >= 1) {
					value--;

					var itemprice = value * price;
					document.getElementById(quantID).value = value;

					var res = vname + "@" + iname + "@" + value + "@"
							+ itemprice + "@" + vID + "@" + quantID;
					if (value == 0) {
						res = '';
					}
					{
						document.getElementById(dataID).value = res;
						document.getElementById(priceID).value = itemprice;
					}

				}
			}
		</script>

		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>

		<!-- Menu Toggle Script -->
		<script>
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
		</script>
	</form>
</body>

</html>
