package org.cjc.springbootcrudApp.Repository;
import java.util.List;
import org.cjc.springbootcrudApp.Model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer> {

	public List<Student> findAllByBatchNumber(String batchNumber);
	
}
