<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReaVaya_Bus_System.Index" %>

<!DOCTYPE html>
<html>

<head runat="server">
    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Site Metas -->
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Rea Vaya</title>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

    <!-- fonts style -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">

    <!-- font awesome style -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- nice select -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
        integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />

</head>

<body>
    <form id="form1" runat="server">
        <div class="hero_area">
            <!-- header section strats -->
            <header class="header_section">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="Index.aspx">
                            <span>
                                Rea Vaya
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="Login.aspx">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <span>
                                            Login
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Registration.aspx">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <span>
                                            Sign Up
                                        </span>
                                    </a>
                                </li>
                                <form class="form-inline">
                                    <button class="btn nav_search-btn" type="submit">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </form>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
            <!-- slider section -->
            <section class="slider_section ">
                <div class="container ">
                    <div class="row">
                        <div class="col-lg-7 col-md-8 mx-auto">
                            <div class="detail-box">
                                <h1>
                                    Welcome to Rea Vaya <br>
                                    Your Reliable Public Transportation System
                                </h1>
                                <p>
                                    Enjoy hassle-free travel with our efficient bus services. Plan your journey, track
                                    buses in real-time, and experience comfort and convenience with Rea Vaya.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end slider section -->
        </div>
        <!-- about section -->

        <section class="about_section layout_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="detail-box">
                            <div class="heading_container">
                                <h2>
                                    About Us
                                </h2>
                            </div>
                            <p>
                                Rea Vaya is a bus rapid transit (BRT) system in Johannesburg, South Africa.
                                It was launched in 2009 to provide efficient and reliable public transport,
                                reduce traffic congestion, and contribute to environmental sustainability.
                                With dedicated lanes, modern buses, and user-friendly stations, Rea Vaya
                                offers a comfortable and convenient travel experience for residents and
                                visitors alike.
                            </p>
                            <div>
                                <a href="">
                                    Read More
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="img-box">
                            <img src="images/about-img.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- end about section -->

        <!-- admission section -->

        <section class="admission_section">
            <div class="container">
                <div class="heading_container">
                    <h2>
                        Customer Testimonials
                    </h2>
                </div>
                <p>
                    "Rea Vaya has transformed my daily commute. It's fast, reliable, and so convenient. I
                    love how I can easily plan my journey and track the bus arrival times. Highly recommend!"
                    - Sarah M.
                </p>
                <div class="row">
                    <div class="col-md-6">
                        <div class="admission_detail-box">
                            <h3>
                                How to Plan Your Journey with Rea Vaya
                            </h3>
                            <p>
                                Planning your journey with Rea Vaya is simple and hassle-free. Follow these easy steps
                                to ensure a smooth travel experience:
                            </p>
                            <ol>
                                <li>Visit our website or download the Rea Vaya mobile app.</li>
                                <li>Enter your starting point and destination to view available routes.</li>
                                <li>Check the bus schedules and choose the most convenient time for your trip.</li>
                                <li>Purchase your ticket online or at a Rea Vaya station.</li>
                                <li>Arrive at the designated bus stop a few minutes before the scheduled departure
                                    time.</li>
                                <li>Board the bus, find a comfortable seat, and enjoy your ride.</li>
                            </ol>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="admission_img-container">
                            <img src="images/admission.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- end admission section -->

        <!-- contact section -->

        <section class="contact_section layout_padding">
            <div class="container">
                <h2 class="font-weight-bold">
                    Contact Us
                </h2>
                <p class="text-center">
                    Have questions or need assistance? Reach out to our customer support team.
                </p>
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="contact_form-container">
                            <form action="">
                                <div class="form-group">
                                    <label for="inputName">Name</label>
                                    <input type="text" class="form-control" id="inputName" placeholder="Enter your name">
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail">Email</label>
                                    <input type="email" class="form-control" id="inputEmail"
                                        placeholder="Enter your email">
                                </div>
                                <div class="form-group">
                                    <label for="inputMessage">Message</label>
                                    <textarea class="form-control" id="inputMessage" rows="4"
                                        placeholder="Enter your message"></textarea>
                                </div>
                                <div class="btn-box">
                                    <button type="submit" class="btn ">Send</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- end contact section -->

        <!-- info section -->
        <section class="info_section layout_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 info_logo">
                        <div>
                            <a href="Index.aspx">
                                <span>
                                    Rea Vaya
                                </span>
                            </a>
                        </div>
                        <p>
                            Efficient and reliable public transport system in Johannesburg.
                        </p>
                    </div>
                    <div class="col-md-4">
                        <div class="info_links">
                            <h5>
                                Useful Links
                            </h5>
                            <ul>
                                <li>
                                    <a href="Index.aspx">Home</a>
                                </li>
                                <li>
                                    <a href="GetBusSchedule.aspx">Get Bus Schedule</a>
                                </li>
                                <li>
                                    <a href="CalculatePrice.aspx">Calculate Price</a>
                                </li>
                                <li>
                                    <a href="Login.aspx">Login</a>
                                </li>
                                <li>
                                    <a href="Registration.aspx">Sign Up</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="info_contact">
                            <h5>
                                Contact Information
                            </h5>
                            <div>
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <span>
                                    1234 Street Name, Johannesburg, South Africa
                                </span>
                            </div>
                            <div>
                                <i class="fa fa-phone" aria-hidden="true"></i>
                                <span>
                                    +27 123 456 789
                                </span>
                            </div>
                            <div>
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                                <span>
                                    info@reavaya.co.za
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end info section -->

        <!-- footer section -->
        <footer class="footer_section">
            <div class="container">
                <p>
                    &copy; <span id="displayYear"></span> All Rights Reserved By Rea Vaya
                </p>
            </div>
        </footer>
        <!-- footer section -->

    </form>
    <!-- jQery -->
    <script src="js/jquery-3.4.1.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>

</body>

</html>

