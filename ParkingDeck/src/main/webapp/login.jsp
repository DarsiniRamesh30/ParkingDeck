<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>-->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel='icon' href='images/favicon.png' />

<title>Welcome to ParkingDeck</title>
</head>
<body>
 <div class="navbar" style="font-family:TimesNewRoman;">
   <a href="index.jsp">ParkingDeck</a>
</div>
	<div class="container"style="padding-top:150px">
		<div id="loginbox"style="width:30%;border-radius:10px;border-color:black;background-color:#f2f2f2;padding-top:20px;margin:auto;text-align:center;font-family:TimesNewRoman">Sign In
					<form id="loginform"
						action="Login" method="POST">
                  <div style=" padding-top: 15px;">
						 <input id="login-username"
								type="text"name="email"
								placeholder="Email" required>
							</div>
					<div style="padding-top: 15px;">
				            <input id="login-password"
								type="text" name="password"
								placeholder="Password" required>
					</div>
					<div style=" padding-top: 15px;padding-bottom:10px">
								<button id="btn-signin" type="submit" class="btn btn-info">
									<i class="icon-hand-right"></i> Login
								</button>
								</div>
								<div
									style="border-top: 3px solid #888; padding-top: 15px;padding-bottom:5px; font-size: 85%">
									Don't have an account! <a href="#"
										onClick="$('#loginbox').hide(); $('#signupbox').show()">
										Sign Up Here </a>
								</div>
							<div id="content">
								<%
									if (application.getAttribute("messages") != null) {
								%>
								<%=application.getAttribute("messages")%>
								<%
									application.removeAttribute("messages");
									}
								%>
							</div>
					</form>
	        </div>
	        </div>
		<div id="signupbox"style="display: none; margin-top: 50px;width:30%;border-radius:10px;border-color:black;background-color:#f2f2f2;padding-top:20px;margin:auto;text-align:center;font-family:TimesNewRoman">
			<div class="panel panel-info">
				
					<div >Sign Up</div>
					<form id="signupform" class="form-horizontal" role="form"
						action="Register" method="POST" enctype="multipart/form-data">

						<div id="signupalert" style="display: none"
							class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>

						<div style="padding-top: 15px;" >
							<label for="name" >Name</label>
								<input type="text" name="name"
									placeholder="Name" required>
						</div>

						<div style="padding-top: 15px;"  >
							<label for="contact" >Contact</label>
								<input type="text"  name="contact"
									placeholder="Contact" required>
						</div>

						<div style="padding-top: 15px;" >
							<label for="city" >City</label>
							
								<input type="text" name="city"
									placeholder="City" required>
							
						</div>

						<div style="padding-top: 15px;" >
							<label for="email" >Email</label>
								<input type="text" class="form-control" name="email"
									placeholder="Email Address" required>
							
						</div>

						<div style="padding-top: 15px;" >
							<label for="password" >Password</label>
							
								<input type="text" name="password"
									placeholder="Password" required>
						</div>

						<div style="padding-top:15px;padding-left:100px" >
							<label for="file">Profile
								Image</label>
						
								<input type="file" name="file"
									placeholder="Image" required>
						</div>

						<div style="padding-top: 15px;padding-bottom:10px" >
							<!-- Button -->
		
								<button id="btn-signup" type="submit" style="background:white">
									 Register
								</button>
						</div>

						<div>
						
								<div
									style="border-top: 3px solid #888; padding-top: 15px;padding-bottom:5px; font-size: 85%">
									Already have an account! <a href="#"
										onClick="$('#signupbox').hide(); $('#loginbox').show()">
										Sign In Here </a>
								</div>
						</div>
					</form>
				
			</div>
		</div>
	

</body>
<style>
<style>
input[type=file], select {
  width: 100%;
  padding: 12px 10px;
  margin: 6px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  background:white;
  box-sizing: border-box;
}
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: black;
}

.navbar a {
  float: left;
  font-size: 25px;
  color: white;
  text-align: right;
  padding: 14px 10px;
  text-decoration: none;
}
.navbar a:hover, .dropdown:hover .dropbtn {
  background-color:black;
}</style>
</html>