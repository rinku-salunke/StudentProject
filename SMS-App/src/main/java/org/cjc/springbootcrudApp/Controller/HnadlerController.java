package org.cjc.springbootcrudApp.Controller;
import java.util.List;
import org.cjc.springbootcrudApp.Model.Student;
import org.cjc.springbootcrudApp.ServiceI.ServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HnadlerController {

	@Autowired
	ServiceI ssi;
	
	@RequestMapping("/")
	public String preLogin() {
		return "Login";
	}
	
	@RequestMapping("/login")
	public String onLogin(@RequestParam("username")String username,@RequestParam("password")String password,Model m) {
		if(username.equals("admin") && password.equals("admin")) {
			m.addAttribute("data",ssi.getAllStudents());
			return "adminScreen";
		}else {
			return "Login";

		}
	}
	
	@RequestMapping("/enroll_student")
	public String enroll(@ModelAttribute Student s, Model m) {
	    List<Student> list = ssi.addStudent(s);
	    m.addAttribute("data", list);
	    m.addAttribute("message", "Success! The student record has been created and saved.");
	    return "adminScreen";
	}
	
	@RequestMapping("/search")
	public String searchStudent(@RequestParam("batchNumber")String batchNumber,Model m) {
		List<Student> list=ssi.getBatchesStudent(batchNumber);
		if(list.size()>0) {
			m.addAttribute("data", list);
			return "adminScreen";

		}else {
			List<Student> l=ssi.getAllStudents();
			m.addAttribute("data",l);
			m.addAttribute("message","No Records Are Available For This Batch" +batchNumber);
			return "adminScreen";
		}
	}
	
	@RequestMapping("/fees")
	public String onFees(@RequestParam("id") int id,Model m){
		Student s=ssi.getStudent(id);
		m.addAttribute("st",s);
		return "fees";
	}
	
	@RequestMapping("/payfees")
	public String onFees(@RequestParam("studentid") int studentid,@RequestParam("amount") float amount,Model m){
		List<Student> list=ssi.updateStudentFees(studentid,amount);
		m.addAttribute("data",list);
		return "adminScreen";
	}

	@RequestMapping("/remove")
	public String removeData(@RequestParam("id") int id, Model m) {
	    ssi.removeStudent(id); // Your service logic
	    m.addAttribute("message", "Student record deleted successfully!");
	    m.addAttribute("data", ssi.getAllStudents()); // Refresh the list
	    return "adminScreen";
	}
	
	
	// 1. Load the Shift Page with Student Data
	@RequestMapping("/batch")
	public String showShiftPage(@RequestParam("id") int id, Model m) {
	    Student s = ssi.getStudent(id); // Fetch the specific student
	    m.addAttribute("student", s);
	    return "shiftBatch"; // Opens shiftBatch.jsp
	}

	// 2. Process the Update
	@RequestMapping("/update_batch_process")
	public String updateBatchProcess(@RequestParam("studentId") int id, @RequestParam("newBatch") String newBatch, Model m) {
	    List<Student> list = ssi.updateStudentBatch(id, newBatch);
	    m.addAttribute("data", list);
	    m.addAttribute("message", "Success! Student shifted to batch " + newBatch + " successfully.");
	    return "adminScreen"; // Redirect back to main dashboard
	}
	
	
	@RequestMapping("/view")
	public String backToDashboard(Model m) {
	    m.addAttribute("data", ssi.getAllStudents());
	    return "adminScreen";
	}
	
	@RequestMapping("/paging")
	public String Paging(@RequestParam("pageNo")int  pageNo,Model m) {
    List<Student> list=ssi.paging(pageNo,2);
	m.addAttribute("data",list); // Refresh the list
    return "adminScreen";
	}
}
