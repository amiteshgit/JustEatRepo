<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="org.justeat.service.EditMenuService"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delight the Customers with More...</title>
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
		Integer userid = Integer.parseInt((String) session.getAttribute("userId"));
	%>
	<%--<s:form action="UpdateMenu">--%>
	<form >
		<%--<input type="hidden" name="quantity1"> --%>
		<div id="wrapper">

			<!-- Sidebar -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="#"> Just Eat </a></li>
					<li
						style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a
						href="viewPendingVendorOrders.jsp">View Orders</a></li>
					<li
						style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a
						href="UpdateMenu.jsp">Add New item</a></li>
						<li
						style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a
						href="EditMenu.jsp">View/Edit Menu</a></li>
					<li
						style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a
						href="viewConfirmedVendorOrder.jsp">View Packed orders</a></li>
					<li
						style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><%@ include
							file="Top.jsp"%></li>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>
			<!-- /#sidebar-wrapper -->

			<!-- Page Content -->
			<div id="container">

				<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">=</a>
				<div class="main" style="position: relative;" align="center">
					<div class="accordion" align="center" >

	
	<%EditMenuService editMenuService = new EditMenuService();
							ResultSet rs = editMenuService.getMenuList(userid);%>	


						<table border="2" style="border-collapse: collapse; width: 100%">
							<tr>
								<th class="thStyle"><font size="2">Item Name</font></th>
							
								<th class="thStyle"><font size="2">Price</font></th>
					
								<th class="thStyle"><font size="2" >Availability</font></th>
								
								<th class="thStyle"><font size="2">One Shot Quantity</font></th>
								
								<th class="thStyle"><font size="2">One Shot Time</font></th>
								
							</tr>
							<%while (rs.next()) {%>
							
							<tr>
								<td class="tdStyle"><input style="width:100%;height:40px;" type="text" id="<%=rs.getInt(6)+"itemName"%>" name="itemName" value="<%=rs.getString(1)%>"/></td>
								
							
								<td class="tdStyle"><input style="width:100%;height:40px;" type="text" id="<%=rs.getInt(6)+"price"%>" name="Price" value="<%=rs.getInt(2)%>"/></td>
								
					<td class="tdStyle"><select   id="<%=rs.getInt(6)+"availability"%>" name="availability" value="<%=rs.getString(7)%>">
  <option value="1">Breakfast</option>
  <option value="2">Lunch</option>
  <option value="3">Tea Time</option>
  <option value="4">Dinner</option>
</select></td>
								
								
								
								<td class="tdStyle"><input style="width:100%;height:40px;" type="text" id="<%=rs.getInt(6)+"oneShotQuantity"%>" name="One Shot Quantity" value="<%=rs.getInt(4)%>"/></td>
								
								
								<td class="tdStyle"><input style="width:100%;height:40px;" type="text" id="<%=rs.getInt(6)+"oneShotTime"%>" name="One Shot Time" value="<%=rs.getInt(5)%>"/></td>
								<td class="tdStyle"><input style="width: 100%;height:40px;border-radius:10px;background-color: #1ab188;" type="button" value="Update" onclick="changeMenu('<%=rs.getInt(6)%>');"></td>
								
							</tr>
							
							<%} %>


						</table>
					
						<!--end .accordion-section-->
					</div>

					<!--end .accordion-->
				</div>



			</div>
			<!-- /#page-content-wrapper -->

		</div>


		<script type="text/javascript">
			function changeMenu(itemID) {
				//alert("kiirttii");
				var itemName = document.getElementById(itemID+"itemName").value;
				var price = document.getElementById(itemID+"price").value;
				var availability = document.getElementById(itemID+"availability").value;
				var oneShotQuantity = document.getElementById(itemID+"oneShotQuantity").value;
				var oneShotTime = document.getElementById(itemID+"oneShotTime").value;
				var url = "EditMenuProc.jsp";
				
				var params = "itemName=" + itemName + "&price=" + price
						+ "&availability=" + availability + "&oneShotQuantity=" + oneShotQuantity + "&oneShotTime=" + oneShotTime + "&itemID=" + itemID;
				// params = "a=" + a + "&b=" + b+"&c="+c; For example
				ajaxSubmitReqUtil(url, params, '', 'na', '');
	
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
