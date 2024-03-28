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
<link rel="stylesheet" href="organizerhome.css">
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


	<header class="header header_style_01">
		<nav class="megamenu navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand nigga" href="OrganizerEventsServlet"><h1
							class="logotxt">
							<h1>Eventos</h1>
						</h1></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a  href="OrganizerEventsServlet">Home</a></li>
                        <li><a  href="Organizer-AboutUs.jsp">About us</a></li>
                        <li><a href="OrganizerContact.jsp">Contact</a></li>
						<li><a class="active" href="OrganizerHome.jsp">Profile</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>


	<div id="services" class="parallax section lb">
		<div class="container">
			<div class="section-title text-center">
				<h3>
					Welcome,
					<%=session.getAttribute("organizerName")%></h3>
				<p class="lead">Lorem ipsum dolor sit, amet consectetur
					adipisicing elit. Blanditiis deleniti esse ab eos culpa hic. Est
					tempora doloremque neque repellendus temporibus reprehenderit
					itaque iusto sapiente optio, nobis minus explicabo repellat.</p>
				<br>
				<button id="openFormBtn">Create Event</button>

				<br>
				<br>
				<br>

				<h4 id="Ah4">Account Settings</h4>
				<button id="openEditProfileFormBtn">Edit Profile</button>
				<button id="logoutBtn">Logout</button>
				<!-- New logout button -->
			</div>
			<!-- end title -->
		</div>
		<!-- end container -->
	</div>
	<!-- end services -->


	<script>
		// Redirect to editEvent.jsp when the button is clicked
		document.getElementById("openFormBtn").addEventListener("click",
				function() {
					window.location.href = "editEvent.jsp";
				});
	</script>


	<script>
		function storeValues() {
			var event_name = document.getElementById("eventName").value;
			var event_city = document.getElementById("city").value;
			var event_date = document.getElementById("date").value;
			// Storing values using localStorage
			localStorage.setItem("event_name", event_name);
			localStorage.setItem("event_city", event_city);
			localStorage.setItem("event_date", event_date);
			// Alternatively, you can use sessionStorage
			// sessionStorage.setItem("value1", value1);
			// sessionStorage.setItem("value2", value2);

			// Redirect to the next page
			//  window.location.href = "page2.html";
		}
	</script>

	<!-- Popup form for editing organization profile -->
	<div id="editProfileForm" class="form-popup">
		<form class="form-container">
			<h2>Edit Profile</h2>
			<label for="organizationName"><b>Organization Name</b></label> <input
				type="text" placeholder="Enter Organization Name"
				name="organizationName" required> <label for="email"><b>Email</b></label>
			<input type="email" placeholder="Enter Email" name="email" required>

			<label for="mobileNumber"><b>Mobile Number</b></label> <input
				type="tel" placeholder="Enter Mobile Number" name="mobileNumber"
				required>

			<button type="submit" class="btn">Save Changes</button>
			<button type="button" class="btn cancel"
				onclick="closeEditProfileForm()">Close</button>
		</form>
	</div>

	<div id="eventsContainer" class="events-container">
		<!-- Event cards will be dynamically added here -->
	</div>




	</div>
	<!-- end container -->
	</div>
	<!-- end section -->

	<script>
		// Function to navigate to the edit page
		function editEvent(index) {
			// Here you can implement the navigation logic
			// For now, let's just navigate to a different page
			window.location.href = "editEvent.jsp"; // Change "edit_event.html" to the desired page URL
		}

		// // Function to delete an event
		// function deleteEvent(index) {
		//     events.splice(index, 1); // Remove the event from the array
		//     updateEventsContainer(); // Update the events container
		// }

		// Open the popup form
		document
				.getElementById("openFormBtn")
				.addEventListener(
						"click",
						function() {
							document.getElementById("popupForm").style.display = "block";
						});

		// Close the popup form
		function closeForm() {
			document.getElementById("popupForm").style.display = "none";
		}

		// Handle form submission
		document.querySelector(".form-container").addEventListener("submit",
				function(event) {
					event.preventDefault(); // Prevent form submission
					window.location.href = "editEvent.jsp";

					// Close the form
					closeForm();
				});

		// Open the popup form for editing profile
		document
				.getElementById("openEditProfileFormBtn")
				.addEventListener(
						"click",
						function() {
							document.getElementById("editProfileForm").style.display = "block";
						});

		// Close the popup form for editing profile
		function closeEditProfileForm() {
			document.getElementById("editProfileForm").style.display = "none";
		}

		// Handle form submission for editing profile
		document
				.querySelector("#editProfileForm .form-container")
				.addEventListener(
						"submit",
						function(event) {
							event.preventDefault(); // Prevent form submission

							// Get form values
							let organizationName = this.elements["organizationName"].value;
							let email = this.elements["email"].value;
							let mobileNumber = this.elements["mobileNumber"].value;

							// Update organization profile (you can implement your logic here)

							// Close the form
							closeEditProfileForm();
						});
	</script>


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