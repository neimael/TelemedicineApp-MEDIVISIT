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
<title>MediVist - Add Patient</title>
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
<script src="assets/Admin/js/jquery-3.6.4.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<h3 class="page-title">Add Appointment</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="AllAppointments">All
										Appointments</a></li>
								<li class="breadcrumb-item active" aria-current="page">Add
									Appointment</li>
							</ol>
						</nav>
					</div>
					<div class="row">

						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<form class="form-sample" action="" method="post"
										autocomplete="off">
										<center>
											<h3>Patient Section</h3>
										</center>
										<br> <br>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Patient</label>
													<div class="col-sm-9">
														<select class="form-control" name="Patient" id="Patient">
															<option selected disabled value="">Select...</option>
															<%
															ResultSet rs = PatientDao.getAllPatients("NULL");
															while (rs.next()) {
																if (request.getParameter("id") != null) {
															%>

															<option value="<%=rs.getInt(1)%>"
																<%=(rs.getInt(1) == Integer.parseInt(request.getParameter("id")) ? "selected" : "")%>><%=rs.getString(3) + " " + rs.getString(4) + " ( SA: " + rs.getString(9) + " )"%></option>
															<%
															} else {
															%>
															<option value="<%=rs.getInt(1)%>"><%=rs.getString(3) + " " + rs.getString(4) + " ( SA: " + rs.getString(9) + " )"%></option>
															<%
															}
															}
															%>
														</select>
													</div>
												</div>
											</div>


										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">First Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="firstName"
															disabled required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Last Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="lastName"
															disabled required />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Gender</label>
													<div class="col-md-9">
														<select class="form-control" id="sex" disabled>
															<option value="Male">Male</option>
															<option value="Female">Female</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Date of
														Birth</label>
													<div class="col-sm-9">
														<input type="date" class="form-control"
															placeholder="dd/mm/yyyy" id="BirthDay"
															required"  disabled />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Email</label>
													<div class="col-sm-9">
														<input type="email" class="form-control" id="email"
															disabled required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Phone Number</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="phoneNumber"
															disabled required />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Address</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="address"
															disabled required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Social
														Account</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="socialAccount"
															disabled name="socialAccount" required />
													</div>
												</div>
											</div>
										</div>

										<hr>

										<center>
											<h3>Doctor Section</h3>
										</center>
										<br> <br>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Doctor</label>
													<div class="col-sm-9">
														<select class="form-control" name="Doctor" id="Doctor">
															<option selected disabled value="">Select...</option>
															<%
															ResultSet rs2 = DoctorDao.getAllDoctors("NULL");
															while (rs2.next()) {
																if (request.getParameter("idDr") != null) {
															%>
															<option value="<%=rs2.getInt(1)%>"
																<%=(rs2.getInt(1) == Integer.parseInt(request.getParameter("idDr")) ? "selected" : "")%>><%=rs2.getString(3) + " " + rs2.getString(4) + " ( Spes: " + rs2.getString(10) + " )"%></option>
															<%
															} else {
															%>
															<option value="<%=rs2.getInt(1)%>" l><%=rs2.getString(3) + " " + rs2.getString(4) + " ( Spes: " + rs2.getString(10) + " )"%></option>

															<%
															}
															}
															%>
														</select>
													</div>
												</div>
											</div>


										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">First Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="firstName2"
															disabled required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Last Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="lastName2"
															disabled required />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Gender</label>
													<div class="col-md-9">
														<select class="form-control" id="sex2" disabled>
															<option value="Male">Male</option>
															<option value="Female">Female</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Date of
														Birth</label>
													<div class="col-sm-9">
														<input type="date" class="form-control"
															placeholder="dd/mm/yyyy" id="BirthDay2" required disabled />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Email</label>
													<div class="col-sm-9">
														<input type="email" class="form-control" id="email2"
															disabled required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Phone Number</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="phoneNumber2"
															disabled required />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Address</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="address2"
															disabled required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Specialty</label>
													<div class="col-md-9">
														<select class="form-control" id="specialty" disabled>
															<option value="Allergy and immunology">Allergy
																and immunology</option>
															<option value="Anesthesiology">Anesthesiology</option>
															<option value="Dermatology">Dermatology</option>
															<option value="Diagnostic radiology">Diagnostic
																radiology</option>
															<option value="Emergency medicine">Emergency
																medicine</option>
															<option value="Family medicine">Family medicine</option>
															<option value="Internal medicine">Internal
																medicine</option>
															<option value="Medical genetics">Medical
																genetics</option>
															<option value="Neurology">Neurology</option>
															<option value="Nuclear medicine">Nuclear
																medicine</option>
															<option value="Obstetrics and gynecology">Obstetrics
																and gynecology</option>
															<option value="Ophthalmology">Ophthalmology</option>
															<option value="Pathology">Pathology</option>
															<option value="Pediatrics">Pediatrics</option>
															<option value="hysical medicine and rehabilitation">Physical
																medicine and rehabilitation</option>
															<option value="Preventive medicine">Preventive
																medicine</option>
															<option value="Psychiatry">Psychiatry</option>
															<option value="Radiation oncology">Radiation
																oncology</option>
															<option value="Surgery">Surgery</option>
															<option value="Urology">Urology</option>
														</select>
													</div>
												</div>
											</div>
										</div>

										<hr>

										<center>
											<h3>Appointment Section</h3>
										</center>
										<br> <br>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Date</label>
													<div class="col-sm-9">
														<input type="date" class="form-control"
															placeholder="dd/mm/yyyy" name="date" id="date" required />
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Time</label>
													<div class="col-sm-9">
														<input type="time" class="form-control" name="time"
															id="time" required />
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
															required />
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Meeting Link</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="link"
															required />
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
												name="submit" value="Add Appointment" />
										</center>
									</form>
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


	<%
	if (request.getParameter("id") != null) {
		System.out.println("test " + request.getParameter("id"));
	%>

	<script>
		console.log("in");

		var id = $('#Patient').val();
		console.log(id);
		var url = 'GetPatientInfos?id=' + id;
		$.ajax({
			url : url,
			type : 'get',
			dataType : 'json',
			success : function(response) {
				if (response != null) {

					$('#firstName').val(response['firstName']);
					$('#lastName').val(response['lastName']);
					$('#BirthDay').val(response['BirthDay']);
					$('#email').val(response['email']);
					$('#phoneNumber').val(response['phoneNumber']);
					$('#address').val(response['address']);
					$('#socialAccount').val(response['socialAccount']);
					$('#sex').val(response['sex']);
				} else {
					console.log("null");

				}
			}
		});
	</script>
	<%
	}
	%>

	<%
	if (request.getParameter("idDr") != null) {
		System.out.println("test " + request.getParameter("id"));
	%>

	<script>
		var id = $('#Doctor').val();
		console.log(id);
		var url = 'GetDoctorInfos?id=' + id;
		$.ajax({
			url : url,
			type : 'get',
			dataType : 'json',
			success : function(response) {
				if (response != null) {

					$('#firstName2').val(response['firstName']);
					$('#lastName2').val(response['lastName']);
					$('#BirthDay2').val(response['BirthDay']);
					$('#email2').val(response['email']);
					$('#phoneNumber2').val(response['phoneNumber']);
					$('#address2').val(response['address']);
					$('#Specialty').val(response['Specialty']);
					$('#sex2').val(response['sex']);
				} else {
					console.log("null");

				}
			}
		});
	</script>
	<%
	}
	%>

	<script>
		$('#Patient').change(function() {
			var id = $(this).val();
			console.log(id);
			var url = 'GetPatientInfos?id=' + id;
			$.ajax({
				url : url,
				type : 'get',
				dataType : 'json',
				success : function(response) {
					if (response != null) {

						$('#firstName').val(response['firstName']);
						$('#lastName').val(response['lastName']);
						$('#BirthDay').val(response['BirthDay']);
						$('#email').val(response['email']);
						$('#phoneNumber').val(response['phoneNumber']);
						$('#address').val(response['address']);
						$('#socialAccount').val(response['socialAccount']);
						$('#sex').val(response['sex']);
					} else {
						console.log("null");

					}
				}
			});
		});

		$('#Doctor').change(function() {
			var id = $(this).val();
			console.log(id);
			var url = 'GetDoctorInfos?id=' + id;
			$.ajax({
				url : url,
				type : 'get',
				dataType : 'json',
				success : function(response) {
					if (response != null) {

						$('#firstName2').val(response['firstName']);
						$('#lastName2').val(response['lastName']);
						$('#BirthDay2').val(response['BirthDay']);
						$('#email2').val(response['email']);
						$('#phoneNumber2').val(response['phoneNumber']);
						$('#address2').val(response['address']);
						$('#Specialty').val(response['Specialty']);
						$('#sex2').val(response['sex']);
					} else {
						console.log("null");

					}
				}
			});
		});
		var today = new Date().toISOString().split('T')[0];
		document.getElementsByName("date")[0].setAttribute('min', today);
	</script>


	<!-- End custom js for this page -->
</body>
</html>
