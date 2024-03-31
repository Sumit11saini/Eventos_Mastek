<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>
<%@ page import="eventos.models.TicketType" %>
<%@ page import="eventos.models.Booking" %>
<%@ page import="eventos.services.impl.EventReportDAOImpl" %>




<!DOCTYPE html>
<html lang="en">
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Site Metas -->
<title>Eventos</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicon -->
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"href="OrganizerParticularEvent.css">
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
<style>
</style>
</head>
<body>

		<%@ include file="navbar.jsp"%>

	<div id="about" class="section wb">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="message-box">
						<h2 class="red">${event.eventName}</h2>
						<h4>${event.eventCity},${event.eventVenue}</h4>
						<h4>Date And Time:${event.eventDateTime}</h4>
						<p class="lead">${event.eventDescription}</p>
						
						<br>

					</div>
					<!-- end messagebox -->
				</div>
				<!-- end col -->
				<div class="col-md-6">
					<div class="post-media wow fadeIn">
						<img src="${event.eventBanner}" alt=""
							class="img-responsive img-rounded">
					</div>
					<!-- end media -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end section -->
	
<div id="ticket-types" class="row  justify-content-center">
    <c:forEach items="${ticketTypes}" var="ticketType">
        <div class="col-md-3">
            <div class="pricing-table">
                <div class="pricing-title">
                    <h3>${ticketType.ticketType}</h3> <!-- Displaying ticket type -->
                </div>
                <div class="pricing-info">
                    <div class="price">₹${ticketType.ticketPrice}</div> <!-- Displaying ticket price -->
                    <div class="total-tickets">Total Tickets Left: ${ticketType.ticketQuantity}</div> <!-- Displaying total tickets left -->
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


	
<section id="summary" class="section wb">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="summary-box total-attendees">
                    <h3>Total Attendees</h3>
                    <p id="totalAttendees">${SalesReports[0]}</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="summary-box available-tickets">
                    <h3>Available Tickets</h3>
                    <p id="availableTickets">${SalesReports[1]}</p>
                </div>	
            </div>
            <div class="col-md-4">
                <div class="summary-box total-revenue">
                    <h3>Total Revenue</h3>
                    <p id="totalRevenue">₹${SalesReports[2]}</p>
                </div>
            </div>
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->

	
	
	
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
							<li><a href="/index.html">Home <span
									class="icon icon-arrow-right2"></span></a></li>
							<li><a href="about-us.html">About <span
									class="icon icon-arrow-right2"></span></a></li>
							<li><a href="events.html">Events <span
									class="icon icon-arrow-right2"></span></a></li>
							<li><a href="contact.html">Contact <span
									class="icon icon-arrow-right2"></span></a></li>
							<li><a href="login.html">Login <span
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


</body>
</html>

