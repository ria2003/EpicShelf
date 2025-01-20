package com.user.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImp;
import com.DB.DBconnect;

@WebServlet("/deleteSoldBook")
public class DeleteSoldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			
		
			BooksDAOImp dao=new BooksDAOImp(DBconnect.getConn());
			boolean f=dao.deleteSoldBooks(em, "Old", id);
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("successMsg", "Book deleted successfully");
				resp.sendRedirect("soldBooks.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("soldBooks.jsp");
			}
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
