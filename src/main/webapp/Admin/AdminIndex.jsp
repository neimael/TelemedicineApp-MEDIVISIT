<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="DAO.DoctorDao"%>
<%@page import="DAO.PatientDao"%>
<%@page import="DAO.AppointmentDao"%>
<!DOCTYPE html>
<html lang="en">
<head>
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

	<%
	if (session.getAttribute("EmailAdmin") == null) {
		response.sendRedirect("/telemedicine/AdminLoginPage");
	}

	int patientCount = PatientDao.count();
	int doctorCount = DoctorDao.count();
	int appoinmentCount = AppointmentDao.count();
	int pending = AppointmentDao.countStatus("Pending");
	int accepted = AppointmentDao.countStatus("Accepted");
	int cancelled = AppointmentDao.countStatus("Cancelled");
	int denied = AppointmentDao.countStatus("Denied");
	int finished = AppointmentDao.countStatus("Finished");
	
	int[] counts = AppointmentDao.lineChart();
	
	%>
	<div class="container-scroller">

		<!-- partial:partials/_navbar.html -->
		<jsp:include page="Header.jsp" />
		<!-- partial -->
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="page-header">
					<h3 class="page-title">
						<span class="page-title-icon bg-gradient-primary text-white me-2">
							<i class="mdi mdi-home"></i>
						</span> Dashboard
					</h3>
					<nav aria-label="breadcrumb">
						<ul class="breadcrumb">
							<li class="breadcrumb-item active" aria-current="page"><span></span>Overview
								<i
								class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
							</li>
						</ul>
					</nav>
				</div>
				<div class="row">
					<div class="col-md-4 stretch-card grid-margin">
						<div class="card bg-gradient-danger card-img-holder text-white">
							<div class="card-body">
								<img src="assets/Admin/images/dashboard/circle.svg"
									class="card-img-absolute" alt="circle-image" />
								<h4 class="font-weight-normal mb-3">
									Patients <i
										class="mdi mdi-heart menu-icon mdi-24px float-right"></i>
								</h4>
								<h2 class="mb-5"><%=patientCount%></h2>
								<h6 class="card-text"></h6>
							</div>
						</div>
					</div>
					<div class="col-md-4 stretch-card grid-margin">
						<div class="card bg-gradient-info card-img-holder text-white">
							<div class="card-body">
								<img src="assets/Admin/images/dashboard/circle.svg"
									class="card-img-absolute" alt="circle-image" />
								<h4 class="font-weight-normal mb-3">
									Doctors <i
										class="mdi mdi-stethoscope menu-icon mdi-24px float-right"></i>
								</h4>
								<h2 class="mb-5"><%=doctorCount%></h2>
								<h6 class="card-text"></h6>
							</div>
						</div>
					</div>
					<div class="col-md-4 stretch-card grid-margin">
						<div class="card bg-gradient-success card-img-holder text-white">
							<div class="card-body">
								<img src="assets/Admin/images/dashboard/circle.svg"
									class="card-img-absolute" alt="circle-image" />
								<h4 class="font-weight-normal mb-3">
									Appointments <i
										class="mdi mdi-book-open-page-variant mdi-24px float-right"></i>
								</h4>
								<h2 class="mb-5"><%=appoinmentCount%></h2>
								<h6 class="card-text"></h6>
							</div>
						</div>
					</div>
				</div>
				<div class="row">


					<div class="col-lg-7 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Appointments last week</h4>
								<canvas id="lineChart" style="height: 250px"></canvas>
							</div>
						</div>
					</div>

					<div class="col-lg-5 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Appointments Status</h4>
								<canvas id="pieChart" style="height: 250px"></canvas>
							</div>
						</div>
					</div>
				</div>



			</div>
			<!-- content-wrapper ends -->
			<!-- partial:partials/_footer.html -->
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
	<!-- End custom js for this page -->


	<script>
var ctx = document.getElementById('lineChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
        datasets: [{
        	label: 'Number Of Appointments evry day',
            data: [<%= counts[6]%>, <%= counts[5]%>, <%= counts[4]%>, <%= counts[3]%>, <%= counts[2]%>, <%= counts[1]%>, <%= counts[0]%>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.6)',
                'rgba(54, 162, 235, 0.6)',
                'rgba(255, 206, 86, 0.6)',
                'rgba(75, 192, 192, 0.6)',
                'rgba(153, 102, 255, 0.6)',
                'rgba(255, 159, 64, 0.6)',
                'rgba(0, 136, 12, 0.6)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(0, 136, 12, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>


	<script>
	new Chart(document.getElementById("pieChart"), {
	    type: 'pie',
	    data: {
	      labels: ["Pending", "Accepted", "Cancelled", "Finished", "Denied",],
	      datasets: [{
	        label: "Population (millions)",
	        backgroundColor: ["#3e95cd", "green", "#eed202","#3cba9f","red"],
	        data: [<%=pending%>, <%=accepted%>,<%=cancelled%>, <%=finished%>, <%=denied%>]
	      }]
	    },
	    options: {
	      title: {
	        display: false,
	        text: 'Predicted world population (millions) in 2050'
	      }
	    }
	});
  </script>


</body>
</html>
