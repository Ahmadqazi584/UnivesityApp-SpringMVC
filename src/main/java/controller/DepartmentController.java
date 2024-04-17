package controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DepartmentDao;
import service.DepartmentService;

@Controller
public class DepartmentController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
   	DepartmentDao departmentDao = (DepartmentDao) context.getBean("departmentDao");
	DepartmentService departmentService = new DepartmentService();

   	
   	@RequestMapping("/adddepartment")
   	@Transactional
   	public String addDepartment(HttpServletRequest request, HttpServletResponse response) {
   		departmentService.addDepartmentService(request, response);
        return "departments.jsp"; 
   	}

    
    @RequestMapping("/deletedepartment")
    @Transactional
    public void deleteDepartment(HttpServletRequest request, HttpServletResponse response) {
    	departmentService.deleteDepartmentService(request, response);
    }
    
    @RequestMapping("/updatedepartment")
    @Transactional
    public void updateDepartment(HttpServletRequest request, HttpServletResponse response ) {
    	departmentService.updateDepartmentService(request, response);
    }
}

