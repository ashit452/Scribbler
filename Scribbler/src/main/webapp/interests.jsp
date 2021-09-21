<!doctype html>
<%@include file="sessioncheck.jsp" %> 
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dbhelper"%>
<html lang="en">
  <head>
  	<title>Scribbler</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/css/select2.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="css for interest/style.css">
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link rel="icon" href="favicon.ico" type="image/x-icon">
	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-7 text-center mb-5">
					<h2 class="heading-section">Select Your Interests</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-4 d-flex justify-content-center align-items-center">
				<form action="addmyinterest" method="post">
				<div >	
				
				
				<select id="myinterest" name="myinterest" class="js-select2"   multiple="multiple">
						<%
						 
	                      	Dbhelper db=new Dbhelper();
	                      	db.connectwithdb();
	                      	ResultSet rs=db.execquery("select * from category");
	                      	
	                      	while(rs.next()){
	                      %>
						
						<option value="<%=rs.getString("Category").toString() %>" data-badge=""><%=rs.getString("Category").toString() %></option>
						<%
							
	                      	}
						%>
						
					</select>
					</div>
					<div >
					
					<input style="margin-left: 250px" onclick="getmy()" class="btn btn-dark btn-outline-dark btn-lg" type="submit" name="submit" value="Submit" id="submitintrest">
					</div>
				</form>
				</div>
			</div>
		</div>
	</section>

<script src="js for interest/jquery.min.js"></script>
  <script src="js for interest/popper.js"></script>
  <script src="js for interest/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/js/select2.min.js"></script>
  <script src="js for interest/main.js"></script>

	</body>
</html>

