<%@page import="Models.HelperClass"%>
<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@page import="Models.Doctor"%>
<%@page import="Controllers.UpdatePatient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% Doctor d;
	String itemId =request.getParameter("itemId");
	HelperClass h = new HelperClass();
	d = h.getDoctor(itemId);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>MEDIVISIT</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link
	href="<%=request.getContextPath()%>/assets/Patient/img/flavicon.png"
	rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
    

<!-- Libraries Stylesheet -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- Customized Bootstrap Stylesheet -->
<link
	href="<%=request.getContextPath()%>/assets/Patient/css/bootstrap.min.css"
	rel="stylesheet">
	

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath()%>/assets/Patient/css/style.css"
	rel="stylesheet">
</head>

<body>
	

	<div class="container-xxl position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->



		<!-- Content Start -->
		<div class="content open">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
				<img src="../assets/Doctor/img/flavicon.png" class="mb-2" alt="" style="height: 30px;">
				<a href="index.jsp" class="navbar-brand mx-2 mt-1 ">
				
					<h3 class="text-primary ">
						
							MEDIVISIT
					</h3>
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
	<div class="container-sm bg-light d-grid gap-2 my-2 rounded-3 py-3 ">
        <div class="text-center ">
            <img src="<%=request.getContextPath()%>\<%= d.getImagePath() %>" alt="avatar" class="rounded-circle img-fluid align-content-center" style="width: 150px;">
            <h2>Dr.<%= d.getFirstName()+" "+d.getLastName() %></h2>
            <h4 class="fw-bold"><%= d.getSpecialty() %></h4>
        </div>


        <div class="row px-2 py-3">

            <div class="card" style="border: 100px;">
                <div class="pt-1 border-bottom">
                    <h3 class="text-black-50 mx-3 fst-italic">Summary :</h3>
                </div>
                <div class="card-body text-center">
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="subtitles mb-0">Adress</p>
                        </div>
                        <div class="col-sm-9">
                            <%= d.getAddress() %>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="subtitles mb-0">Phone</p>
                        </div>
                        <div class="col-sm-9">
                            <%= d.getPhoneNumber() %>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="subtitles mb-0">Email</p>
                        </div>
                        <div class="col-sm-9">
                            <%= d.getEmail() %>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row px-2 py-3">

            <div class="card" style="border: 100px;">
                <div class="pt-1 border-bottom">
                    <h3 class="text-black-50 mx-3 fst-italic">Schedule :</h3>
                </div>
                <div class="card-body text-center">
                <form method="post" action="<%=request.getContextPath()%>/booking">
                <input type="hidden" name="Id" value="<%=request.getParameter("itemId") %>">
                    <div class="row">
                        <div class="col-sm-3">
                            <p class="subtitles mb-0">Working days</p>
                        </div>
                        <div class="col-sm-9 ">
                            <div class="d-flex flex-wrap " >
                             <% for(int i = 0; i < d.getWorkingDays().length;i++){ %>
                             <label class="form-check-label mx-3" > 
                               <%=d.getWorkingDays()[i] %>
                            </label>
                            <%} %>
                             </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3 mt-2">
                            <p class="subtitles mb-0">Pick a Day</p>
                        </div>
                        <div class="col-sm-9 ">
                            <div class="d-flex flex-wrap " >
                            <input type="date" class="form-control-plaintext inp" style="text-align: center;" name="date" required>
                           </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3 ">
                            <p class="subtitles mb-0">Working hours</p>
                        </div>
                        <div class="col-sm-9 d-flex flex-wrap ">
						<% for(int i = 0; i < d.getWorkingDays().length;i++){ %>
                           <label class="form-check-label mx-3"> 
                           <%=d.getWorkingHours()[i] %>
                           </label>
                        <%} %>
                       
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3 mt-2">
                            <p class="subtitles mb-0">Pick a time</p>
                        </div>
                        <div class="col-sm-9">
                            <div class="d-flex flex-wrap " >
                            <input type="time" name="time" id="time" style="text-align: center;" class="form-control-plaintext inp" required>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
            

        </div>
        <input class="btn btn-primary" type="submit" value="Make an appoinement">
        
    </div>
    </form>
			<!-- Footer Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-light rounded-top p-4">
					<div class="row">
						<div class="col-12 col-sm-6 text-center text-sm-start">
							&copy; <a href="#">MEDIVISIT</a>, All Right Reserved.
						</div>

					</div>
				</div>
			</div>
			<!-- Footer End -->
		</div>
		<!-- Content End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

					
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Patient/lib/chart/chart.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Patient/lib/easing/easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Patient/lib/waypoints/waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Patient/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Patient/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/assets/Patient/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/assets/Patient/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="<%= request.getContextPath() %>/assets/Patient/js/main.js"></script>
</body>

</html>