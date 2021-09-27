package com.nagarro.javafreshertraining.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.nagarro.javafreshertraining.model.Employee;
import com.nagarro.javafreshertraining.model.User;
import com.nagarro.javafreshertraining.service.EmployeeManagementService;

//contains and API url to hit and mapping the view and model.

@RestController
@RequestMapping(value="/")
public class EmployeeManagement {

	@Autowired
	EmployeeManagementService service;

	
	@GetMapping("login")
	public ModelAndView login(User user) {
		ModelAndView mv = new ModelAndView();
		/* mapped user to userData */
		mv.addObject("userData", user);
		mv.setViewName("login"); /* display login page */

		return mv;
	}

	
	@GetMapping("ListEmployee")
	public ModelAndView list(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		RestTemplate restTemplate = new RestTemplate();
		//hit API ListEmployee present in EmployeeRestAPI controller
		Employee[] empdata = restTemplate.getForObject("http://localhost:8013/ListEmployee", Employee[].class);
		//converting array to Iterable List
		Iterable<Employee> empl = Arrays.asList(empdata);
		if (session.getAttribute("username") == null) {
			mv.setViewName("login");
			return mv;
		}
		mv.addObject("userDataa", empl);
		mv.setViewName("ListEmployee");
		return mv;
	}

	
	@PostMapping("login")
	public ModelAndView Login(User user, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		 //if no user is logged in then display login page again else create a session
		 // and save that user and display ListEmployee page
		 
		if (service.findByUserIDAndPassword(user).isEmpty()) {
			mv.setViewName("login");
		} else {
			User userr = service.findById(user);
			HttpSession session = request.getSession();
			session.setAttribute("username", userr.getUserName());

			user.setUserName(userr.getUserName());
			mv.addObject("userData", user);
			RestTemplate restTemplate = new RestTemplate();
			Employee[] empdata = restTemplate.getForObject("http://localhost:8013/ListEmployee", Employee[].class);
			Iterable<Employee> empl = Arrays.asList(empdata);
			mv.addObject("userDataa", empl);
			mv.setViewName("ListEmployee");
		}
		return mv;
	}

	
	@GetMapping("AddEmployee")
	public ModelAndView add(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("username") == null) {
			mv.setViewName("login");
			return mv;
		}
		mv.addObject("sessionn", session.getAttribute("username"));
		mv.setViewName("AddEmployee");

		return mv;
	}

	
	@PostMapping("AddEmployee")
	public ModelAndView addData(Employee employee, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		/* Hitting API addEmployee */
		RestTemplate restTemplate = new RestTemplate();
		Employee[] empdata = restTemplate.postForObject("http://localhost:8013/addEmployee", employee,
				Employee[].class);
		Iterable<Employee> empl = Arrays.asList(empdata);
		/* mapping model and view */
		mv.addObject("sessionn", session.getAttribute("username"));
		mv.addObject("userDataa", empl);
		mv.setViewName("ListEmployee");

		return mv;
	}

	
	@GetMapping("UpdateEmployee")
	public ModelAndView edit(@RequestParam("id") int Id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("username") == null) {
			mv.setViewName("login");
			return mv;
		}
		mv.addObject("sessionn", session.getAttribute("username"));
		RestTemplate restTemplate = new RestTemplate();
		Employee empdata = restTemplate.getForObject("http://localhost:8013/UpdateEmployee/?id=" + Id, Employee.class);
		mv.setViewName("UpdateEmployee");
		mv.addObject("userData", empdata);

		return mv;
	}

	
	@PostMapping("updateEmployee")
	public ModelAndView updateData(Employee employee, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		/* hitting updateEmployee API */
		RestTemplate restTemplate = new RestTemplate();
		Employee[] empdata = restTemplate.postForObject("http://localhost:8013/updateEmployee", employee,
				Employee[].class);
		Iterable<Employee> empList = Arrays.asList(empdata);
		mv.addObject("sessionn", session.getAttribute("username"));
		mv.addObject("userDataa", empList);
		mv.setViewName("ListEmployee");

		return mv;
	}

	
	@GetMapping("Logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login"); //return to login page on log out
		return mv;
	}

	
	@GetMapping("download")
	public void exportToCSV(HttpServletResponse response) throws IOException {
		response.setContentType("text/csv");
		String fileName = "employee.csv";
		String headerKey = "Content-Disposition";
		String headerValue = "attachment; fileName=" + fileName;
		response.setHeader(headerKey, headerValue);
		//hitting ListEmployee API which return employees list 
		RestTemplate restTemplate = new RestTemplate();
		Employee[] empdata = restTemplate.getForObject("http://localhost:8013/ListEmployee", Employee[].class);
		List<Employee> listEmployees = Arrays.asList(empdata);
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
		String[] csvHeader = { "employee_code", "date_of_birth", "email", "employee_name", "location" };
		String[] nameMapping = { "employeeCode", "dateOfBirth", "email", "employeeName", "location" };
		csvWriter.writeHeader(csvHeader);
		//writing data to CSV file 
		for (Employee employee : listEmployees) {
			csvWriter.write(employee, nameMapping);
		}
		csvWriter.close();
	}
}
