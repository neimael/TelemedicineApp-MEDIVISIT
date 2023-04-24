<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


      
      
      
      
      
      
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="adminDashboard"><img src="assets/Admin/images/logo.svg" alt="logo" /></a>
          <a class="navbar-brand brand-logo-mini" href="adminDashboard"><img src="assets/Admin/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" action="#">
              <div class="input-group">
                <div class="input-group-prepend bg-transparent">
                  <i class="input-group-text border-0 mdi mdi-magnify"></i>
                </div>
                <input type="text" id="search" name="search" class="form-control bg-transparent border-0" placeholder="Search ...">
              </div>
            </form>
          </div>
          <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile ">
              <a class="nav-link"  href="AdminShowProfile" >
                <div class="nav-profile-img">
                  <img src="assets/Admin/images/faces/face1.jpg" alt="image">
                  <span class="availability-status online"></span>
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black"><%=session.getAttribute("Last_NameAdmin") + " " +  session.getAttribute("First_NameAdmin")%></p>
                </div>
              </a>
              
            </li>
            <li class="nav-item d-none d-lg-block full-screen-link">
              <a class="nav-link">
                <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
              </a>
            </li>
            
            
            
            <li class="nav-item nav-settings d-none d-lg-block">
              <a class="nav-link" href="#">
                <i class="mdi mdi-format-line-spacing"></i>
              </a>
            </li>
            
            <li class="nav-item nav-logout d-none d-lg-block">
              <a class="nav-link" href="AdminLogout">
                <i class="mdi mdi-power"></i>
              </a>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="assets/Admin/images/faces/face1.jpg" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2"><%=session.getAttribute("Last_NameAdmin") + " " +  session.getAttribute("First_NameAdmin")%></span>
                  <span class="text-secondary text-small">Admin</span>
                </div>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="adminDashboard">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-appointments" aria-expanded="false" aria-controls="ui-appointments">
                <span class="menu-title">Appointments</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-book-open-page-variant menu-icon"></i>
              </a>
              <div class="collapse" id="ui-appointments">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="AllAppointments">All Appointments</a></li>
                  <li class="nav-item"> <a class="nav-link" href="AddAppointment">Add</a></li>
                  <li class="nav-item"> <a class="nav-link" href="TrashAppointment">Trash</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-doctors" aria-expanded="false" aria-controls="ui-doctors">
                <span class="menu-title">Doctors</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-stethoscope menu-icon"></i>
              </a>
              <div class="collapse" id="ui-doctors">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="AllDoctors">All Doctors</a></li>
                  <li class="nav-item"> <a class="nav-link" href="addDoctor">Add</a></li>
                  <li class="nav-item"> <a class="nav-link" href="TrachDoctor">Trash</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-patients" aria-expanded="false" aria-controls="ui-patients">
                <span class="menu-title">Patients</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-heart menu-icon"></i>
              </a>
              <div class="collapse" id="ui-patients">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="AllPatients">All Patients</a></li>
                  <li class="nav-item"> <a class="nav-link" href="addPatient">Add</a></li>
                  <li class="nav-item"> <a class="nav-link" href="TrachPatient">Trash</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-profile" aria-expanded="false" aria-controls="ui-profile">
                <span class="menu-title">Profile</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-account-circle menu-icon"></i>
              </a>
              <div class="collapse" id="ui-profile">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="AdminShowProfile">Show Profile</a></li>
                  <li class="nav-item"> <a class="nav-link" href="AdminChangePassword">Change Password</a></li>
                </ul>
              </div>
            </li>
            
            
            
          </ul>
        </nav>