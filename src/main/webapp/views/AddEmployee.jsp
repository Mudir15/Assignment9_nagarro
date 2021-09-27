<!-- AddEmployee page -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Add Employee</title>
</head>
<script>
	function validateName() {
		var str = document.getElementById("name").value;
		if (str.length > 100) {
			alert("Max 100 characters allowed");
			document.getElementById("name").value = "";
			return false;
		}
		return true;
	}
	function validateLocation() {
		var str = document.getElementById("location").value;
		if (str.length > 500) {
			alert("Max 500 characters allowed");
			document.getElementById("location").value = "";
			return false;
		}
		return true;
	}
	function validateName() {
		var str = document.getElementById("email").value;
		if (str.length > 100) {
			alert("Max 100 characters allowed");
			document.getElementById("email").value = "";
			return false;
		}
		return true;
	}
</script>
<style>
@charset "ISO-8859-1";

table {
	border-collapse: separate;
	border-spacing: 0 15px;
}

header {
	color: black;
	padding: 1px;
	background-image: linear-gradient(#b2b2fc, #fbfbe3);
	height: 90px;
}

footer {
	color: black;
	text-align: center;
	height: auto;
	position: fixed;
	width: 98%;
	background-image: linear-gradient(#b2b2fc, #fbfbe3);
}

fieldset {
	margin-left: 30%;
	margin-right: 30%
}

legend {
	color: blue;
}

.required {
	color: red;
}

.btn1 {
	float: left;
	margin: 2px;
	border-radius: 2px;
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid black;
}

.t1 td:first-child {
	padding-right: 50px;
}

body {
	background-color: #f5f8fb;
	color: black;
}

label {
	font-size: 70%;
}
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-12 col-md-12 col-sm-12 col-12">
				<header>
					<h2 style="margin-left: 10px;">Add Employee Details</h2>
					<h3 style="text-align: right; margin-right: 10px;">
						Welcome ${sessionn}! &nbsp <a href="Logout"><i
							class="fa fa-close" style="font-size: 30px; color: red"></i></a>
					</h3>
				</header>

				<br>
				<form action="AddEmployee" method="post" style="margin-top: 5px;">
					<fieldset>
						<legend>Add Employee details</legend>
						<table class="t1">
							<tr>
								<td><label>Employee Code:</label></td>
								<td><input type="text" name="EmployeeCode" id="code"
									size="40" required></td>
							</tr>
							<tr>
								<td><label>Employee Name:</label></td>
								<td><input type="text" name="EmployeeName" id="name"
									size="40" required onchange="return validateName()"></td>
							</tr>
							<tr>
								<td><label>Location:</label></td>
								<td><textarea name="Location" id="location" rows="2"
										cols="38.5" required onchange="return validateLocation()"></textarea></td>
							</tr>
							<tr>
								<td><label>Email:</label></td>
								<td><input type="email" name="Email" id="email" size="40"
									required onchange="return validateEmail()"></td>
							</tr>
							<tr>
								<td><label>Date of Birth:</label></td>
								<td><input type="date" name="DateOfBirth" id="dob"
									size="40" required></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><input type="submit" value="Add" class="btn1">
								<td><a href="ListEmployee"><button type="button"
											class="btn btn-primary">Cancel</button></a></td>
							</tr>
						</table>
					</fieldset>
					<br>
					<footer>
						<h6>Copyright 2020-2021 by Java Fresher Training</h6>
					</footer>
				</form>
			</div>
		</div>
	</div>
</body>
</html>