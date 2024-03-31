<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>Eventos</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<link rel="apple-touch-icon" sizes="180x180"
	href="/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!-- LOADER -->
	<div id="preloader">
		<div class="loader">
			<div class="loader__bar"></div>
			<div class="loader__bar"></div>
			<div class="loader__bar"></div>
			<div class="loader__bar"></div>
			<div class="loader__bar"></div>
			<div class="loader__ball"></div>
		</div>
	</div>
	<!-- end loader -->
	<!-- END LOADER -->


	    <%@ include file="navbar.jsp" %>
	    
	   
            <div class="section-title text-center">
                <h3>Your Events</h3>
            </div>
	    
	    
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="portfolio-filter text-center">
					<ul>
						<li><a class="btn btn-dark btn-radius btn-brd active"
							href="#" data-filter="*"><span class="oi hidden-xs"
								data-glyph="grid-three-up"></span> All</a></li>
						<li><a class="btn btn-dark btn-radius btn-brd"
							data-toggle="tooltip" data-placement="top" title="" href="#"
							data-filter=".cat1">Stand-up</a></li>
						<li><a class="btn btn-dark btn-radius btn-brd" href="#"
							data-toggle="tooltip" data-placement="top" title=""
							data-filter=".cat2">concerts</a></li>
						<li><a class="btn btn-dark btn-radius btn-brd" href="#"
							data-toggle="tooltip" data-placement="top" title=""
							data-filter=".cat3">Heritage Walks</a></li>
						<li><a class="btn btn-dark btn-radius btn-brd" href="#"
							data-toggle="tooltip" data-placement="top" title=""
							data-filter=".cat4">Others</a></li>
					</ul>
				</nav>
			</div>
		</div>

		<hr class="invis">
		
		
		 <div id="da-thumbs" class="da-thumbs portfolio">
    <c:forEach var="event" items="${eventsList}">
        <div class="post-media pitem item-w1 item-h1 cat1">
				<a href="OrgEventDetailsServlet?eventId=${event.eventId}" >
                <img src="${event.eventBanner}" alt="" class="img-responsive">
                <div>
                    <h3>${event.eventName} <small>${event.eventCity}</small></h3>
                    <i class="flaticon-unlink"></i>
                </div>
            </a>
        </div>
    </c:forEach>
</div>
    </div><!-- end section -->
	
	







	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="widget clearfix">
						<div class="widget-title">
							<img src="images/logos/logo.png" alt="" / class="logo">
						</div>
						<p>Explore, Experience, Enjoy: Your one-stop destination for
							seamless event ticketing. Stay connected for updates, offers, and
							exclusive deals. Start planning your next adventure with us
							today!</p>
						<p>Sed fermentum est vitae rhoncus molestie. Cum sociis
							natoque penatibus et magnis dis montes.</p>
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->

				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="widget clearfix">
						<div class="widget-title">
							<h3>Pages</h3>
						</div>

						<ul class="footer-links hov">
							<li><a href="OrganizerEvents.jsp">Home <span
									class="icon icon-arrow-right2"></span></a></li>
							<li><a href="Organizer-AboutUs.jsp">About <span
									class="icon icon-arrow-right2"></span></a></li>
							<li><a href="OrganizerContact.jsp">Contact <span
									class="icon icon-arrow-right2"></span></a></li>
							<li><a href="OrganizerHome.jsp">Profile <span
									class="icon icon-arrow-right2"></span></a></li>
						</ul>
						<!-- end links -->
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->

				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="footer-distributed widget clearfix">
						<div class="widget-title">
							<h3>Subscribe</h3>
							<p>Stay in the Loop! Subscribe for Exclusive Offers, Event
								Updates, and Early Access to Tickets. Join Now for a Front Row
								Seat to Your Favorite Experiences!</p>
						</div>

						<div class="footer-right">
							<form method="get" action="#">
								<input placeholder="Subscribe our newsletter.." name="search">
								<i class="fa fa-envelope-o"></i>
							</form>
						</div>
					</div>
					<!-- end clearfix -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</footer>
	<!-- end footer -->

	<div class="copyrights">
		<div class="container">
			<div class="footer-distributed">
				<div class="footer-left">
					<p class="footer-company-name">
						All Rights Reserved. &copy; 2024 <a href="#">Eventos</a>
				</div>


			</div>
		</div>
		<!-- end container -->
	</div>
	<!-- end copyrights -->

	<a href="#" id="scroll-to-top" class="dmtop global-radius"><i
		class="fa fa-angle-up"></i></a>

	<!-- ALL JS FILES -->
	<script src="js/all.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/custom.js"></script>
	<script src="js/portfolio.js"></script>
	<script src="js/hoverdir.js"></script>

</body>
</html>