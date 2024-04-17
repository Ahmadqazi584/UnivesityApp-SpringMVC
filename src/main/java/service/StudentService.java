package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DepartmentDao;
import dao.StudentDao;
import model.Department;
import model.Student;

public class StudentService {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
    StudentDao studentDao = (StudentDao) context.getBean("studentDao");
   	DepartmentDao departmentDao = (DepartmentDao) context.getBean("departmentDao");
   	
   	public void addStudentService(HttpServletRequest request, HttpServletResponse response ) {
    	String name = request.getParameter("name");
    	int department = Integer.parseInt(request.getParameter("department"));
    	String email = request.getParameter("email");
    	String phone = request.getParameter("phone");
        
    	Student s = new Student();
    	s.setName(name);
    	s.setEmail(email);
    	s.setPhone(phone);
    	
    	Department d = departmentDao.findById(department);
    	s.setDepartment(d);
    	
    	studentDao.save(s);
    }
   	
    public void deleteStudentService(HttpServletRequest request, HttpServletResponse response) {
    	
    	int studentid = Integer.parseInt(request.getParameter("delete_id"));
    	Student student = studentDao.findById(studentid);
    	studentDao.delete(student);
        try {
			response.sendRedirect(request.getContextPath() + "/students.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public void updateStudentService(HttpServletRequest request, HttpServletResponse response ) {
    	
    	int studentid = (int) request.getSession().getAttribute("studentid");    	
    	String name = request.getParameter("name");
    	int department = Integer.parseInt(request.getParameter("department"));
    	String email = request.getParameter("email");
    	String phone = request.getParameter("phone");
        
    	Student s = new Student();
    	s.setId(studentid);
    	s.setName(name);
    	s.setEmail(email);
    	s.setPhone(phone);
    	
    	Department d = departmentDao.findById(department);
    	s.setDepartment(d);
    	
    	studentDao.update(s);
    	
    	try {
			response.sendRedirect(request.getContextPath() + "/students.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
    }
}
