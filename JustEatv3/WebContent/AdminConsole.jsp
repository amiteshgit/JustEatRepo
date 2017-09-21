<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*"
	import="org.justeat.service.ViewPendingVendorOrders"%>
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
		//Integer userid = Integer.parseInt((String)session.getAttribute("userId"));
	%>
	<form action=processing.jsp>

		<%--<input type="hidden" name="quantity1"> --%>
		<div id="wrapper">

			<!-- Sidebar -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="#"> Just Eat </a></li>
					<li	style="text-decoration: none; color: #fff; background: rgba(255, 255, 255, 0.2);"><a href="OnboardVendors.jsp">Add a new vendor</a></li>
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


						




						<!--end .accordion-section-->
					</div>

					<!--end .accordion-->
				</div>



			</div>
			<!-- /#page-content-wrapper -->

		</div>


		

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
