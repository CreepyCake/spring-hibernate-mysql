package org.test.controller;

import java.io.Console;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.test.domain.Employee;
import org.test.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main")
public class MainController {

	protected static Logger logger = Logger.getLogger("controller");
	
	@Resource(name="employeeService")
	private EmployeeService employeeService;

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public String getEmployees(Model model) {
    	logger.debug("Received request to show all employees");

    	List<Employee> employees = employeeService.getAll();
    	model.addAttribute("employees", employees);
    	return "employeespage";
	}

    @RequestMapping(value = "/employees/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
    	logger.debug("Received request to show add page");

    	model.addAttribute("employeeAttribute", new Employee());
    	return "addpage";
	}

    @RequestMapping(value = "/employees/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("employeeAttribute") Employee employee) {
		logger.debug("Received request to add new employee");

		employeeService.add(employee);
		return "addedpage";
	}

    @RequestMapping(value = "/employees/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Integer id, 
    										Model model) {
		logger.debug("Received request to delete existing employee");

		employeeService.delete(id);
		model.addAttribute("id", id);
		return "deletedpage";
	}

    @RequestMapping(value = "/employees/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value="id", required=true) Integer id,  
    										Model model) {
    	logger.debug("Received request to show edit page");

    	model.addAttribute("employeeAttribute", employeeService.get(id));
    	return "editpage";
	}

    @RequestMapping(value = "/employees/edit", method = RequestMethod.POST)
    public String saveEdit(@ModelAttribute("employeeAttribute") Employee employee,
    										   @RequestParam(value="id", required=true) Integer id, 
    												Model model) {
    	logger.debug("Received request to update employee");

		employee.setId(id);
		employeeService.edit(employee);
		model.addAttribute("id", id);
		return "editedpage";
	}

	@RequestMapping(value = "/employees/search", method = RequestMethod.GET)
	public String getSearch(Model model) {
		logger.debug("Received request to show search page");

		model.addAttribute("employeeAttribute", new Employee());
		return "searchpage";
	}

	@RequestMapping(value = "/employees/searchResults", method = RequestMethod.GET)
	public String search(@ModelAttribute("employeeAttribute") Employee employee, Model model) {
		logger.debug("Received request to search");

		List<Employee> employees = employeeService.search(employee);
		model.addAttribute("employees", employees);
		return "searchresultspage";
	}
}
