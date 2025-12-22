package org.cjc.springbootcrudApp.ServiceI;
import java.util.List;
import org.cjc.springbootcrudApp.Model.Student;

public interface ServiceI {

	List<Student> addStudent(Student s);
	
	public List<Student> getAllStudents();

	List<Student> getBatchesStudent(String batchNumber);

}
