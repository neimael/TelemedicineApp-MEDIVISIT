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
						<h3 class="page-title">Update Appointment</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="AllAppointments">All
										Appointments</a></li>
								<li class="breadcrumb-item active" aria-current="page">Edit
									Appointment</li>
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

									<div class="row">
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
												<label class="col-sm-3 col-form-label">Meeting Link</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="link"
														value="<%=rs.getString(8)%>" required />
												</div>
											</div>
										</div>

									</div>

									<div class="form-check mx-sm-2">
										<label class="form-check-label"> <input type="hidden"
											class="form-check-input" checked>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<%
	String status = "";
	if (request.getParameter("status") != null) {
		status = request.getParameter("status");
	}
	System.out.println(request.getParameter("test"));
	System.out.println(status);
	if (status.equals("success")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "You have added a patient successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AddAppointment");
		});
	</script>
	<%
	} else if (status.equals("failed")) {
	%>
	<script>
		swal({
			title : "Error!",
			text : "An error occurred, Please try again!",
			icon : "error",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AddAppointment");
		});
	</script>
	<%
	} else if (status.equals("emailExist")) {
	%>
	<script>
		swal({
			title : "Error!",
			text : "This Email is already exist!",
			icon : "error",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AddAppointment");
		});
	</script>
	<%
	} else if (status.equals("phoneExist")) {
	%>
	<script>
		swal({
			title : "Error!",
			text : "This Phone Number is already exist!",
			icon : "error",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AddAppointment");
		});
	</script>
	<%
	} else if (status.equals("successExport")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "You have exported all patients successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AddAppointment");
		});
	</script>
	<%
	}
	%>




	<script>
		var today = new Date().toISOString().split('T')[0];
		document.getElementsByName("date")[0].setAttribute('min', today);
	</script>


	<!-- End custom js for this page -->
</body>
</html>