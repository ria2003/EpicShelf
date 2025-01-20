package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BooksDAOImp;
import com.DB.DBconnect;
import com.entity.BookDetails;
import com.entity.Books;

@WebServlet("/add_books")
@MultipartConfig
public class AddBooks extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bookName");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			Part part = req.getPart("coverImg");
			String fileName = part.getSubmittedFileName();

			Books b = new Books(bookName, author, price, category, status, fileName, "admin", "admin");

			BooksDAOImp dao = new BooksDAOImp(DBconnect.getConn());

			boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();

			if (f) {

				String path = getServletContext().getRealPath("") + "books";
				File file = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("successMsg", "Book added successfully!");
				resp.sendRedirect("admin/addBooks.jsp");
			}

			else {
				session.setAttribute("failedMsg", "Something went wrong on server!");
				resp.sendRedirect("admin/addBooks.jsp");
			}

			// System.out.println(b);
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
