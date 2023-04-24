<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement" import="java.sql.ResultSet"%>
<%@ page import="Models.DataBaseConnection" import="Models.Appointment "  import="Models.Tools"
	import="DAO.AppointmentDao" import="DAO.PatientDao"
	import="DAO.DoctorDao" import="java.sql.Connection"%>



<!DOCTYPE html>
<html lang="en">

<head>


<%
if (session.getAttribute("Id") == null) {
	response.sendRedirect("/telemedicine/Login/DoctorLogin.jsp");
}
%>

<meta charset="utf-8">
<title>MEDIVISIT</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link
	href="<%=request.getContextPath()%>/assets/Doctor/img/flavicon.png"
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
	href="<%=request.getContextPath()%>/assets/Doctor/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/Doctor/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link
	href="<%=request.getContextPath()%>/assets/Doctor/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath()%>/assets/Doctor//css/style.css"
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


		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-light navbar-light">

				<a href="index.jsp" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<img src="<%=request.getContextPath()%>/assets/Doctor/img/3.png"
							alt="" style="height: 60px;">MEDIVISIT
					</h3>
				</a>
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
						<img class="rounded-circle"
							src="<%=request.getContextPath()%>\<%=session.getAttribute("Image")%>"
							alt="" style="width: 40px; height: 40px;">
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
					</div>
					<div class="ms-3">
						<h6 class="mb-0">Fatima FRIST</h6>
						<span>DOCTOR</span>
					</div>
				</div>

				<div class="navbar-nav w-100">
					<a href="<%=request.getContextPath()%>/Doctor/index.jsp"
						class="nav-item nav-link "><i
						class="fa fa-tachometer-alt me-2"></i>Dashboard</a> <a
						href="<%=request.getContextPath()%>/Doctor/appointment.jsp"
						class="nav-item nav-link active"><i class="fa fa-medkit  me-2"></i>Appointments</a>
					<a href="<%=request.getContextPath()%>/Doctor/patients.jsp"
						class="nav-item nav-link"><i class="fa fa-user-plus me-2"
						aria-hidden="true"></i>Patients</a><a
						href="<%=request.getContextPath()%>/Doctor/profil.jsp"
						class="nav-item nav-link"><i class="fa fa-user-md me-2"
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
							src="<%=request.getContextPath()%>/assets/Doctor/img/flavicon.png"
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
							<a href="#" class="dropdown-item">My Profile</a> <a
								href="<%=request.getContextPath()%>/logout"
								class="dropdown-item">Log Out</a>
						</div>
					</div>
				</div>
			</nav>
			<!-- Navbar End -->


			<!-- Table Start -->


			<div class="container-scroller">
				<!-- partial:../../partials/_navbar.html -->


				<!-- partial -->
				<div class="container-fluid page-body-wrapper">
					<!-- partial:../../partials/_sidebar.html -->

					<!-- partial -->
					<div class="main-panel">
						<div class="content-wrapper">
							<div class="page-header">
								<h3 class="page-title">Update Appointment</h3>
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a
											href="<%=request.getContextPath()%>/Doctor/appointment.jsp">All
												Appointments</a></li>

									</ol>
								</nav>
							</div>

							<%
							int id = Integer.parseInt(request.getParameter("id"));
							ResultSet rs = AppointmentDao.getAppointment(id);
							if (rs != null && rs.next() == true) {
							%>


							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<form class="form-sample" action="" method="post">
											<input type="hidden" name="Patient"
												value="<%=rs.getString(4)%>" /> <input type="hidden"
												name="Doctor" value="<%=rs.getString(5)%>" /> <input
												type="hidden" name="status" value="<%=rs.getString(6)%>" />
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Date</label>
														<div class="col-sm-9">
															<input type="date" class="form-control"
																placeholder="dd/mm/yyyy" name="date" id="date"
																value="<%=rs.getString(2)%>" required />
														</div>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Time</label>
														<div class="col-sm-9">
															<input type="time" class="form-control" name="time"
																id="time" value="<%=rs.getString(3)%>" required />
														</div>
													</div>
												</div>

											</div>


											<div class="row" style="margin-top: 15px;!important">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Amount</label>
														<div class="col-sm-9">
															<input type="number" class="form-control" name="amount"
																value="<%=rs.getString(7)%>" required />
														</div>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Meeting
															Link</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" name="link"
																value="<%=Tools.generateGoogleMeetLink()%>" required />
														</div>
													</div>
												</div>

											</div>

											<div class="form-check mx-sm-2">
												<label class="form-check-label"> <input
													type="hidden" class="form-check-input" checked>
												</label>
											</div>
											<center>
												<input type="submit" class="btn btn-primary mb-4"
													name="submit" value="Edit Appointment" />
											</center>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<!-- content-wrapper ends -->
		<!-- partial:../../partials/_footer.html -->


		<!-- partial -->
	</div>
	<!-- main-panel ends -->
	</div>
	<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="assets/Admin/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="assets/Admin/vendors/chart.js/Chart.min.js"></script>
	<script src="assets/Admin/js/jquery.cookie.js" type="text/javascript"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="assets/Admin/js/off-canvas.js"></script>
	<script src="assets/Admin/js/hoverable-collapse.js"></script>
	<script src="assets/Admin/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="assets/Admin/js/dashboard.js"></script>
	<script src="assets/Admin/js/todolist.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>






	<script>
		var today = new Date().toISOString().split('T')[0];
		document.getElementsByName("date")[0].setAttribute('min', today);
	</script>
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
		src="<%=request.getContextPath()%>/assets/Doctor/lib/chart/chart.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Doctor/lib/easing/easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Doctor/lib/waypoints/waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Doctor/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Doctor/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Doctor/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/Doctor/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="<%=request.getContextPath()%>/assets/Doctor/js/main.js"></script>



	<%
	String status = "";
	if (request.getParameter("status") != null) {
		status = request.getParameter("status");
	}
	System.out.println(request.getParameter("test"));
	System.out.println(status);
	if (status.equals("successUpdate")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "You have updated the Appointment successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AllAppointments");
		});
	</script>
	<%
	}
	%>



</body>

</html>