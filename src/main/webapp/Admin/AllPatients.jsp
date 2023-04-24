<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DAO.PatientDao"%>
<%@page import="Models.Patient"%>
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
						<h3 class="page-title">All Patients</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item active" aria-current="page">Show
									All Patients</li>
							</ol>
						</nav>
					</div>
					<div class="row">

						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="jumbotron">
										<div class="container">
											<div class="row">
												<div class="col-lg-6 ">
													<a href="addPatient" class="btn btn-primary"><i
														class="mdi mdi-account-plus" style="margin-right: 10px;"></i>Add
														Patient</a> <a href="ExportPatients" class="btn btn-success"><i
														class="mdi mdi-file-excel" style="margin-right: 10px;"></i>Export</a>
												</div>
												<div class="col-lg-2"></div>

											</div>
										</div>
										<hr class="my-4">
									</div>
									<div class="table-responsive">
										<table class="table table-striped .table-responsive-md ">
											<thead>
												<tr>
													<th>#</th>
													<th></th>
													<th>Full Name</th>
													<th>Email</th>
													<th>Phone Number</th>
													<th>Social Account</th>
													<th>Gender</th>
													<th></th>
												</tr>

											</thead>
											<tbody id="search-result">
												<%
												ResultSet rs = PatientDao.getAllPatients("NULL");
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
													<td><%=rs.getString(9)%></td>
													<td><%=rs.getString(8)%></td>
													<td class="px-4 py-3" style="text-align: center">
														<div class="flex items-center space-x-4 text-sm">

															<a href="PatientInfos?id=<%=rs.getString(1)%>"
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
															</a> <a href="editPatient?id=<%=rs.getString(1)%>"
																class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
																aria-label="edit"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="black" class="w-5 h-5"
																	viewBox="0 0 20 20">
                                        						<path
																		d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"> </path>
                                    						</svg>
															</a> <a href="resetPasswordPatient?id=<%=rs.getString(1)%>"
																class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
																aria-label="reset"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="green" class="bi bi-arrow-repeat"
																	viewBox="0 0 16 16">
  																	<path
																		d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z" />
  																	<path fill-rule="evenodd"
																		d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z" />
																				</svg>
															</a> </a> <a
																href="BookAppointmentPatient?id=<%=rs.getString(1)%>"
																class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
																aria-label="reset"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="purple" class="bi bi-bookmark-plus"
																	viewBox="0 0 16 16">
  <path
																		d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
  <path
																		d="M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4z" />
</svg>
															</a><a href="PatientSoftDelete?id=<%=rs.getString(1)%>"
																class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
																aria-label="delete"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="orange" class="w-5 h-5"
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
					<table border="0">
						<tr>

						</tr>
						<tr>
							<td><div id="result"></div></td>
						</tr>
					</table>
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
	if (status.equals("successSoftDelete")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "You have moved the patient to the trash successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AllPatients");
		});
	</script>
	<%
	} else if (status.equals("successUpdate")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "You have updated the patient successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AllPatients");
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
			window.location.replace("/telemedicine/AllPatients");
		});
	</script>
	<%
	} else if (status.equals("successResetPassword")) {
	%>
	<script>
		swal({
			title : "Success!",
			text : "Username and Password have been updated successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/AllPatients");
		});
	</script>
	<%
	}
	%>

<script>
		$('body').on('keyup', '#search', function() {
			var searchQuest = $(this).val();
			console.log(searchQuest);
			var url = 'PatientSearch?id=' + searchQuest;
			$.ajax({
				url : url,
				type : 'get',
				dataType : 'json',
				success : function(response) {
						console.log(response);
						var searchResult = '';
						$('#search-result').html('');
						if (Array.isArray(response) && response.length == 0) {
			                searchResult = '<tr>' +
			                    '<td colspan="8">' +
			                    '<div class="alert alert-info alert-dismissible fade show" role="alert">' +
			                    '<center>No data to show!</center>' +
			                    '</div>' +
			                    '</td>' +
			                    '</tr>';
			                $('#search-result').append(searchResult);
			            }else {
			            	 
			            	console.log("else" + response);
			            	for(val in response) {
			            		var url1 = 'PatientInfos?id=' + response[val].id;
			            		var url2 = 'editPatient?id=' + response[val].id;
			            		var url3 = 'resetPasswordPatient?id=' + response[val].id;
			            		var url4 = 'BookAppointmentPatient?id=' + response[val].id;
			            		var url5 = 'PatientSoftDelete?id=' + response[val].id;
			            		

			            		searchResult = '<tr>' +
									'<td class="py-1">' + response[val].id + '</td>' +
									'<td><img src="' + response[val].imagePath + '" alt="image" /></td>' +
									'<td>' + response[val].firstName + " " + response[val].lastName + '</td>' +
									'<td>' + response[val].email + '</td>' +
									'<td>' + response[val].phoneNumber + '</td>' +
									'<td>' + response[val].socialAccount + '</td>' +
									'<td>' + response[val].sex + '</td>' +
									
									

									'<td class="px-4 py-3" style="text-align: center">' +
										'<div class="flex items-center space-x-4 text-sm">' +

											'<a href="' + url1 +'" ' +
												' class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"'+
												' aria-label="Show"> <svg'+
													' xmlns="http://www.w3.org/2000/svg" width="16"'+
													' height="16" fill="currentColor" class="w-5 h-5"'+
													' viewBox="0 0 20 20">'+
                        						'<path '+
														'd="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />'+
                        						'<path '+
														'd="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />'+
                    						'</svg>'+
											'</a> <a href="' + url2 +'" '+
												' class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray" ' +
												' aria-label="edit"> <svg '+
													' xmlns="http://www.w3.org/2000/svg" width="16" '+
													' height="16" fill="black" class="w-5 h-5" '+
													' viewBox="0 0 20 20">'+
                        						'<path '+
														'd="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"> </path>'+
                    						'</svg>'+
											'</a> <a href="' + url3 + '" ' +
												' class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"' +
												' aria-label="cancel"> <svg ' +
												' xmlns="http://www.w3.org/2000/svg" width="16" ' +
													' height="16" fill="green" class="bi bi-arrow-repeat" ' +
													' viewBox="0 0 16 16"> ' +
														' <path ' +
														' d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z" />' +
														' <path fill-rule="evenodd" ' +
														' d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z" />' +
																' </svg>' +
											'</a> </a> <a href="' + url4 + '" ' +
												' class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"' +
												' aria-label="reset"> <svg ' +
												' xmlns="http://www.w3.org/2000/svg" width="16"' +
												' 	height="16" fill="purple" class="bi bi-bookmark-plus"' +
													' viewBox="0 0 16 16">' +
													' <path ' +
														' d ="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />' +
													' <path ' +
														' d="M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4z" />' +
													' </svg>' +
											'</a><a href="' + url5 +'" '+
												' class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"' +
												' aria-label="delete"> <svg'+
													' xmlns="http://www.w3.org/2000/svg" width="16"'+
													' height="16" fill="orange" class="w-5 h-5"'+
													' viewBox="0 0 20 20">'+
                        						' <path '+
														'd="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"> </path>'+
                    						'</svg>'+
											'</a>'+
										'</div>'+
									'</td>'+
								'</tr>';
			            		$('#search-result').append(searchResult);
			                }
			            	var url6 = 'ExportSearchResultPatient?search=' + searchQuest;
		                	searchResult = '<tr>' +
		                    '<td colspan="8">' +
		                    '<center><a href="'+url6+'" class="btn btn-success"><i '
		                           +' class="bi bi-file-excel me-1"></i>Export Search Result</a><a> </center>' +
		                    '</td>' +
		                    '</tr>';
		                $('#search-result').append(searchResult);
			            }


				}
			});
		});
	</script>


	<!-- End custom js for this page -->
</body>
</html>