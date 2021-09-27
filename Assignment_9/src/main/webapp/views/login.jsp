<!-- Login page -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HR Login</title>
<script>
	function validateUserID() {
		var str = document.getElementById("userID").value;
		if (str.length > 50 || str.length < 5) {
			alert("Min 5 Max 50 characters allowed");
			document.getElementById("userID").value = "";
			return false;
		}
		return true;
	}
	function validatePassword() {
		var str = document.getElementById("password").value;
		if (str.length > 50 || str.length < 5) {
			alert("Min 5 Max 50 characters allowed");
			document.getElementById("password").value = "";
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
	margin-bottom: 10px;
	text-align: center;
	background-image: linear-gradient(#b2b2fc, #fbfbe3);
}

footer {
	color: black;
	text-align: center;
	height: auto;
	position: fixed;
	width: 98%;
	bottom: 50px;
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
	padding-right: 70px;
}

.t1 td:last-child {
	padding-left: 5px;
}

body {
	background-color: #f5f8fb;
	color: black;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-12 col-md-12 col-sm-12 col-12">
				<header>
					<h2>HR Login Form</h2>
				</header>

				<br>
				<form action="login" method="post" style="margin-top: 50px;">
					<fieldset>
						<legend>Login</legend>
						<table class="t1">

							<tr>
								<td><label>User Id:</label></td>
								<td><label class="required">* </label></td>
								<td><input type="text" name="userID" id="userID" size="40"
									required onchange="return validateUserID()"></td>
							</tr>
							<tr>
								<td><label>Password:</label></td>
								<td><label class="required">* </label></td>
								<td><input type="password" name="password" id="password"
									size="40" required onchange="return validatePassword()"></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><input type="submit" value="Login" class="btn1">
								</td>
							</tr>
						</table>
					</fieldset>
					<footer>
						<h6>Copyright 2020-2021 by Java Fresher Training</h6>
					</footer>
				</form>
			</div>
		</div>
	</div>
</body>
</html>