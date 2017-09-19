<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="s" uri="/struts-tags" %>  
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
<%Integer userid = Integer.parseInt((String)session.getAttribute("userId"));%>
<%--<s:form action="UpdateMenu">--%>
<form action="UpdateMenu">
<%--<input type="hidden" name="quantity1"> --%>
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
		<div id="container" >

			<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">=</a>
			<div class="main" style="position: relative;" align="center">
				<div class="accordion"  >



	<table border="2" style="border-collapse:collapse;width:100%" >
		<tr><td class="tdStyle">Item Name</td>
		<td class="tdStyle"><input style="width:100%;height:40px;" type="text" id="itemName" name="itemName"/></td></tr>
		
		<tr><td class="tdStyle">Price</td>
		<td class="tdStyle"><input style="width:100%;height:40px;" type="text" id="price" name="price"/></td></tr>
		
		<tr><td class="tdStyle">Availability</td>
		<td class="tdStyle"><select style="width:100%;height:40px;"  id="availability" name="availability">
  <option value="1">Breakfast</option>
  <option value="2">Lunch</option>
  <option value="3">Tea Time</option>
  <option value="4">Dinner</option>
</select></td></tr>
		
				<tr><td class="tdStyle">OneShotQuantity</td>
		<td class="tdStyle"><input style="width:100%;height:40px;" type="text" id="oneShotQuantity" name="oneShotQuantity"/></td></tr>
				<tr><td class="tdStyle">OneShotTime</td>
		<td class="tdStyle"><input style="width:100%;height:40px;" type="text" id="oneShotTime" name="oneShotTime"/></td></tr>
		</table>
		<div style="width:100%;height:50px" align="center" ><input style="width: 20%;height:50px;border-radius:10px;background-color: #1ab188;" type="submit" value="Submit"></div>
					<!--end .accordion-section-->
				</div>

				<!--end .accordion-->
			</div>



		</div>
		<!-- /#page-content-wrapper -->

	</div>


<script type="text/javascript">
function incrementValue(quantID,vname,iname,price,vID)
{
	//alert("kiirttii");
    var value = parseInt(document.getElementById(quantID).value, 10);
    var dataID=quantID+"data";
    var priceID=quantID+"price";
    
    
    value = isNaN(value) ? 0 : value;
    if(value<10){
        value++;
            document.getElementById(quantID).value = value;
            
            var itemprice=value*price;
            
        	var res = vname+"@"+iname+"@"+value+"@"+itemprice+"@"+vID+"@"+quantID;
        	document.getElementById(dataID).value=res;
        	document.getElementById(priceID).value=itemprice;
        	
    }
}
function decrementValue(quantID,vname,iname,price,vID)
{
    var value = parseInt(document.getElementById(quantID).value, 10);
    var dataID=quantID+"data";
    var priceID=quantID+"price";
    var str=document.getElementById(dataID).value;
    value = isNaN(value) ? 0 : value;
    if(value>=1){
    	value--;
    	
    	 var itemprice=value*price;
    	 document.getElementById(quantID).value = value;
        
    	 
    	 
    	 var res = vname+"@"+iname+"@"+value+"@"+itemprice+"@"+vID+"@"+quantID;
    	if(value==0){
    		res='';}
    	{
    	 document.getElementById(dataID).value=res;
    	 document.getElementById(priceID).value=itemprice;
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

</form></body>

</html>
