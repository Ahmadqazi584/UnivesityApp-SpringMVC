package daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.hibernate.FlushMode;
import org.hibernate.Session;

import dao.DepartmentDao;
import dao.StudentDao;
import model.Student;

public class StudentDaoImpl implements StudentDao{

	private HibernateTemplate hibernateTemplate;
	private DepartmentDao myCustomDepartmentDao;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void setMyCustomDepartmentDao(DepartmentDao myCustomDepartmentDao) {
        this.myCustomDepartmentDao = myCustomDepartmentDao;
    }

	@Override
	@Transactional
	public void save(Student student) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(student);
	}

	@Override
	@Transactional
	public void update(Student student) {
		// TODO Auto-generated method stub
		hibernateTemplate.update(student);
	}

	@Override
	@Transactional
    public void delete(Student student) {
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
        session.setHibernateFlushMode(FlushMode.COMMIT);
        hibernateTemplate.delete(student);
    }

	@Override
	public Student findById(int studentId) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(Student.class, studentId);
	}

	@Override
	public List<Student> getAll() {
		// TODO Auto-generated method stub
		return hibernateTemplate.loadAll(Student.class);
		
	}
}
