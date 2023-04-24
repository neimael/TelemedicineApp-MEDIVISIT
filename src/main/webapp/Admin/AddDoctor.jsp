<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>MediVist - Add Doctor</title>
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
						<h3 class="page-title">Add Doctor</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="AllDoctors">All
										Doctors</a></li>
								<li class="breadcrumb-item active" aria-current="page">Add
									Doctor</li>
							</ol>
						</nav>
					</div>
					<div class="row">

						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<form class="form-sample" action="" method="post"
										autocomplete="off" enctype='multipart/form-data'>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Image</label>
													<div class="col-sm-9">
														<input type="file" class="form-control" name="image"
															required />
													</div>
												</div>
											</div>

										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">First Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="firstName"
															required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Last Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="lastName"
															required />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Gender</label>
													<div class="col-md-9">
														<select class="form-control" name="sex">
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
															placeholder="dd/mm/yyyy" name="BirthDay" required />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Email</label>
													<div class="col-sm-9">
														<input type="email" class="form-control" name="email"
															required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Phone Number</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="phoneNumber"
															required />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Address</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="address"
															required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Specialty</label>
													<div class="col-md-9">
														<select class="form-control" name="specialty">
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

										<div class="row">
											<label class=" col-form-label">Working Days</label>
											<div class="col-md-2">

												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Monday"> Monday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">

												<div class="form-group">

													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Tuesday"> Tuesday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">

												<div class="form-group">

													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Wednesday"> Wednesday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Thursday"> Thursday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Friday"> Friday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Saturday"> Saturday
														</label>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<label class=" col-form-label">Working Hours</label>

											<div class="col-md-1">

												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="8"> 8
														</label>
													</div>
												</div>

											</div>
											<div class="col-md-1">

												<div class="form-group">

													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="9"> 9
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">

												<div class="form-group">

													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="10"> 10
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="11"> 11
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="12"> 12
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="13"> 13
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="14"> 14
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="15"> 15
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="16"> 16
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="17"> 17
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="18"> 18
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="19"> 19
														</label>
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
												name="submit" value="Add Doctor">
											</button>
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
			text : "You have added the doctor successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/addDoctor");
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
			window.location.replace("/telemedicine/addDoctor");
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
			window.location.replace("/telemedicine/addDoctor");
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
			window.location.replace("/telemedicine/addDoctor");
		});
	</script>
	<%
	} else if (status.equals("successExport")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "You have exported all doctors successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/addDoctor");
		});
	</script>
	<%
	}
	%>

	<!-- End custom js for this page -->
</body>
</html>
