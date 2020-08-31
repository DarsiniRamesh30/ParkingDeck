<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name='viewport'
	content='width=device-width, initial-scale=1, shrink-to-fit=no'>

<!-- Bootstrap CSS 
<link rel='stylesheet' href='css/bootstrap.min.css'>-->
<link rel='stylesheet' href='css/style.css' />
<link rel='icon' href='images/favicon.png' />

<title>Welcome to ParkingDeck</title>
</head>
<body>

	<div style=width:50%;border-radius:5px;background-color:#f2f2f2;padding:20px;margin:auto>
		<form method="POST" action="AddCar" enctype="multipart/form-data" >
			<p align="center">Fill in the details</p>
			<%
				if (application.getAttribute("addcars") != null) {
			%>
			<%=application.getAttribute("addcars")%>
			<%
				application.removeAttribute("addcars");
				}
			%>
				<label for="inputName">Car Name</label> <input type="text"
					class="form-control" name="inputName" required>
				<label for="inputPlate">Number Plate</label> <input type="text"
					class="form-control" name="inputPlate" required>
					<input type="file" class="custom-file-input" id="image"
						name="image"> <label class="custom-file-label" for="image">Upload
						an image of your space</label>
					<div style=position:fixed;top:50%;left:45%>
				<button type="submit" >Submit
					My Details</button>
					</div>	
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
</body>
<style>
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
  padding: 20px 20px;
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