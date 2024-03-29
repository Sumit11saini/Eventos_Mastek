<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta tags and other head content -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Eventos - My Tickets</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="myTickets.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Modernizer for Portfolio -->
    <script src="js/modernizer.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/qrcodejs2@1.0.0/qrcode.min.js"></script>

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
    </div><!-- end loader -->
    <!-- END LOADER -->
    
    <header class="header header_style_01">
        <nav class="megamenu navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand nigga" href="index.html"><h1 class="logotxt"><h1>Eventos</h1></h1></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about-us.html">About us</a></li>
                        <li><a href="events.html">Events</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li><a href="userLogin.html">Login</a></li>     
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    
    <div id="services" class="parallax section lb">
        <div class="container">
            <div class="section-title text-center">
                <h3>My Tickets</h3>
            </div><!-- end title -->
            <!-- Tickets Container -->
            <div class="row" id="eventsContainer">
                <!-- Ticket cards will be dynamically generated here -->
            </div> <br><br><br><br>
            
            <!-- End Tickets Container -->
        </div><!-- end container -->
    </div><!-- end section -->

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <img src="images/logos/logo.png" alt="" / class="logo">
                        </div>
                        <p>Explore, Experience, Enjoy: Your one-stop destination for seamless event ticketing. Stay connected for updates, offers, and exclusive deals. Start planning your next adventure with us today!</p>
                        <p>Sed fermentum est vitae rhoncus molestie. Cum sociis natoque penatibus et magnis dis montes.</p>
                    </div><!-- end clearfix -->
                </div><!-- end col -->

				<div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>Pages</h3>
                        </div>

                        <ul class="footer-links hov">
                            <li><a href="/index.html">Home <span class="icon icon-arrow-right2"></span></a></li>
							<li><a href="about-us.html">About <span class="icon icon-arrow-right2"></span></a></li>
							<li><a href="events.html">Events <span class="icon icon-arrow-right2"></span></a></li>
							<li><a href="contact.html">Contact <span class="icon icon-arrow-right2"></span></a></li>
							<li><a href="login.html">Login <span class="icon icon-arrow-right2"></span></a></li>
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
				
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="footer-distributed widget clearfix">
                        <div class="widget-title">
                            <h3>Subscribe</h3>
							<p>Stay in the Loop! Subscribe for Exclusive Offers, Event Updates, and Early Access to Tickets. Join Now for a Front Row Seat to Your Favorite Experiences!</p>
                        </div>
						
						<div class="footer-right">
							<form method="get" action="#">
								<input placeholder="Subscribe our newsletter.." name="search">
								<i class="fa fa-envelope-o"></i>
							</form>
						</div>                        
                    </div><!-- end clearfix -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
    </footer><!-- end footer -->

    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-left">                   
                    <p class="footer-company-name">All Rights Reserved. &copy; 2024 <a href="#">Eventos</a>
                </div>

                
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    <script src="js/portfolio.js"></script>
    <script src="js/hoverdir.js"></script>  
    <script>


        // Define an array to store created tickets
        let tickets = [];

        // Function to add a new ticket
        function addTicket(ticketId, eventName, city, date, seatCategory, numberOfSeats) {
            // Create a new ticket object
            let newTicket = {
                ticketId: ticketId,
                eventName: eventName,
                city: city,
                date: date,
                seatCategory: seatCategory,
                numberOfSeats: numberOfSeats
            };

            // Add the new ticket to the tickets array
            tickets.push(newTicket);

            // Update the tickets container
            updateTicketsContainer();
        }

        function updateTicketsContainer() {
            let ticketsContainer = document.getElementById("eventsContainer");
            // Clear the existing content
            ticketsContainer.innerHTML = "";

            // Loop through the tickets array and create ticket cards
            tickets.forEach((ticket) => {
                let ticketCard = document.createElement("div");
                ticketCard.classList.add("col-md-4");
                ticketCard.classList.add("mb-4");

                let cardInner = document.createElement("div");
                cardInner.classList.add("card");
                cardInner.classList.add("h-100");

                let cardBody = document.createElement("div");
                cardBody.classList.add("card-body");

                let ticketId = document.createElement("p");
                ticketId.classList.add("card-text");
                ticketId.textContent = "Ticket ID: " + ticket.ticketId;

                let eventName = document.createElement("h5");
                eventName.classList.add("card-title");
                eventName.textContent = ticket.eventName;

                let eventDate = document.createElement("p");
                eventDate.classList.add("card-text");
                eventDate.textContent = "Date: " + ticket.date;

                let eventCity = document.createElement("p");
                eventCity.classList.add("card-text");
                eventCity.textContent = "City: " + ticket.city;

                let seatCategory = document.createElement("p");
                seatCategory.classList.add("card-text");
                seatCategory.textContent = "Seat Category: " + ticket.seatCategory;

                let numberOfSeats = document.createElement("p");
                numberOfSeats.classList.add("card-text");
                numberOfSeats.textContent = "Number of Seats: " + ticket.numberOfSeats;

                // Append elements to the ticket card body
                cardBody.appendChild(ticketId);
                cardBody.appendChild(eventName);
                cardBody.appendChild(eventDate);
                cardBody.appendChild(eventCity);
                cardBody.appendChild(seatCategory);
                cardBody.appendChild(numberOfSeats);

                // Append card body to the card inner
                cardInner.appendChild(cardBody);

                // Append card inner to the ticket card
                ticketCard.appendChild(cardInner);

                // Append ticket card to the tickets container
                ticketsContainer.appendChild(ticketCard);
            });
        }

        // Function to retrieve tickets from backend or local storage and populate the tickets array
        function retrieveTickets() {
            // Simulate retrieval of tickets (you can implement your logic here)
            // Example:
            addTicket("1", "Event Name 1", "City 1", "2024-03-21", "Gold", 2);
            addTicket("2", "Event Name 2", "City 2", "2024-03-22", "Silver", 1);
            addTicket("3", "Event Name 3", "City 3", "2024-03-23", "Platinum", 3);
        }

        // Call the function to retrieve tickets and populate the UI
        retrieveTickets();
    </script>
</body>



</html>
