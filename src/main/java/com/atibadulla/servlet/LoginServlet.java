package com.atibadulla.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        // Hardcoded Credentials for easy access
        if ("admin".equals(user) && "123".equals(pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", user);
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid Admin Username or Password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}