package com.nagarro.javafreshertraining.model;


public class Employee {

	private int employeeCode;
	private String employeeName;
	private String location;
	private String email;
	private String dateOfBirth;

	
	public int getEmployeeCode() {
		return employeeCode;
	}

	
	public void setEmployeeCode(int employeeCode) {
		this.employeeCode = employeeCode;
	}

	
	public String getEmployeeName() {
		return employeeName;
	}

	
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	
	public String getLocation() {
		return location;
	}

	
	public void setLocation(String location) {
		this.location = location;
	}

	
	public String getEmail() {
		return email;
	}

	
	public void setEmail(String email) {
		this.email = email;
	}

	
	public String getDateOfBirth() {
		return dateOfBirth;
	}

	
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	@Override
	public String toString() {
		return "Employee [EmployeeCode=" + employeeCode + ", EmployeeName=" + employeeName + ", Location=" + location
				+ ", Email=" + email + ", DateOfBirth=" + dateOfBirth + "]";
	}

}
