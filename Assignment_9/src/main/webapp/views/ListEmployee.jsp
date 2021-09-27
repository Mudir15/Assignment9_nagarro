<!-- ListEmployee page -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Edit Employee</title>
<style>
@charset "ISO-8859-1";

table, td, th {
	border: 2px solid black;
	border-collapse: collapse;
}

table {
	width: 100%;
}

header {
	color: black;
	margin-bottom: 10px;
	background-image: linear-gradient(#b2b2fc, #fbfbe3);
}

footer {
	color: black;
	text-align: center;
	height: auto;
	position: fixed;
	width: 98%;
	bottom: 10px;
	background-image: linear-gradient(#b2b2fc, #fbfbe3);
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

.btn2 {
	margin-left: 70%;
	margin-bottom: 2%;
	border: 1px solid black;
	border-radius: 2px;
}

.btn3 {
	border: 1px solid black;
	border-radius: 2px;
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
					<h2 style="margin-left: 10px;">Employee Details</h2>
					<h3 style="text-align: right; margin-right: 10px;">
						Welcome ${userData.getUserName()} ! &nbsp <a href="Logout"><i
							class="fa fa-close" style="font-size: 30px; color: red"></i></a>
					</h3>
				</header>

				<br>
				<fieldset>
					<legend>Employee Listings</legend>
					<a href="AddEmployee"> <input type="button"
						value="Upload Employee Details " class="btn2"></a> <a
						href="download"><input type="button"
						value="Download Employee Details " class="btn3"></a>
					<table class="t1">
						<tr>
							<th>Employee Code</th>
							<th>Employee Name</th>
							<th>Location</th>
							<th>Email</th>
							<th>Date Of Birth</th>
							<th>Action</th>
						</tr>

						<c:forEach var="emp" items="${userDataa}">
							<tr>


								<td>${emp.getEmployeeCode()}</td>

								<td>${emp.getEmployeeName()}</td>
								<td>${emp.getLocation()}</td>
								<td>${emp.getEmail()}</td>
								<td>${emp.getDateOfBirth()}</td>
								<td><a href="UpdateEmployee?id=${emp.getEmployeeCode()}">Edit</a></td>
							</tr>

						</c:forEach>

					</table>
				</fieldset>
				<footer>
					<h6>Copyright 2020-2021 by Java Fresher Training</h6>
				</footer>
			</div>
		</div>
	</div>

</body>
</html>