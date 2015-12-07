package org.test.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.test.domain.Employee;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("employeeService")
@Transactional
public class EmployeeService {

    protected static Logger logger = Logger.getLogger("service");

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    public List<Employee> getAll() {
        logger.debug("Retrieving all employees");

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("From Employee");
        return query.list();
    }

    public Employee get( Integer id ) {

        Session session = sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.get(Employee.class, id);
        return employee;
    }

    public void add(Employee employee) {
        logger.debug("Adding new employee");

        Session session = sessionFactory.getCurrentSession();
        session.save(employee);
    }

    public void delete(Integer id) {
        logger.debug("Deleting existing employee");

        Session session = sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.get(Employee.class, id);
        session.delete(employee);
    }

    public void edit(Employee employee) {
        logger.debug("Editing existing employee");

        Session session = sessionFactory.getCurrentSession();
        Employee existingEmployee = (Employee) session.get(Employee.class, employee.getId());
        existingEmployee.setFirstName(employee.getFirstName());
        existingEmployee.setSecondName(employee.getSecondName());
        existingEmployee.setLastName(employee.getLastName());
        existingEmployee.setAge(employee.getAge());
        existingEmployee.setExperience(employee.getExperience());
        existingEmployee.setDescription(employee.getDescription());

        session.save(existingEmployee);
    }

    public List<Employee> search(Employee employee) {
        logger.debug("Searching");

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("From Employee e where e.firstName = '" + employee.getFirstName() + "'" +
        "or e.secondName = '" + employee.getSecondName() + "'" +
        "or e.lastName = '" + employee.getLastName() + "'" +
        "or e.age = " + employee.getAge() + "");

        return query.list();
    }
}
