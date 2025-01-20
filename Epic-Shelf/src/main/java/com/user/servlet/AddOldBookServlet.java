package com.user.servlet;

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

@WebServlet("/addOldBooks")
@MultipartConfig
public class AddOldBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title = req.getParameter("bookName");
			String author = req.getParameter("author");
			String description = req.getParameter("description");
			String price = req.getParameter("price");
			String category = "Old";
			String status = "Active";
			Part part = req.getPart("coverImg");
			String cover = part.getSubmittedFileName();

			String email=req.getParameter("email");
			String name=req.getParameter("name");
			
			Books b = new Books(cover, title, author, description, category, price, status, email);

			BooksDAOImp dao = new BooksDAOImp(DBconnect.getConn());

			boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();

			if (f) {

				String path = getServletContext().getRealPath("") + "uploads";
				File file = new File(path);
				part.write(path + File.separator + cover);

				session.setAttribute("successOldMsg", "Book published successfully!");
				resp.sendRedirect("sellBook.jsp");
			}

			else {
				session.setAttribute("failedOldMsg", "Something went wrong on server!");
				resp.sendRedirect("sellBook.jsp");
			}

			// System.out.println(b);
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

}

