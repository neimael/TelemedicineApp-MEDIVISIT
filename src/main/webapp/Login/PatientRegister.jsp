<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Patient Sign up</title>
<link href="../assets/img/flavicon.png" rel="icon">


<!-- Font Icon -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/assets/Login/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet"
	href="<%= request.getContextPath()%>/assets/Login/css/style.css">
</head>

<body>

	<input type="hidden" id="status"
		value="<%= request.getAttribute("status") %>" />

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>

						<form method="post"
							action="<%= request.getContextPath() %>/PatientRegister"
							class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"></label> <input
									type="text" name="firstName" id="name" placeholder="First Name"
									required />
							</div>
							<div class="form-group">
								<label for="name"></label> <input
									type="text" name="lastName" id="name" placeholder="Last Name"
									required />
							</div>
							<div class="form-group">
								<label for="name"></label>
								<div class="col-sm-9">
									<input type="date" class="form-control"
										placeholder="dd/mm/yyyy" name="BirthDay" required="required" />
								</div>
							</div>

							<div class="form-group">
								<label for="email"></label> <input
									type="email" name="email" id="email" placeholder="Your Email"
									required />
							</div>
							<div class="form-group">
								<label for="contact"></label> <input
									type="text" name="phoneNumber" id="contact"
									placeholder="Phone Number" required />
							</div>
							<div class="form-group" style="border-bottom: 1px solid;">
								<label for="name"></label>
								<div class="col-md-9">
									<select class="form-control" name="sex"
										style="width: 300px; height: 30px; margin-left: 20px; padding-left: 10px; border: none;">
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="social"></label> <input
									type="text" name="socialAccount" id="socia"
									placeholder="Social Account" required />
							</div>
							<div class="form-group">
								<label for="adress"></label> <input
									type="text" name="address" id="adress" placeholder="Your Adress"
									required />
							</div>

							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">

								<input type="submit" name="signup" id="signup"
									class="form-submit"
									value="Register" />
								<p id="passwordnote" style="color: red;"></p>
							</div>
						</form>
					</div>
					<div class="signup-image" style="padding-top: 100px">
						<a href="<%= request.getContextPath() %>/index.jsp"
							aria-label="MediVisit"><figure>
								<img
									src="<%= request.getContextPath() %>/assets/Login/images/1.png"
									alt="sing up image">
							</figure></a> <a
							href="<%= request.getContextPath() %>/Login/loginProfiles.jsp"
							class="signup-image-link">I am already member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
    	var status = document.getElementById("status").value;
    	if(status=="success"){
    		swal("Congrats","Account Created Successfully","success").then(function() {
    			window.location.replace("/telemedicine/Login/PatientLogin.jsp");
    		});;
    	}
    	
    	passwordnote = document.getElementById("passwordnote");
    	function checkPasswords() {
    		   // Get the password and confirm password elements
        	var password = document.getElementById("pass");
            var confirmPassword = document.getElementById("re_pass");

            // Get the submit button element
            var submitButton = document.getElementById("signup");


            // Check if the password and confirm password values are equal
            if (password.value !== confirmPassword.value) {
                submitButton.disabled = true;
                passwordnote.innerHTML = "Passwords are different";
            } else {
                submitButton.disabled = false;
                passwordnote.innerHTML = "";
            }
        }
    </script>



</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>