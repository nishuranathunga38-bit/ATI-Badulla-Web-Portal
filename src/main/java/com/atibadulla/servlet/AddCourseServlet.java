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

@WebServlet(name = "AddCourseServlet", urlPatterns = {"/AddCourseServlet"})
public class AddCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("course_name");
        String code = request.getParameter("course_code");
        String duration = request.getParameter("duration");
        String desc = request.getParameter("description");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO courses (course_name, course_code, duration, description) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, code);
                ps.setString(3, duration);
                ps.setString(4, desc);
                ps.executeUpdate();
            }
            request.setAttribute("message", "New Course Added Successfully!");
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        }
    }
}