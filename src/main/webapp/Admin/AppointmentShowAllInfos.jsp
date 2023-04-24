<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.AppointmentDao"%>
<%@page import="DAO.DoctorDao"%>
<%@page import="DAO.PatientDao"%>
<%@page import="Models.Appointment"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%
	if (session.getAttribute("EmailAdmin") == null) {
		response.sendRedirect("/telemedicine/AdminLoginPage");
	}
	%>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MediVist</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="assets/Admin/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="assets/Admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="assets/Admin/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="assets/Admin/images/favicon.ico" />
</head>
<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.html -->


		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<jsp:include page="Header.jsp" />
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="page-header">
						<h3 class="page-title">Appointment Informations</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="AllAppointments">Show
										All Appointments</a></li>
								<li class="breadcrumb-item active" aria-current="page">Appointment
									Informations</li>
							</ol>
						</nav>
					</div>
					<div class="row">

						<div class="col-12">
							<div class="card">
								<div class="card-body">



									<%
									int id = Integer.parseInt(request.getParameter("id"));
									ResultSet rs = AppointmentDao.getAppointment(id);
									if (rs != null && rs.next() == true) {
										ResultSet rs2 = PatientDao.getPatient(rs.getInt(4));
										ResultSet rs3 = DoctorDao.getDoctor(rs.getInt(5));
										rs2.next();
										rs3.next();
									%>
									<center>
										<h3>Appointment Section</h3>
									</center>
									<br> <br>
									
									
									<div class="row">


										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Date</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs.getString(2)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Time</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs.getString(3)%></center>
													</p>
												</div>
											</div>
										</div>
										
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Amount</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs.getString(7)%></center>
													</p>
												</div>
											</div>
										</div>


									</div>
									
									<br><br>
									
									<div class="row">


										<div class="col-lg-6">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Link</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs.getString(8)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Status</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs.getString(6)%></center>
													</p>
												</div>
											</div>
										</div>


									</div>
									
									<br><br>

									<center>
										<h3>Patient Section</h3>
									</center>
									<br> <br>
									
									<div class="row">

										<div class="col-lg-12">
											<center>
												<img src="<%=rs2.getString(2)%>"
													class="rounded-circle mx-auto d-block" alt="patient image" width="200px" height="200px">
											</center>
										</div>


									</div>
									<br><br>

									<div class="row">

										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>First Name</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(3)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Last Name</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(4)%></center>
													</p>
												</div>
											</div>
										</div>

										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Date Of Birth</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(5)%></center>
													</p>
												</div>
											</div>
										</div>

									</div>
									<br>

									<div class="row">

										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Date Of Birth</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(5)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Gander</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(8)%></center>
													</p>
												</div>
											</div>
										</div>

										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Address</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(9)%></center>
													</p>
												</div>
											</div>
										</div>
									</div>

									<br>

									<div class="row">



										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Social Account</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(10)%></center>
													</p>
												</div>
											</div>
										</div>
										
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Email</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(6)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Phone Number</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs2.getString(7)%></center>
													</p>
												</div>
											</div>
										</div>


									</div>


									
									<br> <br> <br>
									<center>
										<h3>Doctor Section</h3>
									</center>
									<br> <br>
									
									<div class="row">

										<div class="col-lg-12">
											<center>
												<img src="<%=rs3.getString(2)%>"
													class="rounded-circle mx-auto d-block" alt="patient image" width="200px" height="200px">
											</center>
										</div>


									</div>
									
									<br><br>

									<div class="row">

										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>First Name</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs3.getString(3)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Last Name</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs3.getString(4)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Gender</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs3.getString(8)%></center>
													</p>
												</div>
											</div>
										</div>


									</div>
									<br>

									<div class="row">

										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Date Of Birth</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs3.getString(5)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Address</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs3.getString(9)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Speciality</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs3.getString(10)%></center>
													</p>
												</div>
											</div>
										</div>


									</div>

									<br> <br>

									<div class="row">


										<div class="col-lg-6">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Email</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs3.getString(6)%></center>
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="card"
												style="filter: drop-shadow(0 0 0.75rem #1977cc);">
												<div class="card-body">
													<h3 class="card-title">
														<center>Phone Number</center>
													</h3>
													<p>
													<center style="color: #1977cc;"><%=rs3.getString(7)%></center>
													</p>
												</div>
											</div>
										</div>


									</div>
									<%
									}
									%>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->

				<jsp:include page="Footer.jsp" />
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


	<!-- End custom js for this page -->
</body>
</html>