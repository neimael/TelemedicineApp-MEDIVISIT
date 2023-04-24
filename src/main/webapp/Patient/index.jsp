<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@page import="Models.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.HelperClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MEDIVISIT</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="<%= request.getContextPath() %>/assets/img/flavicon.png" rel="icon">


    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<%= request.getContextPath() %>/assets/Patient/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/assets/Patient/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<%= request.getContextPath() %>/assets/Patient/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<%= request.getContextPath() %>/assets/Patient/css/style.css" rel="stylesheet">
    
    
    <script src="https://kit.fontawesome.com/badbb472a2.js" crossorigin="anonymous"></script>
    
    
</head>

<body>
	<input type="hidden" id="status" value="<%=request.getParameter("status") %>" />
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
        <!--  get navbar --><nav class="navbar bg-light navbar-light">
                <a href="index.jsp" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary">MEDIVISIT</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
						 <img class="rounded-circle"
							src="<%=request.getContextPath()%>\<%=session.getAttribute("Image")%>"
							alt="" style="width: 40px; height: 40px;">
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
						</div>
					</div>
					<div class="ms-3">
						<h6 class="mb-0"><%=session.getAttribute("fullname")%></h6>
						<span>PATIENT</span>
					</div>
                </div>
                
                <div class="navbar-nav w-100">
					<a href="<%=request.getContextPath()%>/Patient/index.jsp"
						class="nav-item nav-link active"><i
						class="fa fa-tachometer-alt me-2"></i>Home</a> <a
						href="<%=request.getContextPath()%>/Patient/appointment.jsp"
						class="nav-item nav-link "><i class="fa fa-medkit  me-2"></i>Appointments</a>
					  <a
						href="<%=request.getContextPath()%>/Patient/profil.jsp"
						class="nav-item nav-link "><i class="fa fa-user-md me-2"
						aria-hidden="true"></i>Profil</a>


				</div>
            </nav>
        </div>
        <!-- Sidebar End -->

        
        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.jsp" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><img src="../assets/Doctor/img/flavicon.png" alt="" style="height: 30px;"></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                
                <div class="navbar-nav align-items-center ms-auto">
                    
                   <div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2"
							src="<%=request.getContextPath()%>\<%=session.getAttribute("Image")%>"
							alt="" style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex"><%=session.getAttribute("fullname")%></span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
							<a href="<%=request.getContextPath()%>/Patient/profil.jsp"
								class="dropdown-item">My Profile</a> <a
								href="<%=request.getContextPath()%>/logout"
								class="dropdown-item">Log Out</a>
						</div>
					</div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- Income & appointment & patients Start -->
            
            <!-- Appointments Chart Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row">
                
                <% 
        			HelperClass help = new HelperClass();
            		ArrayList<Doctor> list ;
            	
        			list = help.getDoctors();
        		
        			for(int i=0;i<list.size();i++){
        				
                %>
                
                
                    <div class="col-sm-12 col-xl-4  d-flex flex-wrap">
                        <div id="card1" class="card mx-auto rounded" data-aos="fade-up" data-aos-duration="2000" style="width:400px;">
				            <img src="<%=request.getContextPath()%>\<%=list.get(i).getImagePath()%>" class="card-img-top rounded-circle" style="width:100%;  padding-left: 100px; padding-right: 100px; margin-top: 20px">
							<div class="text-center" style="margin-top: 20px;"><%=list.get(i).getFirstName()%> <%=list.get(i).getLastName()%></div>
				            <div class="card-body">
				                <h5 class="card-title text-center"><%=list.get(i).getSpecialty()%></h5>
				                <p class="card-text" style="text-align: center;"><%=list.get(i).getAddress()%></p>
				                <a href="<%=request.getContextPath()%>\Patient\booking.jsp?itemId=<%=list.get(i).getId()%>" class="btn btn-primary w-100">Take an appointment</a>
				            </div>
			        	</div>
                    </div>
                    <%}list.clear();  %>
                    
                    
                    

                </div>
                
                
            </div>
            <!-- Appointments Chart End -->


           

            <!-- Widgets End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">MEDIVISIT</a>, All Right Reserved. 
                        </div>
                        <!-- <div class="col-12 col-sm-6 text-center text-sm-end">
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        </br>
                        Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div> -->
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script type="text/javascript">
    var status = document.getElementById("status").value;
	if(status=="success"){
		swal("Congrats","your appointment has booked successfully","success");
	}else if(status=="failed"){
		swal("Failed","Please try again later !","error");
	}
    </script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/Doctor/lib/chart/chart.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/Doctor/lib/easing/easing.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/Doctor/lib/waypoints/waypoints.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/Doctor/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/Doctor/lib/tempusdominus/js/moment.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/Doctor/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/Doctor/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="<%= request.getContextPath() %>/assets/Doctor/js/main.js"></script>
</body>

</html>