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
						<h3 class="page-title">Profile</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="adminDashboard">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">Edit
									Profile</li>
							</ol>
						</nav>
					</div>
					<div class="row">



						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<form class="form-sample" action="" method="post">

										<input type="hidden" name="id"
											value="<%=session.getAttribute("IdAdmin")%>" />

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">First Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="firstName"
															value="<%=session.getAttribute("First_NameAdmin")%>"
															required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Last Name</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="lastName"
															value="<%=session.getAttribute("Last_NameAdmin")%>"
															required />
													</div>
												</div>
											</div>
										</div>
										<div class="row">

											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Date of
														Birth</label>
													<div class="col-sm-9">
														<input type="date" class="form-control"
															value="<%=session.getAttribute("BirthDayAdmin")%>"
															name="BirthDay" required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Username</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="username"
															value="<%=session.getAttribute("UsernameAdmin")%>"
															required />
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
															value="<%=session.getAttribute("EmailAdmin")%>" required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Phone Number</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="phoneNumber"
															value="<%=session.getAttribute("Phone_NumberAdmin")%>"
															required />
													</div>
												</div>
											</div>
										</div>


										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Password</label>
													<div class="col-sm-9">
														<input type="password" class="form-control"
															name="password" required />
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
												name="submit" value="Update Profile" />

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
	if (status.equals("successUpdate")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "You have updated your profile successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AdminShowProfile");
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
			window.location.replace("/telemedicine/AdminShowProfile");
		});
	</script>
	<%
	} else if (status.equals("passwordIncorrect")) {
	%>
	<script>
		swal({
			title : "Error!",
			text : "Old password is inccorect, Please try again!",
			icon : "error",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AdminShowProfile");
		});
	</script>
	<%
	}
	%>

	<!-- End custom js for this page -->
</body>
</html>
