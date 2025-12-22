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
	public String addStudent(@ModelAttribute Student s,Model m){
		List<Student> list=ssi.addStudent(s);
		m.addAttribute("data", list);
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
}
