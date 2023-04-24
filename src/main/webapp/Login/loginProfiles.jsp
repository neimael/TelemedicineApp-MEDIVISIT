<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Registration</title>
     <link href="../assets/img/flavicon.png" rel="icon">
    
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet' type='text/css' media='screen' href='../assets/Login/css/style.css'>
    <script src='../assets/Login/main.js'></script>
</head>

<body>
    <nav class="navbar navbar-light bg-light justify-content-between">
    <a href="../index.jsp" aria-label="MediVisit">
        <img src="../assets/Login/images/logo.png" alt="logo" style="height: 80px;"></a>
        <div class="signin-btn m-2 col-1 text-md-center">
            <a href="PatientRegister.jsp" class="signin-btn btn btn-primary w-100 ">Sign Up</a></div>
    </nav>


    <div class="container d-flex flex-wrap" style="background-color: #1977cc;">

        <div class="card mx-auto m-2" style="width:350px">
            <div class="card-img-top h-100 display-flex-center">
                <img class="h-75 rounded-circle" src="../assets/Login/images/patient.png" alt="Card image">
            </div>

            <div class="card-body">
                <h4 class="card-title text-center">I am Patient</h4>
                <p class="card-text text-center">Register as a patient, and start enjoying our platform</p>
                <a href="PatientLogin.jsp" class="btn btn-primary w-100">Sign In</a>
            </div>
        </div>
        <br>

        <div id="card1" class="card mx-auto m-2" style="width:350px;">
            <div class="card-img-top h-100 display-flex-center">
                <img src="../assets/Login/images/doctor.png" class="h-75 rounded-circle" alt="Image"></div>
            <div class="card-body ">
                <h4 class="card-title text-center">I am Healthcare Professional</h4>
                <p class="card-text text-center">Request information about our digital health platform.</p>
                <a href="<%= request.getContextPath() %>/Login/DoctorLogin.jsp" class="btn btn-primary w-100 mt-1">Sign In</a>
            </div>
        </div>
    </div>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>