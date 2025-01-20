package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImp;
import com.DB.DBconnect;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String newPassword = req.getParameter("password");
            
            UserDAOImp dao = new UserDAOImp(DBconnect.getConn());
            HttpSession session = req.getSession();
            
            if (dao.checkEmail(email)) {
                boolean f = dao.resetPassword(email, newPassword);
                if (f) {
                    session.setAttribute("successMsg", "Password Reset Successfully");
                    resp.sendRedirect("login.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something wrong on server");
                    resp.sendRedirect("resetPassword.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Email not found");
                resp.sendRedirect("resetPassword.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}