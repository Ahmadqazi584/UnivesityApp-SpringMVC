package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DepartmentDao;
import model.Department;
import model.Student;

public class DepartmentService {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
   	DepartmentDao departmentDao = (DepartmentDao) context.getBean("departmentDao");
   	
   	public void addDepartmentService(HttpServletRequest request, HttpServletResponse response ) {
    	String name = request.getParameter("name");
    	String code = request.getParameter("code");
        
    	Department d = new Department();
    	d.setName(name);
    	d.setCode(code);
    
    	departmentDao.save(d);
    }
   	
   	public void updateDepartmentService(HttpServletRequest request, HttpServletResponse response ) {
    	int departmentid = (int) request.getSession().getAttribute("departmentid");    	
    	String name = request.getParameter("name");
    	String code = request.getParameter("code");
        
    	Department d = new Department();
    	d.setId(departmentid);
    	d.setName(name);
    	d.setCode(code);
    	
    	departmentDao.update(d);
    	try {
			response.sendRedirect(request.getContextPath() + "/departments.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    
    }
   	
    public void deleteDepartmentService(HttpServletRequest request, HttpServletResponse response) {
    	
    	int departmentid = Integer.parseInt(request.getParameter("delete_id"));
    	Department department = departmentDao.findById(departmentid);
    	departmentDao.delete(department);
        try {
			response.sendRedirect(request.getContextPath() + "/departments.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
