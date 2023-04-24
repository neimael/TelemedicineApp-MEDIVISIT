<%@page import="Controllers.UpdatePatient"%>
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
<link
	href="<%=request.getContextPath()%>/assets/Patient/lib/owlcarousel/../assets/Patient/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/Patient/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link
	href="<%=request.getContextPath()%>/assets/Patient/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath()%>/assets/Doctor/css/style.css"
	rel="stylesheet">
	
    
    <script src="https://kit.fontawesome.com/badbb472a2.js" crossorigin="anonymous"></script>
    
    
</head>

<body>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" />

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


		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-light navbar-light">
					
				<a href="index.jsp" class="navbar-brand mx-4 mb-3 d-flex flex-wrap">
				
					<h3 class="text-primary">
						
							MEDIVISIT
					</h3>
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
						class="nav-item nav-link "><i
						class="fa fa-tachometer-alt me-2"></i>Home</a> <a
						href="<%=request.getContextPath()%>/Patient/appointment.jsp"

						class="nav-item nav-link "><i class="fa fa-medkit  me-2"></i>Appointments</a>
					  <a

						href="<%=request.getContextPath()%>/Patient/profil.jsp"
						class="nav-item nav-link active"><i class="fa fa-user-md me-2"
						aria-hidden="true"></i>Profil</a>


				</div>
			</nav>
		</div>
		<!-- Sidebar End -->


		<!-- Content Start -->
		<div class="content">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
				<a href="index.jsp" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<img
							src="<%=request.getContextPath()%>/assets/Patient/img/flavicon.png"
							alt="" style="height: 30px;">
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
					class="fa fa-bars"></i>
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


			<!-- Table Start -->

			<div class="container">
				<div class="row" style="margin-top: 30px; height: auto;">
					<div class="col-lg-12">
						<div class="card mb-4">
							
							<form action="<%=request.getContextPath()%>/updatepatient" method="post" enctype = "multipart/form-data">
								<div class="card-body text-center">
							<label for="file">
							<% if(session.getAttribute("Image")==null){ %>
							<img src="<%=request.getContextPath()%>/assets/Patient/user_images/user.png"
									alt="avatar" class="rounded-circle img-fluid"
									style="width: 150px;">
									<% }else{ 
									%>
									<img src="<%=request.getContextPath()%>\<%=session.getAttribute("Image") %>"
									alt="avatar" class="rounded-circle img-fluid"
									style="width: 150px;"><% }%>
									
							  <input type="file" id="file" style="display: none" name="image" accept="image/gif,image/jpeg,image/jpg,image/png" multiple="" data-original-title="upload photos">
							</label>
							
								<h5 class="my-3" name="dctname"><%=session.getAttribute("fullname")%></h5>
								<p class="text-muted mb-1">PATIENT</p>

							</div>
							<div class="col-lg-8" style="margin-left: 190px;">
									<div class="card mb-4" style="border: 100px;">
										<div class="card-body text-center">
											<div class="row">
												<div class="col-sm-3">
													<p class="mb-0">First Name</p>
												</div>
												<div class="col-sm-9">
													<input type="text" class="form-control-plaintext inp"
														style="text-align: center;" name="fisrtname"
														value="<%=session.getAttribute("FisrtName")%>">
												</div>
											</div>
											<hr>
											<div class="card-body text-center">
												<div class="row">
													<div class="col-sm-3">
														<p class="mb-0">Last Name</p>
													</div>
													<div class="col-sm-9">
														<input type="text" class="form-control-plaintext inp"
															style="text-align: center;" name="lastname"
															value="<%=session.getAttribute("LastName")%>">
													</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-sm-3">
														<p class="mb-0">Email</p>
													</div>
													<div class="col-sm-9">
														<input type="text" class="form-control-plaintext inp"
															style="text-align: center;" name="email"
															value="<%=session.getAttribute("Email")%>">
													</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-sm-3">
														<p class="mb-0">Phone</p>
													</div>
													<div class="col-sm-9">
														<input type="text" class="form-control-plaintext inp"
															style="text-align: center;" name="phone"
															value="<%=session.getAttribute("Phone")%>">
													</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-sm-3">
														<p class="mb-0">Address</p>
													</div>
													<div class="col-sm-9">
														<input type="text" class="form-control-plaintext inp"
															style="text-align: center;" name="address"
															value="<%=session.getAttribute("Adress")%>">
													</div>
												</div>
												<hr>
											<div class="row">
												<div class="col-sm-3">
													<p class="mb-0">Social Number</p>
												</div>
												<div class="col-sm-9">
													<input type="text" class="form-control-plaintext inp"
														style="text-align: center;" name="Social_Account"
														value="<%=session.getAttribute("Social_Account")%>">
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-3">
													<p class="mb-0">BirthDay</p>
												</div>
												<div class="col-sm-9">
													<input type="date" class="form-control-plaintext inp"
														style="text-align: center;" name="birthday"
														value="<%=session.getAttribute("birthday")%>">
												</div>
											</div>
											<hr>
											
											<div class="row">
												<div class="col-sm-3">
													<p class="mb-0">Old Password</p>
												</div>
												<div class="col-sm-9">
													<input type="password" class="form-control-plaintext inp"
														style="text-align: center;" name="password"
														value="<%=session.getAttribute("Password")%>">
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-3">
													<p class="mb-0">New Password</p>
												</div>
												<div class="col-sm-9">
													<input type="password" class="form-control-plaintext inp"
														style="text-align: center;" name="passwordNew" value="">
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="d-flex justify-content-center mb-2">
									<input type="submit" class="btn btn-primary" name="Submit" value="Update Profil"/>
									
									<button type="button" class="btn btn-outline-primary ms-1"
										name="Logout">
										<a href="<%=request.getContextPath()%>/logout">Logout</a>
									</button>
								</div>
						</div>
						</form>
					</div>


				</div>
			</div>
			<!-- Table End -->


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
	<script type="text/javascript">
    	var status = document.getElementById("status").value;
    	if(status=="success"){
    		swal("Congrats","Your profil is updated successfully","success");
    	}
        
        
    </script>
</body>

</html>