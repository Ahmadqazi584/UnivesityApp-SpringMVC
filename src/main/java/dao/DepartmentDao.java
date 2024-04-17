package dao;

import java.util.List;

import model.Department;


public interface DepartmentDao {
	void save(Department department);
    Department findById(int id);
    List<Department> findAll();
    void update(Department department);
    void delete(Department department);
}
