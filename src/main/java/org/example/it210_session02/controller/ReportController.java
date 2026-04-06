package org.example.it210_session02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ReportController {

    // Inner class for demonstration
    public static class Student {
        private String fullName;
        private double score;

        public Student(String fullName, double score) {
            this.fullName = fullName;
            this.score = score;
        }

        public String getFullName() {
            return fullName;
        }

        public double getScore() {
            return score;
        }
    }

    @GetMapping("/report")
    public String showReport(Model model) {
        List<Student> students = new ArrayList<>();
        students.add(new Student("Nguyễn Thị Bình", 92));
        students.add(new Student("Trần Minh Khoa", 75));
        students.add(new Student("Lê Thu Hà", 55));
        students.add(new Student("Phạm Duy An", 48));

        model.addAttribute("studentList", students);
        model.addAttribute("reportTitle", "Báo cáo điểm cuối kỳ");
        return "report";
    }
}
