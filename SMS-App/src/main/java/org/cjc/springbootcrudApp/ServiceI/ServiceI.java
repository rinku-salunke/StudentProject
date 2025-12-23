package org.cjc.springbootcrudApp.ServiceI;
import java.util.List;
import org.cjc.springbootcrudApp.Model.Student;

public interface ServiceI {

	List<Student> addStudent(Student s);
	
	public List<Student> getAllStudents();

	List<Student> getBatchesStudent(String batchNumber);

	Student getStudent(int id);

	List<Student> updateStudentFees(int studentid,float amount);

	void removeStudent(int id);

	List<Student> updateStudentBatch(int id, String newBatch);

	List<Student> paging(int pageNo, int i);
}
