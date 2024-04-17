package controller;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DepartmentDao;
import dao.StudentDao;
import service.StudentService;

@Controller
public class StudentController {
	
	StudentService studentService = new StudentService();
   	
   	@RequestMapping("/addstudent")
   	@Transactional
   	public String addStudent(HttpServletRequest request, HttpServletResponse response) {
   	    studentService.addStudentService(request, response);
        return "students.jsp"; // Return logical view name
   	}

    
    @RequestMapping("/deletestudent")
    @Transactional
    public void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
    	studentService.deleteStudentService(request, response);
    }
    
    @RequestMapping("/updatestudent")
    @Transactional
    public void updateStudent(HttpServletRequest request, HttpServletResponse response ) {
    	studentService.updateStudentService(request, response);
    }
}

