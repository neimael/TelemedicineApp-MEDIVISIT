<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement" import="java.sql.ResultSet"%>
<%@ page import="Models.DataBaseConnection" import="Models.Appointment "
	import="DAO.AppointmentDao" import="DAO.PatientDao"
	import="DAO.DoctorDao" import="java.sql.Connection"%>



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
						<h6 class="mb-0"><%=session.getAttribute("fullname")%></h6>
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
			<form action="" method="">
				<div class="container-fluid pt-4 px-4">
					<div class="row g-4">

						<div class="col-12">
							<div class="bg-light rounded h-100 p-4">
								<h6 class="mb-4">Appointments</h6>
								<div class="table-responsive">
									<table
										class="table text-start align-middle table-bordered table-hover mb-0">


										<thead>
											<tr class="text-dark text-center">
												<th scope="col">Date</th>
												<th scope="col">Time</th>
												<th scope="col">Patient</th>
												<th scope="col">Link</th>
												<th scope="col">Amount</th>
												<th scope="col">Status</th>
												<th scope="col">Action</th>

											</tr>
										</thead>


										<%
										int id = (Integer) session.getAttribute("Id");
										ResultSet rs = AppointmentDao.getAppointmentD(id);
										ResultSet rs2 = null;
										ResultSet rs3 = null;
										if (rs != null && rs.next() == true) {
											do {
												rs2 = PatientDao.getPatient(rs.getInt("Patient_id"));
												rs2.next();
												rs3 = DoctorDao.getDoctor((Integer) session.getAttribute("Id"));
												rs3.next();
										%>


										<tr>
											<td><%=rs.getString(2)%></td>
											<td><%=rs.getString(3)%></td>
											<td><%=rs2.getString(4) + " " + rs2.getString(3)%></td>
											<td><%=rs.getString(8)%></td>
											<td><%=rs.getString(7)%></td>
											<td><%=rs.getString(6)%></td>


											<td><a
												href="<%=request.getContextPath()%>/acceptAppointment?id=<%=rs.getString(1)%>"
												class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
												aria-label="edit"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														fill="black" class="w-5 h-5" viewBox="0 0 20 20">
                                        						<path
															d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"> </path>
                                    						</svg>
											</a> <a href="<%=request.getContextPath()%>/appointmentCancelled?id=<%=rs.getString(1)%>"
												class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
												aria-label="cancel"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														fill="red" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
  																	<path
															<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/> />
																				</svg>
											</a></td>

										</tr>
										<%
										} while (rs.next());
										} else {
										%>
										<tr>
											<td colspan="7"><center>No data to show!</center></td>
										</tr>
										<%
										}
										%>




									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
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
</body>

</html>