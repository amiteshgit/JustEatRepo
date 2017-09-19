<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"
	import="org.justeat.service.CustomerOrders"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
//Integer userid = Integer.parseInt((String)session.getAttribute("userId"));%>
<form action="Cart.jsp">
	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"> Just Eat </a></li>
								<li style="text-decoration: none;color: #fff;background: rgba(255,255,255,0.2);"><a href="ChooseMenu.jsp">Choose Your Meal</a></li>
				<li style="text-decoration: none;color: #fff;background: rgba(255,255,255,0.2);"><a href="viewCustomerOrders.jsp">View Orders</a></li>
				<li><a href="#">View Vendor's Orders</a></li>
				<li><a href="#">Update Menu</a></li>
				<li><a href="#">View Confirmed Orders</a></li>
				<li><a href="#">Total Sales</a></li>
				<li style="text-decoration: none;color: #fff;background: rgba(255,255,255,0.2);"><%@ include file="Top.jsp" %></li>
				<li><a href="#">Contact Us</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="container">

			<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">=</a>
			<div class="main" style="position: relative;">
				<div class="accordion">

<%
int userid = Integer.parseInt((String) session.getAttribute("userId"));
System.out.println("in viewCustomerOrdersNew.jsp----userid="+userid);
CustomerOrders customerOrders = new CustomerOrders();
ResultSet rs = customerOrders.getOrderList(userid);
int counter1=0;

while (rs.next()) {
	counter1++;
	
%>
<table width="100%"><tr><td width="100%"><h3>
					Order ID:
					<%=rs.getInt(1)%>&nbsp;&nbsp;&nbsp;&nbsp; Order Time: <%=rs.getString(2) %></h3>
					
	</td></tr>	</table>
				<%
			
				ResultSet rs1 = null;

						rs1 = customerOrders.getVendorList(rs.getInt(1));
int counter2=0;
						while (rs1.next()) {
				counter2++;

			
			
			%>

					<div class="accordion-section1">
						
					<%--<a class="accordion-section-title" href="#accordion-<%=counter1%>-<%=counter2%>"> --%>
						<a class="accordion-section-title" href="javascript:showHideAcc('accordion-<%=counter1%>-<%=counter2%>')">
						<table  width="100%">
							<tr>
								<td width="34%" align="left">Vendor Name:&nbsp;<%=rs1.getString(1)%></td>
								
								<td width="33%">Status:&nbsp;<%=rs1.getString(2)%></td>
								
								<td width="33%" align="right">Expected time of delivery:&nbsp;<%=rs1.getString(4)%></td>
								
							</tr>
						</table>

</a>

					
						<div id="accordion-<%=counter1%>-<%=counter2%>" style="display:none" class="accordion-section-content">
<%
						ResultSet rs2 = null;
								rs2 = customerOrders.getItemDetails(rs1.getInt(3));
								
								while (rs2.next()) {%>
									<table style="border: 1px solid black;"  width="100%">
									
									<tr>
									<td style="border: 1px solid wheat;"><table width="100%" height="50px"><tr>
									
										<td style="padding-left:20px" width="60%"><%=rs2.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td>Quantity : <%=rs2.getInt(2)%></td>
										<td>Amount : <%=rs2.getInt(3)%></td>
									</tr></table></td>
									</tr>
								</table>
								<%
								}
					%>


							
					
								
						</div>
						<!--end .accordion-section-content-->

					</div>
					<!--end .accordion-section-->

					<%
					}}
					%>

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
</form>
</body>

</html>
