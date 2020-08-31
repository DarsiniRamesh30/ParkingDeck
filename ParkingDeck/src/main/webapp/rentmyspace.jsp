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
<link rel='stylesheet' href='css/bootstrap.min.css'>-->
<link rel="stylesheet" href="css/style.css" />
<link rel='icon' href='images/favicon.png' />

<title>Welcome to ParkingDeck</title>
</head>
<body>
      <div style=width:50%;border-radius:5px;background-color:#f2f2f2;padding:20px;margin:auto>
		<form method="POST" action="AddParking" enctype="multipart/form-data">
			<p class="text-uppercase text-center">Fill in the details</p>
			<%
				if (application.getAttribute("rent") != null) {
			%>
			<%=application.getAttribute("rent")%>
			<%
				application.removeAttribute("rent");
				}
			%>
				<label for="inputEmail">Owner Full Name</label>
				 <input type="text"name="inputName" required>
			     <label for="inputEmail">Owner Email</label> 
			     <input type="text"	name="inputEmail" required>
				<label for="inputContact">Owner Contact</label>
				 <input type="text" name="inputContact" required>
					<label for="inputSpots">Number of spots</label> <input
						type="text"name="inputSpots" required>
					<label for="inputFare">Fare (in Rs. for 1 hour)</label> <input
						type="text" name="inputFare" required>
	
				<label for="inputPlaceName">Place Name</label> <input type="text"
					name="inputPlaceName"
					placeholder="Shopping Mall" required>
				<label for="inputAddress">Address Line 1</label> <input type="text"
					 name="inputAddress" placeholder="1234 Main St"
					required>
				<label for="inputAddress2">Address Line 2</label> <input type="text"
					 name="inputAddress2"
					placeholder="Apartment, studio, or floor">
	
					<label for="inputCity">City</label> <input type="text"
						 name="inputCity" required>
					<label for="inputState">State</label> <input type="text"
						name="inputState" required>
					<label for="inputZip">Zip</label> <input type="text"
						name="inputZip" required>
					<input type="file" id="image"
						name="image"> <label  for="image">Upload
						an image of your space</label>
			<button type="submit">Submit
				My Details</button>
		</form>
	</div>

	<script type="text/javascript">
		document
				.getElementById("image")
				.addEventListener(
						"change",
						function(e) {
							document.querySelector("[for=" + e.target.id + "]").innerHTML = e.target.files[0].name;
						})
	</script>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

</style>
</html>