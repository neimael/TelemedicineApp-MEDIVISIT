<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement" import="java.sql.ResultSet"%>
<%@ page import="Models.DataBaseConnection" import="Models.Appointment "
	import="DAO.AppointmentDao" import="DAO.PatientDao"
	import="DAO.DoctorDao" import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DAO.DoctorDao"%>
<%@page import="DAO.PatientDao"%>
<%@page import="DAO.AppointmentDao"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>MEDIVISIT</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="<%=request.getContextPath()%>/assets/img/flavicon.png"
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
<link href="<%=request.getContextPath()%>/assets/Doctor/css/style.css"
	rel="stylesheet">
</head>

<body>



	<%
	int id1 = (Integer) session.getAttribute("Id");

	int income = AppointmentDao.Income(id1);
	int patientCount = AppointmentDao.getPCount(id1);
	int appoinmentCount = AppointmentDao.getDACount(id1);

	int[] incoms = AppointmentDao.lineChartIn(id1);
	int[] counts = AppointmentDao.lineChartD(id1);
	%>
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
					<h3 class="text-primary">MEDIVISIT</h3>
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
						class="nav-item nav-link active"><i
						class="fa fa-tachometer-alt me-2"></i>Dashboard</a> <a
						href="<%=request.getContextPath()%>/Doctor/appointment.jsp"
						class="nav-item nav-link"><i class="fa fa-medkit  me-2"></i>Appointments</a>
					<a href="<%=request.getContextPath()%>/Doctor/patients.jsp"
						class="nav-item nav-link"><i class="fa fa-user-plus me-2"
						aria-hidden="true"></i>Patients</a> <a
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
							<a href="<%=request.getContextPath()%>/Doctor/profil.jsp"
								class="dropdown-item">My Profile</a> <a
								href="<%=request.getContextPath()%>/logout"
								class="dropdown-item">Log Out</a>
						</div>
					</div>
				</div>
			</nav>
			<!-- Navbar End -->


			<!-- Income & appointment & patients Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-4">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<img
								src="<%=request.getContextPath()%>/assets/Doctor/img/monthlyincome.jfif"
								alt="" style="height: 55px;">
							<div class="ms-3">
								<p class="mb-2">Income</p>
								<h6 class="mb-0" name="monthlyincome"><%=income%>
									DH
								</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-xl-4">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<img
								src="<%=request.getContextPath()%>/assets/Doctor/img/appointment.jfif"
								alt="" style="height: 55px">
							<div class="ms-3">
								<p class="mb-2">Appointments</p>
								<h6 class="mb-0" name="appointments"><%=appoinmentCount%></h6>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-xl-4">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<img
								src="<%=request.getContextPath()%>/assets/Doctor/img/patient.jfif"
								alt="" style="height: 55px;">
							<div class="ms-3">
								<p class="mb-2">Patients</p>
								<h6 class="mb-0" name="nbpatients"><%=patientCount%></h6>
							</div>
						</div>
					</div>


				</div>
			</div>
			<!-- Sale & Revenue End -->


			<!-- Appointments Chart Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6">
						<div class="bg-light text-center rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Appointments</h6>

							</div>
							<canvas id="appointments" style="height: 250px"></canvas>
						</div>
					</div>

					<div class="col-sm-12 col-xl-6">
						<div class="bg-light text-center rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Income</h6>

							</div>
							<canvas id="Income" style="height: 250px"></canvas>
						</div>
					</div>

				</div>
			</div>
			<!-- Appointments Chart End -->


			<!-- Recent Appointment Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-light text-center rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">Recent Appointment</h6>
						<a href="<%=request.getContextPath()%>/Doctor/appointment.jsp">Show
							All</a>
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-dark text-center">
									<th scope="col">Date</th>
									<th scope="col">Link</th>
									<th scope="col">Patient</th>
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
							<tbody>




							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Recent Sales End -->




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

	<script>
		var ctx = document.getElementById('appointments').getContext('2d');
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ 'Monday', 'Tuesday', 'Wednesday',
								'Thursday', 'Friday', 'Saturday', 'Sunday' ],
						datasets : [ {
							label : 'Number Of Appointments',
							data : [
	<%=counts[6]%>
		,
	<%=counts[5]%>
		,
	<%=counts[4]%>
		,
	<%=counts[3]%>
		,
	<%=counts[2]%>
		,
	<%=counts[1]%>
		,
	<%=counts[0]%>
		],
							backgroundColor : [ 'rgba(255, 99, 132, 0.6)',
									'rgba(54, 162, 235, 0.6)',
									'rgba(255, 206, 86, 0.6)',
									'rgba(75, 192, 192, 0.6)',
									'rgba(153, 102, 255, 0.6)',
									'rgba(255, 159, 64, 0.6)',
									'rgba(0, 136, 12, 0.6)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)',
									'rgba(0, 136, 12, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
	</script>



	<script>
		var ctx = document.getElementById('Income').getContext('2d');
		var myChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
						'Friday', 'Saturday', 'Sunday' ],
				datasets : [ {
					label : 'Incomes',
					data : [
	<%=incoms[6]%>
		,
	<%=incoms[5]%>
		,
	<%=incoms[4]%>
		,
	<%=incoms[3]%>
		,
	<%=incoms[2]%>
		,
	<%=incoms[1]%>
		,
	<%=incoms[0]%>
		],
					backgroundColor : "rgba(0, 156, 255, .5)",

					borderWidth : 1,
					fill : true

				} ]

			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>





</body>

</html>