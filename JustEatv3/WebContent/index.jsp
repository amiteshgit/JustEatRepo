<!DOCTYPE html>
<html lang="en">

<head>
<title>Just Eat</title>
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

function selectId(id){
	
	document.getElementById(id).style.display="block";
}

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

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"> Start Bootstrap </a></li>
				<li><a href="ChooseMenu.jsp">Choose Your Meal</a></li>
				<li><a href="#">View Orders</a></li>
				<li><a href="#">View Vendor's Orders</a></li>
				<li><a href="#">Update Menu</a></li>
				<li><a href="#">View Confirmed Orders</a></li>
				<li><a href="#">Total Sales</a></li>
				<li><a href="#">Logout</a></li>
				<li><a href="#">Contact Us</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="container">

			<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">=</a>
			<div class="main" style="position: absolute;">
				<div class="accordion">


					<div class="accordion-section1" id="id1">
						<a class="accordion-section-title" href="#accordion-2">Accordion
							Section #2</a>
						<div id="accordion-2" class="accordion-section-content">
							<p>Mauris interdum fringilla augue vitae tincidunt. Curabitur
								vitae tortor id eros euismod ultrices. Cum sociis natoque
								penatibus et magnis dis parturient montes, nascetur ridiculus
								mus. Praesent nulla mi, rutrum ut feugiat at, vestibulum ut
								neque? Cras tincidunt enim vel aliquet facilisis. Duis congue
								ullamcorper vehicula. Proin nunc lacus, semper sit amet elit sit
								amet, aliquet pulvinar erat. Nunc pretium quis sapien eu
								rhoncus. Suspendisse ornare gravida mi, et placerat tellus
								tempor vitae.</p>
						</div>
						<!--end .accordion-section-content-->
					</div>
					<div class="accordion-section1" id="id2" >
						<a class="accordion-section-title" href="#accordion-3">Accordion
							Section #3</a>
						<div id="accordion-3" class="accordion-section-content">
							<p>Mauris22 interdum fringilla augue vitae tincidunt. Curabitur
								vitae tortor id eros euismod ultrices. Cum sociis natoque
								penatibus et magnis dis parturient montes, nascetur ridiculus
								mus. Praesent nulla mi, rutrum ut feugiat at, vestibulum ut
								neque? Cras tincidunt enim vel aliquet facilisis. Duis congue
								ullamcorper vehicula. Proin nunc lacus, semper sit amet elit sit
								amet, aliquet pulvinar erat. Nunc pretium quis sapien eu
								rhoncus. Suspendisse ornare gravida mi, et placerat tellus
								tempor vitae.</p>
						</div>
						<!--end .accordion-section-content-->
					</div>
					<div class="accordion-section1"  >
						<a class="accordion-section-title" href="#accordion-4">Accordion
							Section #4</a>
						<div id="accordion-4" class="accordion-section-content">
							<p>Mauris22 interdum fringilla augue vitae tincidunt. Curabitur
								vitae tortor id eros euismod ultrices. Cum sociis natoque
								penatibus et magnis dis parturient montes, nascetur ridiculus
								mus. Praesent nulla mi, rutrum ut feugiat at, vestibulum ut
								neque? Cras tincidunt enim vel aliquet facilisis. Duis congue
								ullamcorper vehicula. Proin nunc lacus, semper sit amet elit sit
								amet, aliquet pulvinar erat. Nunc pretium quis sapien eu
								rhoncus. Suspendisse ornare gravida mi, et placerat tellus
								tempor vitae.</p>
						</div>
						<!--end .accordion-section-content-->
					</div>
					<div class="accordion-section1" >
						<a class="accordion-section-title" href="#accordion-5">Accordion
							Section #5</a>
						<div id="accordion-5" class="accordion-section-content">
							<p>Mauris22 interdum fringilla augue vitae tincidunt. Curabitur
								vitae tortor id eros euismod ultrices. Cum sociis natoque
								penatibus et magnis dis parturient montes, nascetur ridiculus
								mus. Praesent nulla mi, rutrum ut feugiat at, vestibulum ut
								neque? Cras tincidunt enim vel aliquet facilisis. Duis congue
								ullamcorper vehicula. Proin nunc lacus, semper sit amet elit sit
								amet, aliquet pulvinar erat. Nunc pretium quis sapien eu
								rhoncus. Suspendisse ornare gravida mi, et placerat tellus
								tempor vitae.</p>
						</div>
						<!--end .accordion-section-content-->
					</div>
					<div class="accordion-section1"  >
						<a class="accordion-section-title" href="#accordion-6">Accordion
							Section #6</a>
						<div id="accordion-6" class="accordion-section-content">
							<p>Mauris22 interdum fringilla augue vitae tincidunt. Curabitur
								vitae tortor id eros euismod ultrices. Cum sociis natoque
								penatibus et magnis dis parturient montes, nascetur ridiculus
								mus. Praesent nulla mi, rutrum ut feugiat at, vestibulum ut
								neque? Cras tincidunt enim vel aliquet facilisis. Duis congue
								ullamcorper vehicula. Proin nunc lacus, semper sit amet elit sit
								amet, aliquet pulvinar erat. Nunc pretium quis sapien eu
								rhoncus. Suspendisse ornare gravida mi, et placerat tellus
								tempor vitae.</p>
						</div>
						<!--end .accordion-section-content-->
					</div>
					<!--end .accordion-section-->

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

</body>

</html>
