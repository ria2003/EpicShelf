package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the existing session
            HttpSession session = req.getSession();
            
            // Remove the userObj from the session to log the user out
            session.removeAttribute("userObj");

            // Optionally, invalidate the session completely
            // session.invalidate(); // if you want to invalidate the session completely
            
            // Set a success message
            session.setAttribute("successMsg", "Logged out successfully!");

            // Redirect to the login page (or wherever you want)
            resp.sendRedirect("googleLogin.jsp");
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}
