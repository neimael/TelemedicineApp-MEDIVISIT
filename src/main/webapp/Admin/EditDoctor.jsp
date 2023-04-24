<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DAO.DoctorDao"%>
<%@page import="Models.Doctor"%>
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
						<h3 class="page-title">Update Doctor</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="AllDoctors">All Doctors</a></li>
								<li class="breadcrumb-item active" aria-current="page">Edit
									Doctor</li>
							</ol>
						</nav>
					</div>
					<div class="row">

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ResultSet rs = DoctorDao.getDoctor(id);
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
															name="BirthDay" required/>
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
															value="<%=rs.getString(9)%>" required />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Specialty</label>
													<div class="col-md-9">
														<select class="form-control" name="specialty">
															<%
															if (rs.getString(10).equals("Allergy and immunology")) {
															%>
															<option value="Allergy and immunology" selected>Allergy
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
															<%
															} else if (rs.getString(10).equals("Anesthesiology")) {
															%>

															<option value="Allergy and immunology">Allergy
																and immunology</option>
															<option value="Anesthesiology" selected>Anesthesiology</option>
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

															<%
															} else if (rs.getString(10).equals("Dermatology")) {
															%>
															<option value="Allergy and immunology">Allergy
																and immunology</option>
															<option value="Anesthesiology">Anesthesiology</option>
															<option value="Dermatology" selected>Dermatology</option>
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
															<%
															} else if (rs.getString(10).equals("Diagnostic radiology")) {
															%>
															<option value="Allergy and immunology">Allergy
																and immunology</option>
															<option value="Anesthesiology">Anesthesiology</option>
															<option value="Dermatology">Dermatology</option>
															<option value="Diagnostic radiology" selected>Diagnostic
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
															<%
															} else if (rs.getString(10).equals("Emergency medicine")) {
															%>
															<option value="Allergy and immunology">Allergy
																and immunology</option>
															<option value="Anesthesiology">Anesthesiology</option>
															<option value="Dermatology">Dermatology</option>
															<option value="Diagnostic radiology">Diagnostic
																radiology</option>
															<option value="Emergency medicine" selected>Emergency
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
															<%
															} else if (rs.getString(10).equals("Family medicine")) {
															%>
															<option value="Allergy and immunology">Allergy
																and immunology</option>
															<option value="Anesthesiology">Anesthesiology</option>
															<option value="Dermatology">Dermatology</option>
															<option value="Diagnostic radiology">Diagnostic
																radiology</option>
															<option value="Emergency medicine">Emergency
																medicine</option>
															<option value="Family medicine" selected>Family
																medicine</option>
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
															<%
															} else if (rs.getString(10).equals("Internal medicine")) {
															%>
															<option value="Allergy and immunology">Allergy
																and immunology</option>
															<option value="Anesthesiology">Anesthesiology</option>
															<option value="Dermatology">Dermatology</option>
															<option value="Diagnostic radiology">Diagnostic
																radiology</option>
															<option value="Emergency medicine">Emergency
																medicine</option>
															<option value="Family medicine">Family medicine</option>
															<option value="Internal medicine" selected>Internal
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
															<%
															} else if (rs.getString(10).equals("Medical genetics")) {
															%><option value="Allergy and immunology">Allergy
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
															<option value="Medical genetics" selected>Medical
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
															<%
															} else if (rs.getString(10).equals("Neurology")) {
															%>
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
															<option value="Neurology" selected>Neurology</option>
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
															<%
															} else if (rs.getString(10).equals("Nuclear medicine")) {
															%>
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
															<option value="Nuclear medicine" selected>Nuclear
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
															<%
															} else if (rs.getString(10).equals("Obstetrics and gynecology")) {
															%>
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
															<option value="Obstetrics and gynecology" selected>Obstetrics
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
															<%
															} else if (rs.getString(10).equals("Ophthalmology")) {
															%>
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
															<option value="Ophthalmology" selected>Ophthalmology</option>
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
															<%
															} else if (rs.getString(10).equals("Pathology")) {
															%>
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
															<option value="Pathology" selected>Pathology</option>
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


															<%
															} else if (rs.getString(10).equals("Pediatrics")) {
															%>
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
															<option value="Pediatrics" selected>Pediatrics</option>
															<option value="hysical medicine and rehabilitation">Physical
																medicine and rehabilitation</option>
															<option value="Preventive medicine">Preventive
																medicine</option>
															<option value="Psychiatry">Psychiatry</option>
															<option value="Radiation oncology">Radiation
																oncology</option>
															<option value="Surgery">Surgery</option>
															<option value="Urology">Urology</option>
															<%
															} else if (rs.getString(10).equals("hysical medicine and rehabilitation")) {
															%>
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
															<option value="hysical medicine and rehabilitation"
																selected>Physical medicine and rehabilitation</option>
															<option value="Preventive medicine">Preventive
																medicine</option>
															<option value="Psychiatry">Psychiatry</option>
															<option value="Radiation oncology">Radiation
																oncology</option>
															<option value="Surgery">Surgery</option>
															<option value="Urology">Urology</option>
															<%
															} else if (rs.getString(10).equals("Preventive medicine")) {
															%>
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
															<option value="Preventive medicine" selected>Preventive
																medicine</option>
															<option value="Psychiatry">Psychiatry</option>
															<option value="Radiation oncology">Radiation
																oncology</option>
															<option value="Surgery">Surgery</option>
															<option value="Urology">Urology</option>
															<%
															} else if (rs.getString(10).equals("Psychiatry")) {
															%>
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
															<option value="Psychiatry" selected>Psychiatry</option>
															<option value="Radiation oncology">Radiation
																oncology</option>
															<option value="Surgery">Surgery</option>
															<option value="Urology">Urology</option>
															<%
															} else if (rs.getString(10).equals("Radiation oncology")) {
															%>
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
															<option value="Radiation oncology" selected>Radiation
																oncology</option>
															<option value="Surgery">Surgery</option>
															<option value="Urology">Urology</option>
															<%
															} else if (rs.getString(10).equals("Surgery")) {
															%>
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
															<option value="Surgery" selected>Surgery</option>
															<option value="Urology">Urology</option>
															<%
															} else if (rs.getString(10).equals("Urology")) {
															%>
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
															<option value="Urology" selected>Urology</option>
															<%
															}
															Boolean Monday = false;
															Boolean Tuesday = false;
															Boolean Wednesday = false;
															Boolean Thursday = false;
															Boolean Friday = false;
															Boolean Saturday = false;
															String[] arrOfStr = rs.getString(11).split("-");
															for (String s : arrOfStr) {
															System.out.println(s);
															if (s.equals("Monday")) {
																Monday = true;
															}
															if (s.equals("Tuesday")) {
																Tuesday = true;
															}
															if (s.equals("Wednesday")) {
																Wednesday = true;
															}
															if (s.equals("Thursday")) {
																Thursday = true;
															}
															if (s.equals("Friday")) {
																Friday = true;
															}
															if (s.equals("Saturday")) {
																Saturday = true;
															}

															}
															%>

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
															name="workingDays" value="Monday"
															<%=(Monday == true ? "checked" : "")%>> Monday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">

												<div class="form-group">

													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Tuesday"
															<%=(Tuesday == true ? "checked" : "")%>> Tuesday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">

												<div class="form-group">

													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Wednesday"
															<%=(Wednesday == true ? "checked" : "")%>>
															Wednesday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Thursday"
															<%=(Thursday == true ? "checked" : "")%>>
															Thursday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Friday"
															<%=(Friday == true ? "checked" : "")%>> Friday
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingDays" value="Saturday"
															<%=(Saturday == true ? "checked" : "")%>>
															Saturday
														</label>
													</div>
												</div>
											</div>
										</div>

										<%
										Boolean val8 = false;
										Boolean val9 = false;
										Boolean val10 = false;
										Boolean val11 = false;
										Boolean val12 = false;
										Boolean val13 = false;
										Boolean val14 = false;
										Boolean val15 = false;
										Boolean val16 = false;
										Boolean val17 = false;
										Boolean val18 = false;
										Boolean val19 = false;
										String[] arrOfStr2 = rs.getString(12).split("-");
										for (String s : arrOfStr2) {
											System.out.println(s);
											if (s.equals("8")) {
												val8 = true;
											}
											if (s.equals("9")) {
												val9 = true;
											}
											if (s.equals("10")) {
												val10 = true;
											}
											if (s.equals("11")) {
												val11 = true;
											}
											if (s.equals("12")) {
												val12 = true;
											}
											if (s.equals("13")) {
												val13 = true;
											}
											if (s.equals("14")) {
												val14 = true;
											}
											if (s.equals("15")) {
												val15 = true;
											}
											if (s.equals("16")) {
												val16 = true;
											}
											if (s.equals("17")) {
												val17 = true;
											}
											if (s.equals("18")) {
												val18 = true;
											}
											if (s.equals("19")) {
												val19 = true;
											}

										}
										%>
										<div class="row">
											<label class=" col-form-label">Working Hours</label>

											<div class="col-md-1">

												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="8"
															<%=(val8 == true ? "checked" : "")%>> 8
														</label>
													</div>
												</div>

											</div>
											<div class="col-md-1">

												<div class="form-group">

													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="9"
															<%=(val9 == true ? "checked" : "")%>> 9
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">

												<div class="form-group">

													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="10"
															<%=(val10 == true ? "checked" : "")%>> 10
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="11"
															<%=(val11 == true ? "checked" : "")%>> 11
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="12"
															<%=(val12 == true ? "checked" : "")%>> 12
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="13"
															<%=(val13 == true ? "checked" : "")%>> 13
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="14"
															<%=(val14 == true ? "checked" : "")%>> 14
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="15"
															<%=(val15 == true ? "checked" : "")%>> 15
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="16"
															<%=(val16 == true ? "checked" : "")%>> 16
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="17"
															<%=(val17 == true ? "checked" : "")%>> 17
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="18"
															<%=(val18 == true ? "checked" : "")%>> 18
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group">
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"
															name="workingHours" value="19"
															<%=(val19 == true ? "checked" : "")%>> 19
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
												name="submit" value="Update Doctor">
											</button>
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
			text : "You have updated the doctor successfully!",
			icon : "success",
			button : "Okay!",
		}).then(function() {
			window.location.replace("/telemedicine/editDoctor");
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
			window.location.replace("/telemedicine/editDoctor");
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
			window.location.replace("/telemedicine/editDoctor");
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
			window.location.replace("/telemedicine/editDoctor");
		});
	</script>
	<%
	}
	%>

	<!-- End custom js for this page -->
</body>
</html>
