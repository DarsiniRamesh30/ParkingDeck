<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import='java.sql.*'%>
<%@ page import='java.io.*'%>
<%@ page import='java.util.*'%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="css/style.css" />
<link rel='icon' href='images/favicon.png' />


<body>
     <div class="navbar">
 
  <a href="dashboard.jsp">Dashboard</a>
  <a href="rentmyspace.jsp">Rent my space</a>
  <a href="parkmyvehicle.jsp">Park my vehicle</a>
			<%session = request.getSession();
			String email = (String)session.getAttribute("email");%>
		<div class="dropdown">	
    <button class="dropbtn"><%out.println(email); %> 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="profile.jsp">Profile</a>
      <a href="Logout">Logout</a>
    </div>
    </div>
  </div>

	<a class="badge badge-primary" href="addcar.jsp" style="margin: 10px;  font-family: Arial, Helvetica, sans-serif;">Click
		here to add new car</a>

	<div class='container align-items-center' style="">
		<div class='row'>
			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingapp1?useSSL=false","root","Darsini@3003");
			Cookie[] cookies = request.getCookies();
			Cookie cookie = null;
			String userId = null;
			
			if( cookies != null ) {
				for (int i = 0; i < cookies.length; i++) {
					cookie = cookies[i];
					if(cookie.getName().equals("userId")) {
						userId = cookie.getValue();
					}
				}
			} 
			try {
				if(userId != null) {
					PreparedStatement statement = con.prepareStatement("SELECT * from car where userId = ?");
					statement.setString(1, userId);


					ResultSet rs = statement.executeQuery();
					while (rs.next()) {
						out.println(
								"<div class='shadow card h-100' style='width: 20rem; margin: 10px;'><img src=");
						out.println("'GetCarImage?carId=" + rs.getString("carId") + "'" + " class='card-img-top' style='height : 212px;' alt='...'><div class='card-body'><h5 class='card-title'> ");
						out.println(rs.getString("name"));
						out.println("</h5><p class='text-primary'>Number Plate :- " + rs.getString("numberPlate") + "</p>");
						out.println("</div></div>");
					}
				}
				
			}catch (SQLException e) {
				e.printStackTrace();
			}finally{
				con.close();
			}
			%>
		</div>
	</div>

	<script type="text/javascript" src="js/dashboard.js"></script>
</body>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: right;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: #333;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: hotpink;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</html>