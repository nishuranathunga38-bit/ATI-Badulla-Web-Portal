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

@WebServlet(name = "AddNoticeServlet", urlPatterns = {"/AddNoticeServlet"})
public class AddNoticeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int priority = Integer.parseInt(request.getParameter("priority"));
        
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO notices (title, content, priority) VALUES (?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, title);
                ps.setString(2, content);
                ps.setInt(3, priority);
                ps.executeUpdate();
            }
            request.setAttribute("message", "Notice Published Successfully!");
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        }
    }
}