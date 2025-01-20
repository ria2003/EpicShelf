package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.RequestDAO;
import com.DAO.RequestDAOImp;
import com.DB.DBconnect;
import com.entity.Request;

@WebServlet("/request_book")
public class RequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        try {
            // Get form data
            String title = req.getParameter("bookTitle");
            String author = req.getParameter("author");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            String email = req.getParameter("email");
            String contact = req.getParameter("contact");
            String additional = req.getParameter("additionalNotes");

            // Create Request object
            Request request = new Request();
            request.setTitle(title);
            request.setAuthor(author);
            request.setQuantity(quantity);
            request.setEmail(email);
            request.setContact(contact);
            request.setAdditional(additional);

            // Save to database
            RequestDAO dao = new RequestDAOImp(DBconnect.getConn());
            HttpSession session = req.getSession();

            boolean success = dao.addRequest(request);
            if (success) {
                session.setAttribute("successMsg", "Request submitted successfully!");
                resp.sendRedirect("request_book.jsp");
            } else {
                session.setAttribute("failedMsg", "Something went wrong. Please try again.");
                resp.sendRedirect("request_book.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Something went wrong. Please try again.");
            resp.sendRedirect("request_book.jsp");
        }
    }
}