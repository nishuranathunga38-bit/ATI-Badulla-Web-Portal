package com.atibadulla.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            // 1. Driver eka load karanna
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 2. Database connection eka hadanna
            // 'root' kiyanne username, password eka blank (empty) widiyata thiyena nisa "" kiyala thiya ganna
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ati_badulla_db?useSSL=false&serverTimezone=UTC", "root", "");
            
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}