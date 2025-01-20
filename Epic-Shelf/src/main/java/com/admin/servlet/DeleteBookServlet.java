package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImp;
import com.DB.DBconnect;

@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			BooksDAOImp dao = new BooksDAOImp(DBconnect.getConn());
			boolean f = dao.deleteBooks(id);
			HttpSession session = req.getSession();
			
			if (f) {
				session.setAttribute("successMsg", "Book Deleted Successfully!");
				resp.sendRedirect("admin/allBooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("admin/allBooks.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
