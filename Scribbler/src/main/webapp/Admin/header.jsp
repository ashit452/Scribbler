<%-- <%@include file="sessioncheck.jsp" %> --%>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Scribbler Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="css/materialdesignicons.min.css">
  <link rel="stylesheet" href="css/vendor.bundle.base.css">
  <link rel="stylesheet" href="css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon"  href="images/titlelogo.png" />
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="index.jsp"><img style="height: 60px; width: 150px;" src="images/logo.png" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.jsp"><img style="height: 35px; width: 40px;" src="images/titlelogo.png" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end justify-content-lg-start">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="mdi mdi-menu"></span>
        </button>

        <ul class="navbar-nav navbar-nav-right">

          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
            <%
				if(session.getAttribute("usernameadmin")==null || session.getAttribute("usernameadmin")==""){
						    	response.sendRedirect("../login.jsp");
				   }else{	
				%>
              <span class="nav-profile-name"><%= session.getAttribute("usernameadmin").toString().toUpperCase() %></span>
              <%} %>
            
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">

              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="logout.jsp">
                <i class="mdi mdi-logout text-primary"></i>
                Logout
              </a>
            </div>

          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>