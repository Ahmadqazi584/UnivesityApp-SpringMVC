package daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import dao.DepartmentDao;
import model.Department;

public class DepartmentDaoImpl implements DepartmentDao {

	private HibernateTemplate hibernateTemplate;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    @Transactional
    public void save(Department department) {
        hibernateTemplate.save(department);
    }

    @Override
    @Transactional
    public Department findById(int id) {
        return hibernateTemplate.get(Department.class, id);
    }
    
    @Override
    public List<Department> findAll() {
        return hibernateTemplate.loadAll(Department.class);
    }


    @Override
    @Transactional
    public void update(Department department) {
        hibernateTemplate.update(department);
    }

    @Override
    @Transactional
    public void delete(Department department) {
        hibernateTemplate.delete(department);
    }

}
