<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"
	import="org.justeat.service.VendorService"%>
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
<input type="hidden" name="quantity1">
	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"> Just Eat </a></li>
				<li style="text-decoration: none;color: #fff;background: rgba(255,255,255,0.2);"><a href="ChooseMenu.jsp">Choose Your Meal</a></li>
				<li style="text-decoration: none;color: #fff;background: rgba(255,255,255,0.2);"><a href="viewCustomerOrders.jsp">View Orders</a></li>
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
<div style="width:100%;height:50px" align="center" >	<input style="width: 20%;height:50px;border-radius:10px;background-color: #1ab188;" type="submit" value="Go to Cart"></div>
<%
				VendorService vendorService = new VendorService();
				ResultSet rs = null;

				rs = vendorService.getVendorList();
				int counter=0;
				while (rs.next()) {
			counter++;
		System.out.println("ChooseMenuNew.jsp----counter="+counter);	
			%>

					<div class="accordion-section1">
						
					<%--<a class="accordion-section-title" href="#accordion-<%=counter%>"><%=rs.getString("vendor_name")%></a> --%>
<a class="accordion-section-title" href="javascript:showHideAcc('accordion-<%=counter%>')"><%=rs.getString("vendor_name")%></a>
					
						<div id="accordion-<%=counter%>" style="display:none;" class="accordion-section-content">

								<table style="border: 1px solid black;"  width="100%">
									<%
					ResultSet rs1 = null;
						VendorService vendorService1 = new VendorService();
						rs1 = vendorService1.getMenuList(rs.getInt("vendor_id"));
						String dataValue="";
						while (rs1.next()) {
							 dataValue=rs.getString("vendor_name")+"@"+rs1.getString(1)+"@"+"0";
					%>		
								<tr>
									<td style="border: 1px solid wheat;"><table width="100%" height="50px"><tr>
									<td style="padding-left:20px" width="60%"><%=rs1.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									
									<td width="10%"><input type="button" style="float: right ;width:100%;"
										onclick="decrementValue('<%=rs1.getString(2)%>','<%=rs.getString("vendor_name")%>','<%=rs1.getString(1)%>','<%=rs1.getString(3)%>','<%=rs.getString("vendor_id")%>')" value="-" />
										</td>
										
										
									<td width="10%" align="center"><input style="text-align: center;width:100%" type="text"
										name="quantity" value="0" maxlength="2" max="10" size="1"
										id="<%=rs1.getString(2)%>" width="10" />
										<input type="hidden" name="dataField" value="" id="<%=rs1.getString(2)+"data"%>" /></td>
									<td width="10%"><input style="width:100%" type="button" onclick="incrementValue('<%=rs1.getString(2)%>','<%=rs.getString("vendor_name")%>','<%=rs1.getString(1)%>','<%=rs1.getString(3)%>','<%=rs.getString("vendor_id")%>')" value="+" width="10" /></td>
								
								<td width="10%" style="text-align: right;padding-right:10px"><input  style="text-align: right; " type="text"
										name="price" value="<%=rs1.getString(3)%>" maxlength="2" max="10" size="1"
										id="<%=rs1.getString(2)+"price"%>" width="10" /></td>
								
								</tr></table></td> 
								</tr>

							<%dataValue="";
						}
					%>
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
