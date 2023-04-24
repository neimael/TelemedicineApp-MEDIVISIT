<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="google-signin-client_id" content="840006888368-fp7v9mde1sgjl0mn2p84tdvmkiksehqq.apps.googleusercontent.com">
<title>Patient</title>
 <link href="../assets/img/flavicon.png" rel="icon">


<!-- Font Icon -->
<link rel="stylesheet"
	href="../assets/Login/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="../assets/Login/css/style.css">

<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="840006888368-fp7v9mde1sgjl0mn2p84tdvmkiksehqq.apps.googleusercontent.com">
</head>
<body>

	<input type="hidden" id="status" value="<%=request.getParameter("status") %>" />

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<a href="../index.jsp" aria-label="MediVisit"><figure>
							<img src="../assets/Login/images/1.png" alt="sing up image">
						</figure></a>
						<a href="PatientRegister.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign In</h2>
						<form method="post" action="<%= request.getContextPath() %>/login" class="register-form"
							id="login-form">
							<input type="hidden" name="profil" value="patient" >
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Username" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><div class="g-signin2" data-onsuccess="onSignIn"></div></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

	<script type="text/javascript">
    var status = document.getElementById("status").value;
	if(status=="failed"){
		swal("Failed","Informations are incorrect !","error");
	}
	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>