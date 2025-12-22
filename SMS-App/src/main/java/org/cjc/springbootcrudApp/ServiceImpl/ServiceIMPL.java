package org.cjc.springbootcrudApp.ServiceImpl;
import java.util.List;
import org.cjc.springbootcrudApp.Model.Student;
import org.cjc.springbootcrudApp.Repository.StudentRepository;
import org.cjc.springbootcrudApp.ServiceI.ServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceIMPL implements ServiceI{

	@Autowired
	StudentRepository sr;
	
	@Override
	public List<Student> addStudent(Student s) {
    sr.save(s);
	return sr.findAll();
	}

	@Override
	public List<Student> getAllStudents() {
		return sr.findAll();
	}

	@Override
	public List<Student> getBatchesStudent(String batchNumber) {
    
		return sr.findAllByBatchNumber(batchNumber);
	}

}
