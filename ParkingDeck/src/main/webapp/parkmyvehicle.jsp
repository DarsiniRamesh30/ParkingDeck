<%@ page language='java' contentType='text/html; charset=ISO-8859-1'
	pageEncoding='ISO-8859-1'%>
<%@ page import='java.sql.*'%>
<%@ page import='java.io.*'%>
<%@ page import='java.util.*'%>
<!doctype html>
<html lang='en'>
<head>
<!-- Required meta tags -->
<meta charset='utf-8'>
<meta name='viewport'
	content='width=device-width, initial-scale=1, shrink-to-fit=no'>

<!-- Bootstrap CSS 
<link rel='stylesheet' href='css/bootstrap.min.css'>-->
<link rel='stylesheet' href='css/style.css' />
<script src='js/location.js'></script>
<link rel='icon' href='images/favicon.png' />

<title>Welcome to ParkingDeck</title>
</head>
<body>
	<div class="navbar">
   <a href="index.jsp">Park Me</a>
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
	<!--  Search bar -->
	<div  style=width:50%;border-radius:5px;background-color:#f2f2f2;padding:40px;margin:auto>
		<form action='Search' method='POST'>
					<input type='text' placeholder='Pincode' class='form-control'
						id='inputPincode' name='inputPincode' required>
					<input type='text' placeholder='City Name' class='form-control'
						id='inputCity' name='inputCity' required>
					<button type='submit' class='btn btn-primary btn-block'>Search</button>
		</form>
	</div>

	<div class='container align-items-center'>
		<div class='row'>
			<%
				if (application.getAttribute("city") != null) {
					String city = (String) application.getAttribute("city");
					String pincode = (String) application.getAttribute("pincode");
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingapp1?useSSL=false","root","Darsini@3003");
					
					String sql = "SELECT DISTINCT p.parkingId, p.placeName, p.ownerName, p.userId, p.cityId,"
							+ " p.spots, p.fare, p.contact, p.image FROM"
							+ " parking AS p INNER JOIN city AS c ON  p.cityId ="
							+ " (SELECT cityId FROM city WHERE city LIKE '%" + city + "%' AND pincode = " + pincode + " LIMIT 1)";
					PreparedStatement statement = con.prepareStatement(sql);

					ResultSet rs = statement.executeQuery();
					

					while (rs.next()) {
						out.println("<div class='shadow card h-100' style='width: 20rem; margin: 10px;'><img src=");
						out.println("'GetImage?parkingId=" + rs.getString("parkingId") + "'"
								+ " class='card-img-top' style='height : 212px;' alt='...'><div class='card-body'><h5 class='card-title'> ");
						out.println(rs.getString("placeName") + "</h5>");
						out.println("<p class='text-primary'>Owner Name :- " + rs.getString("ownerName"));
						out.println("<br>Number of Spots :- " + rs.getString("spots"));
						out.println("<br>Fare :- " + rs.getString("fare") + "Rs");
						out.println("<br>Contact :- " + rs.getString("contact") + "</p>");
						out.println("<a href='SelectCar?parkingId=" + rs.getString("parkingId")
								+ "' class='btn btn-primary'>Book</a></div></div>");
					}
				} else {
					out.println("<p text-primary> No Records Found </p>");
				}
			%>
		</div>
	</div>

	<script type="text/javascript" src="js/dashboard.js"></script>
	<!-- Optional JavaScript -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/popper.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

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
input[type=text], select {
  width: 100%;
  padding: 12px 10px;
  margin: 6px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 20px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
  
input[type=submit]:hover {
  background-color: #45a049;
}</style>
</html>