<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import='java.sql.*'%>
<%@ page import='java.io.*'%>
<%@ page import='db.*'%>
<%@ page import='java.util.*'%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS 
<link rel='stylesheet' href='css/bootstrap.min.css'>-->
<link rel="stylesheet" href="css/style.css" />
<link rel='icon' href='images/favicon.png' />

<title>DashBoard</title>
</head>
<body>
			<%session = request.getSession();
			String email = (String)session.getAttribute("email");%>
<% 

			String userId = request.getParameter("userId");
			if(userId == null)
				userId = request.getSession().getAttribute("userId").toString();
						
			PreparedStatement ps = InitDB.getConnection().prepareStatement("SELECT * FROM user WHERE userId = ?");
			ps.setString(1, userId);
			
			ResultSet rs = ps.executeQuery();
			String name = "", image="", city="", contact="";
			while(rs.next()){
				name = rs.getString("name");
				image = rs.getString("image");
				city = rs.getString("city");
				contact = rs.getString("contact");
			}
			%>
			
	<div class="card w-50">
		<div class="row m-5 p-5">
				<div class="col-sm">
					<img src="images/profile.jpg" style="width: 150px;">
				</div>
				
				<div class="col">
					<h2><%= name %></h2>
					<h3><%= email %></h3>
					<h3><%= city %></h3>
					<h3><%= contact %></h3>
				</div>
				
		</div>
	</div>
	
	
<script type="text/javascript" src="js/dashboard.js"></script>
	<!-- Optional JavaScript -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/popper.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>


