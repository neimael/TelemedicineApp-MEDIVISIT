<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DAO.PatientDao"%>
<%@page import="Models.Patient"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.lang.String"%>

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
						<h3 class="page-title">Update Patient</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="AllPatients">All
										Patients</a></li>
								<li class="breadcrumb-item active" aria-current="page">Edit
									Patient</li>
							</ol>
						</nav>
					</div>
					<div class="row">

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ResultSet rs = PatientDao.getPatient(id);
						if (rs != null && rs.next() == true) {
						%>

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
														<input type="file" class="form-control" name="image" />
													</div>
												</div>
											</div>

										</div>
										<input type="hidden" class="form-control" name="id"
											value="<%=rs.getString(1)%>" /> <input type="hidden"
											class="form-control" name="path" value="<%=rs.getString(2)%>" />

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">First Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="firstName"
															value="<%=rs.getString(3)%>" required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Last Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="lastName"
															value="<%=rs.getString(4)%>" required />
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
															<%
															if (rs.getString(8).equals("Male")) {
															%>
															<option value="Male" selected>Male</option>
															<option value="Female">Female</option>
															<%
															} else if (rs.getString(8).equals("Female")) {
															%>
															<option value="Male">Male</option>
															<option value="Female" selected>Female</option>
															<%
															}
															%>

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
															value="<%=rs.getString(5)%>" placeholder="dd/mm/yyyy"
															name="BirthDay" required />
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
															value="<%=rs.getString(6)%>" required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Phone Number</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="phoneNumber"
															value="<%=rs.getString(7)%>" required />
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
															value="<%=rs.getString(10)%>" required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Social
														Account</label>
													<div class="col-sm-9">
														<input type="text" class="form-control"
															name="socialAccount" value="<%=rs.getString(9)%>"
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
												name="submit" value="Update Patient"/>
											
										</center>
									</form>
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
			text : "You have updated the patient successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/editPatient");
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
			window.location.replace("/telemedicine/editPatient");
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
			window.location.replace("/telemedicine/editPatient");
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
			window.location.replace("/telemedicine/editPatient");
		});
	</script>
	<%
	}
	%>

	<!-- End custom js for this page -->
</body>
</html>
