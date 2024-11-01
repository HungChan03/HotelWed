<%-- 
    Document   : team
    Created on : Oct 18, 2024, 12:53:20 AM
    Author     : Macbook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Wonderland</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet-->
        <link type="text/css" rel="stylesheet" href="lib/animate/animate.min.css">
        <link type="text/css" rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css">
        <link type="text/css" rel="stylesheet" href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link type="text/css" rel="stylesheet" href="css/bootstap.min.css">

        <!-- Template Stylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css">
                <link type="text/css" rel="stylesheet" href="css/mystyle.css">

    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Header Start -->
            <div class="container-fluid bg-dark px-0">
                <div class="row gx-0">
                    <div class="col-lg-2 bg-dark d-none d-lg-block logo">
                        <a href="index.jsp" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
                            <img class="img-fluid" src="img/logo_hotel.png" alt="">
                        </a>
                    </div>
                    <div class="col-lg-10">
                        <div class="row gx-0 bg-white d-none d-lg-flex">
                            <div class="col-lg-7 px-5 text-start">
                                <div class="h-100 d-inline-flex align-items-center py-2 me-4">
                                    <i class="fa fa-envelope text-primary me-2"></i>
                                    <p class="mb-0">hungnhcce180150@fpt.edu.vn</p>
                                </div>
                                <div class="h-100 d-inline-flex align-items-center py-2">
                                    <i class="fa fa-phone-alt text-primary me-2"></i>
                                    <p class="mb-0">+8496 405 7841</p>
                                </div>
                            </div>
                            <div class="col-lg-5 px-5 text-end">
                                <div class="d-inline-flex align-items-center py-2">
                                     <a class="me-3" href="https://www.facebook.com/hotel.wonderland.2024/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                                    <a class="me-3" href="https://x.com/NSawayu"><i class="fab fa-twitter" target="_blank"></i></a>
                                    <a class="me-3"  target="_blank" href="https://www.linkedin.com/in/hotel-wonderland-832463336/"><i class="fab fa-linkedin-in"></i></a>
                                    <a class="me-3" href="https://www.instagram.com/hote.lwonderland/" target="_blank"><i class="fab fa-instagram"></i></a>
                                    <a class="" href="https://www.youtube.com/@HotelWonderLand-k4p" target="_blank"><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                        <nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3 p-lg-0">
                            <a href="index.jsp" class="navbar-brand d-block d-lg-none">
                                <h1 class="m-0 text-primary text-uppercase">Wonderland</h1>
                            </a>
                            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav mr-auto py-0">
                                    <a href="CombineServlet?page=index" class="nav-item nav-link">Home</a>
                                    <a href="about.jsp" class="nav-item nav-link">About</a>
                                    <a href="ServiceServlet?page=service" class="nav-item nav-link">Services</a>
                                    <a href="RoomServlet?page=room" class="nav-item nav-link">Rooms</a>
                                    <div class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle  active" data-bs-toggle="dropdown">Pages</a>
                                        <div class="dropdown-menu rounded-0 m-0">
                                            <a href="booking.jsp" class="dropdown-item">Booking</a>
                                            <a href="team.jsp" class="dropdown-item active">Our Team</a>
                                            <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                                        </div>
                                    </div>
                                </div>
<!--                                <div class="navbar-nav mr-auto py-0">                                 
                                    <a href="login.jsp" class="nav-item nav-link">Login</a>

                                </div>-->
<%
                                    String username = null;
                                    Cookie[] cookies = request.getCookies(); 

                                    if (cookies != null) {
                                        for (Cookie cookie : cookies) {
                                            if ("user".equals(cookie.getName())) {
                                                username = cookie.getValue();
                                                break;
                                            }
                                        }
                                    }
                                %>
                                <div class="navbar-nav mr-auto py-0">                                 
                                    <%
                                        if (username != null) {
                                    %>
                                    <a href="personal.jsp" class="nav-item nav-link">Update Your Info</a>
                                    <span class="nav-item nav-link text-white">Welcome, <%= username%></span>
                                    <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                                    <%
                                    } else {
                                    %>
                                    <a href="login.jsp" class="nav-item nav-link">Login</a>
                                    <%
                                        }
                                    %>

                                </div>


                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Header End -->

            <!-- Page Header Start -->
            <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-1.jpg);">
                <div class="container-fluid page-header-inner py-5">
                    <div class="container text-center pb-5">
                        <h1 class="display-3 text-white mb-3 animated slideInDown">Our Team</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center text-uppercase">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                                <li class="breadcrumb-item text-white active" aria-current="page">Our Team</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Page Header End -->


<!--             Booking Start 
            <div class="container-fluid booking pb-5 wow fadeIn" data-wow-delay="0.1s">
                <div class="container">
                    <div class="bg-white shadow" style="padding: 35px;">
                        <div class="row g-2">
                            <div class="col-md-10">
                                <div class="row g-2">
                                    <div class="col-md-3">
                                        <div class="date" id="date1" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input"
                                                   placeholder="Check in" data-target="#date1" data-toggle="datetimepicker" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="date" id="date2" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input" placeholder="Check out" data-target="#date2" data-toggle="datetimepicker"/>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <select class="form-select">
                                            <option selected>Adult</option>
                                            <option value="1">Adult 1</option>
                                            <option value="2">Adult 2</option>
                                            <option value="3">Adult 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <select class="form-select">
                                            <option selected>Child</option>
                                            <option value="1">Child 1</option>
                                            <option value="2">Child 2</option>
                                            <option value="3">Child 3</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-primary w-100">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             Booking End -->


            <!-- Team Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title text-center text-primary text-uppercase">Our Team</h6>
                        <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Staffs</span></h1>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="rounded shadow overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="img/about_us/aboutHuy.jpg" alt="">
                                    <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100037327361860&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>
                                       
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/yuh_hhoang/profilecard/?igsh=dHlqNWhicDVzc25j"><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">Hoàng Huy</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="rounded shadow overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="img/about_us/aboutTu.png" alt="">
                                    <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100047967561612"><i class="fab fa-facebook-f"></i></a>
                                       
                                        <a  target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/fsuan.0401/"><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">Thanh Tú</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="rounded shadow overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="img/about_us/aboutLinh.png" alt="">
                                    <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100081948576421&mibextid=LQQJ4d"><i class="fab fa-facebook-f"></i></a>
                                       
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/linhor33/profilecard/?igsh=dWtkZ2d0bGF3NHNm"><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">Mỹ Linh</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="rounded shadow overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="img/about_us/aboutPhuc.jpg" alt="">
                                    <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100038927191598&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>
                                      
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/phuctruongcm2004?igsh=cG4wOTltYjVsZDhm"><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">Hoàng Phúc</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                            <div class="rounded shadow overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="img/about_us/aboutHung.jpg" alt="">
                                    <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100033289996509"><i class="fab fa-facebook-f"></i></a>
                                    
                                        <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/hunggomu15/"><i class="fab fa-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">Chấn Hưng</h5>
                                    <small>Designation</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Team End -->
            
            <div class="container-fluid bg-dark text-light footer wow fadeIn" data-wow-delay="0.1s">
                <div class="container pb-5">
                    <div class="row g-5 footer-content ">
                        <div class="col-md-6 col-lg-3">
                            <h6 class="section-title text-start text-primary text-uppercase mb-4">Contact</h6>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>No. 123 Tran Phu Street, Ward 3, Da Lat, Lam Dong, Vietnam</p>
                            <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+8496 405 7841</p>
                            <p class="mb-2"><i class="fa fa-envelope me-3"></i>hungnhcce180150@fpt.edu.vn</p>
                            <div class="d-flex pt-2">
                                <a target="_blank" class="btn btn-outline-light btn-social" href="https://x.com/NSawayu"><i class="fab fa-twitter"></i></a>
                                <a target="_blank" class="btn btn-outline-light btn-social" href="https://www.facebook.com/hotel.wonderland.2024/"><i class="fab fa-facebook-f"></i></a>
                                <a target="_blank" class="btn btn-outline-light btn-social" href="https://www.youtube.com/@HotelWonderLand-k4p"><i class="fab fa-youtube"></i></a>
                                <a target="_blank" class="btn btn-outline-light btn-social" href="https://www.linkedin.com/in/hotel-wonderland-832463336/"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-12">
                            <div class="row gy-5 g-4">
                                <div class="col-md-6">
                                    <h6 class="section-title text-start text-primary text-uppercase mb-4">Company</h6>
                                    <a class="btn btn-link" href="about.jsp">About Us</a>
                                    <a class="btn btn-link" href="PrivacyPolicy.jsp">Privacy Policy</a>
                                    <a class="btn btn-link" href="TermsConditions.jsp">Terms & Condition</a>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="section-title text-start text-primary text-uppercase mb-4">Services</h6>
                                    <a class="btn btn-link" href="service.jsp">Food & Restaurant</a>
                                    <a class="btn btn-link" href="service.jsp">Spa & Fitness</a>
                                    <a class="btn btn-link" href="service.jsp">Sports & Gaming</a>
                                    <a class="btn btn-link" href="service.jsp">Event & Party</a>
                                    <a class="btn btn-link" href="service.jsp">GYM & Yoga</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="copyright">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                &copy; <a class="border-bottom" href="#">2024 Wonderland</a>, All Right Reserved. 

                                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                Designed By <a class="border-bottom">Group 3</a>
                                <br>Distributed By: <a class="border-bottom"target="_blank">Group 3</a>
                            </div>
                            <div class="col-md-6 text-center text-md-end">
                                <div class="footer-menu">
                                    <a href="index.jsp">Home</a>
                                    <a href="">Cookies</a>
                                    <a href="">Help</a>
                                    <a href="">FQAs</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->       
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="lib/wow/wow.min.js" type="text/javascript"></script>
        <script src="lib/easing/easing.min.js" type="text/javascript"></script>
        <script src="lib/waypoints/waypoints.min.js" type="text/javascript"></script>
        <script src="lib/counterup/counterup.min.js" type="text/javascript"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js" type="text/javascript"></script>
        <script src="lib/tempusdominus/js/moment.min.js" type="text/javascript"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js" type="text/javascript"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js" type="text/javascript"></script>


        <!-- Template Javascript -->
        <script src="js/main.js" type="text/javascript"></script>
    </body>

</html>