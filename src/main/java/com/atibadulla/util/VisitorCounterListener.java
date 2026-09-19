package com.atibadulla.util;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class VisitorCounterListener implements HttpSessionListener {
    private static int activeSessions = 0;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        activeSessions++;
        se.getSession().getServletContext().setAttribute("activeUsers", activeSessions);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        if (activeSessions > 0) {
            activeSessions--;
        }
        se.getSession().getServletContext().setAttribute("activeUsers", activeSessions);
    }
}