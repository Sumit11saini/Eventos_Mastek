<!DOCTYPE html>
<html lang="en">

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
    <title>Eventos</title>  
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
    <link rel="stylesheet" href="login.css">
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
                    <a class="navbar-brand nigga" href="index.jsp"><h1 class="logotxt"><h1>Eventos</h1></h1></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="GetAllEventsServlet">Events</a></li>
                        <li><a href="about-us.jsp">About us</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li><a class="active" href="CustomerLogin.jsp">Login</a></li>     
                    </ul>
                </div>
            </div>
        </nav>
    </header>


    
    
   
    <div class="login1"><img src="uploads/login1.webp" alt="" class="loginimg">
        <div class="wrapper">
            <h2>Sign in</h2>
            <form action="CustomerLogin" method="post">
              <!-- <div class="input-box">
                <input type="text" placeholder="Enter your name" required>
              </div> -->
              <div class="input-box">
                <input type="text" id="Email" name="Email" placeholder="Email" required>
              </div>
               <div class="input-box">
                <input type="password" id="Password" name="Password" placeholder="Password" required>
              </div>
              <!-- <div class="input-box">
                <input type="password" placeholder="Confirm password" required>
              </div>  -->
              <!-- <div class="policy">
                <input type="checkbox">
                <h3> <br>I accept all terms & condition</h3>
              </div> -->
              <div class="input-box button">
                <input type="Submit" value="Login">
              </div>
              <div class="text">
                <h3>Do not have an account? <a href="CustomerRegister.html">Register now</a></h3>
              </div>
            </form>
          </div> 
    </div> <br><br><br>

    <div id="about" class="section wb">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="message-box">
                        <h4>Want to list your event?</h4>
                        <h2>Organization Login</h2>
                        <p class="lead">As an organization, unlock the full potential of our platform by registering and logging in to seamlessly list your events and manage ticket sales. Whether you're hosting conferences, workshops, or social gatherings, our user-friendly interface empowers you to showcase your events with ease.
                        </p>

                        <a href="organizerLogin.jsp"><button class="button-40" role="button">Login</button></a>
                    </div><!-- end messagebox -->
                </div><!-- end col -->

                
            </div><!-- end row -->

            
            </div><!-- end row -->
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
                            <li><a href="index.jsp">Home <span class="icon icon-arrow-right2"></span></a></li>
							<li><a href="about-us.jsp">About <span class="icon icon-arrow-right2"></span></a></li>
							<li><a href="GetAllEventsServlet">Events <span class="icon icon-arrow-right2"></span></a></li>
							<li><a href="contact.jsp">Contact <span class="icon icon-arrow-right2"></span></a></li>
							<li><a href="CustomerLogin.jsp">Login <span class="icon icon-arrow-right2"></span></a></li>
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
            <!-- <div class="organreg">
              <a href="login2.html"><h4>Login as an Organization</h4></a>
            </div> -->
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

</body>
</html>