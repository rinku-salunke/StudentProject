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
   
	int s1;
	
	int k1;
	
    @Autowired
    ServiceI ssi;

    @RequestMapping("/")
    public String preLogin() {
        return "Login";
    }

    @RequestMapping("/login")
    public String onLogin(@RequestParam("username") String username, @RequestParam("password") String password, Model m) {
        if (username.equals("admin") && password.equals("admin")) {
            m.addAttribute("data", ssi.getAllStudents());
            return "adminScreen";
        } else {
            return "Login";
        }
    }

    @RequestMapping("/enroll_student")
    public String enroll(@ModelAttribute Student s, Model m) {
        float maxFee = s.getStudentCourse().equalsIgnoreCase("Java") ? 30000.0f : 40000.0f;

        if (s.getFeesPaid() > maxFee) {
            m.addAttribute("message", "Enrollment Failed: Max fee for " + s.getStudentCourse() + " is ₹" + maxFee);
            m.addAttribute("data", ssi.getAllStudents());
            return "adminScreen";
        }

        // Automatic Status Update
        if (s.getFeesPaid() >= maxFee) {
            s.setFeesStatus("Paid");
        } else if (s.getFeesPaid() > 0) {
            s.setFeesStatus("Partial");
        } else {
            s.setFeesStatus("Unpaid");
        }

        ssi.addStudent(s);
        m.addAttribute("data", ssi.getAllStudents());
        m.addAttribute("message", "Success! Student enrolled successfully.");
        return "adminScreen";
    }

    @RequestMapping("/fees")
    public String onFees(@RequestParam("id") int id, Model m) {
        Student s = ssi.getStudent(id);
        m.addAttribute("st", s);
        return "fees";
    }

    @RequestMapping("/feeStatus")
    public String showFeeStatus(@RequestParam("studentid") int id, Model model) {
        Student student = ssi.getStudent(id); // Ensure this returns a valid student
        model.addAttribute("student", student); // Name must match "student" in JSP
        return "feeStatus";
    }
    
    @RequestMapping("/payFees")
    public String updateFees(@RequestParam("studentid") int id, @RequestParam("amount") float amountPaidNow, Model m) {
        Student s = ssi.getStudent(id);
        float targetFee = s.getStudentCourse().equalsIgnoreCase("Java") ? 30000.0f : 40000.0f;

        if (s.getFeesPaid() >= targetFee || "Paid".equalsIgnoreCase(s.getFeesStatus())) {
            m.addAttribute("message", "RESTRICTION: Fees already settled!");
            m.addAttribute("data", ssi.getAllStudents());
            return "adminScreen";
        }

        float updatedTotalPaid = s.getFeesPaid() + amountPaidNow;
        if (updatedTotalPaid > targetFee) {
            m.addAttribute("message", "Error: Payment exceeds total course fee!");
            m.addAttribute("data", ssi.getAllStudents());
            return "adminScreen";
        }

        s.setFeesPaid(updatedTotalPaid);
        s.setFeesStatus(updatedTotalPaid >= targetFee ? "Paid" : "Partial");

        ssi.addStudent(s);
        m.addAttribute("data", ssi.getAllStudents());
        m.addAttribute("message", "Payment recorded successfully.");
        return "adminScreen";
    }

    @RequestMapping("/edit")
    public String showEditPage(@RequestParam("id") int id, Model m) {
        Student s = ssi.getStudent(id);
        m.addAttribute("student", s);
        return "Edit";
    }

    
    
    @RequestMapping("/update_student_process")
    public String updateStudent(@ModelAttribute Student s, Model m) {
        float maxFee = s.getStudentCourse().equalsIgnoreCase("Java") ? 30000.0f : 40000.0f;

        // Validation
        if (s.getFeesPaid() > maxFee) {
            m.addAttribute("message", "Update Failed: Fee cannot exceed ₹" + maxFee);
            m.addAttribute("data", ssi.getAllStudents());
            return "adminScreen";
        }

        // Sync Status
        s.setFeesStatus(s.getFeesPaid() >= maxFee ? "Paid" : "Partial");

        ssi.updateStudentData(s);
        m.addAttribute("data", ssi.getAllStudents());
        m.addAttribute("message", "Student record updated successfully!");
        return "adminScreen";
    }

    @RequestMapping("/batch")
    public String showShiftPage(@RequestParam("id") int id, Model m) {
        Student s = ssi.getStudent(id);
        m.addAttribute("student", s);
        return "shiftBatch";
    }

    @RequestMapping("/update_batch_process")
    public String updateBatchProcess(@RequestParam("studentId") int id, @RequestParam("newBatch") String newBatch, Model m) {
        List<Student> list = ssi.updateStudentBatch(id, newBatch);
        m.addAttribute("data", list);
        m.addAttribute("message", "Success! Student shifted to batch " + newBatch + " successfully.");
        return "adminScreen";
    }

    @RequestMapping("/search")
    public String searchByBatch(@RequestParam("batchNumber") String batchNumber, Model model) {
        // 1. Fetch students from your service based on the batch number
        List<Student> filteredStudents = ssi.searchByBatch(batchNumber); 
        
        // 2. Add the results back to the 'data' attribute used by your JSP table
        model.addAttribute("data", filteredStudents);
        
        // 3. Return to the admin screen to show the filtered results
        return "adminScreen"; 
    }
    
    @RequestMapping("/remove")
    public String removeData(@RequestParam("id") int id, Model m) {
        ssi.removeStudent(id);
        m.addAttribute("message", "Record deleted!");
        m.addAttribute("data", ssi.getAllStudents());
        return "adminScreen";
    }

    @RequestMapping("/view")
    public String backToDashboard(Model m) {
        m.addAttribute("data", ssi.getAllStudents());
        return "adminScreen";
    }
}
