package org.cjc.springbootcrudApp.ServiceImpl;
import java.util.List;
import java.util.Optional;
import org.cjc.springbootcrudApp.Model.Student;
import org.cjc.springbootcrudApp.Repository.StudentRepository;
import org.cjc.springbootcrudApp.ServiceI.ServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	@Override
	public Student getStudent(int id) {
		return sr.findById(id).get();
	}

	@Override
	public List<Student> updateStudentFees(int studentid, float amount) {
    Optional<Student> op=sr.findById(studentid);
    if(op.isPresent()) {
    	Student s=op.get();
    	s.setFeesPaid(s.getFeesPaid()+amount);
    	sr.save(s);
    }
		return sr.findAll();
	}

	@Override
	public void removeStudent(int id) {
    sr.deleteById(id);
		
	}

	@Override
	public List<Student> updateStudentBatch(int id, String newBatch) {
		Optional<Student> op = sr.findById(id);
	    if(op.isPresent()) {
	        Student s = op.get();
	        s.setBatchNumber(newBatch);
	        sr.save(s);
	    }
	    return sr.findAll();
	}

	@Override
	public List<Student> paging(int pageNo, int i) {
		Pageable p=PageRequest.of(pageNo,i,Sort.by("studentFullName").ascending());
           List<Student>   list     =sr.findAll(p).getContent();
		return list;
	}

	@Override
	public List<Student> updateStudentData(Student s) {
		sr.save(s); // JpaRepository save() handles update if ID is present
	    return sr.findAll();
	}

	@Override
	public List<Student> searchByBatch(String batchNumber) {
		return sr.findAllByBatchNumber(batchNumber);
	}
	}


