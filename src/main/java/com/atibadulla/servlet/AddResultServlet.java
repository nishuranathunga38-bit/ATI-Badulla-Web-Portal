package com.atibadulla.servlet;

import com.atibadulla.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AddResultServlet", urlPatterns = {"/AddResultServlet"})
public class AddResultServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentId = request.getParameter("student_id");
        String courseCode = request.getParameter("course_code");
        String subject = request.getParameter("subject");
        String grade = request.getParameter("grade");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO results (student_id, course_code, subject, grade) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, studentId);
                ps.setString(2, courseCode);
                ps.setString(3, subject);
                ps.setString(4, grade);
                ps.executeUpdate();
            }
            request.setAttribute("message", "Exam Result Published Successfully!");
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        }
    }
}