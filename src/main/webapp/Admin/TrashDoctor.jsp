<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.DoctorDao"%>
<%@page import="Models.Doctor"%>
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
						<h3 class="page-title">Trash</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="AllDoctors">All
										Doctors</a></li>
								<li class="breadcrumb-item active" aria-current="page">Trash</li>
							</ol>
						</nav>
					</div>
					<div class="row">

						<div class="col-12">
							<div class="card">
								<div class="card-body">

									<div class="table-responsive">
										<table class="table table-striped .table-responsive-md ">
											<thead>
												<tr>
													<th>#</th>
													<th></th>
													<th>Full Name</th>
													<th>Email</th>
													<th>Phone Number</th>
													<th>Speciality</th>
													<th>Work Days</th>
													<th></th>
												</tr>

											</thead>
											<tbody>
												<%
												ResultSet rs = DoctorDao.getAllDoctors("NOT NULL");
												if (rs != null && rs.next() == true) {
													do {
												%>
												<tr>
													<td><%=rs.getString(1)%></td>
													<td class="py-1"><img src="<%=rs.getString(2)%>"
														alt="image" /></td>
													<td><%=rs.getString(3) + " " + rs.getString(4)%></td>
													<td><%=rs.getString(6)%></td>
													<td><%=rs.getString(7)%></td>
													<td><%=rs.getString(10)%></td>
													<td><%=rs.getString(11)%></td>
													<td class="px-4 py-3" style="text-align: center">
														<div class="flex items-center space-x-4 text-sm">

															<a href="DoctorInfos?id=<%=rs.getString(1)%>"
																class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
																aria-label="Show"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="currentColor" class="w-5 h-5"
																	viewBox="0 0 20 20">
                                        						<path
																		d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
                                        						<path
																		d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
                                    						</svg>
															</a> <a href="RestorDoctor?id=<%=rs.getString(1)%>"
																class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
																aria-label="restor"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="green" class="w-5 h-5"
																	viewBox="0 0 20 20">
                                        						<path
																		d="M3.24,7.51c-0.146,0.142-0.146,0.381,0,0.523l5.199,5.193c0.234,0.238,0.633,0.064,0.633-0.262v-2.634c0.105-0.007,0.212-0.011,0.321-0.011c2.373,0,4.302,1.91,4.302,4.258c0,0.957-0.33,1.809-1.008,2.602c-0.259,0.307,0.084,0.762,0.451,0.572c2.336-1.195,3.73-3.408,3.73-5.924c0-3.741-3.103-6.783-6.916-6.783c-0.307,0-0.615,0.028-0.881,0.063V2.575c0-0.327-0.398-0.5-0.633-0.261L3.24,7.51 M4.027,7.771l4.301-4.3v2.073c0,0.232,0.21,0.409,0.441,0.366c0.298-0.056,0.746-0.123,1.184-0.123c3.402,0,6.172,2.709,6.172,6.041c0,1.695-0.718,3.24-1.979,4.352c0.193-0.51,0.293-1.045,0.293-1.602c0-2.76-2.266-5-5.046-5c-0.256,0-0.528,0.018-0.747,0.05C8.465,9.653,8.328,9.81,8.328,9.995v2.074L4.027,7.771z" />
                                    						</svg>
															</a> <a href="DoctorHardDelete?id=<%=rs.getString(1)%>"
																class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
																aria-label="Delete for ever"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="red" class="w-5 h-5"
																	viewBox="0 0 20 20">
                                        						<path
																		d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"> </path>
                                    						</svg>
															</a>
														</div>
													</td>
												</tr>
												<%
												} while (rs.next());
												} else {
												%>
												<tr>
													<td colspan="8"><center>No data to show!</center></td>
												</tr>
												<%
												}
												%>
											</tbody>
										</table>
									</div>
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
			text : "You have deleted the doctor successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/TrachDoctor");
		});
	</script>
	<%
	} else if (status.equals("successRestore")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "You have restored the doctor successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/TrachDoctor");
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
			window.location.replace("/telemedicine/TrachDoctor");
		});
	</script>
	<%
	}
	%>


	<!-- End custom js for this page -->
</body>
</html>