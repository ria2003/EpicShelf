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

@WebServlet("/edit_book")
@MultipartConfig
public class EditBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bookName");
            String author = req.getParameter("author");
            String description = req.getParameter("description");
            String price = req.getParameter("price");
            String category = req.getParameter("category");
            String status = req.getParameter("status");

            Part part = req.getPart("coverImg");
            String fileName = part.getSubmittedFileName(); // New file name
            String oldFileName = req.getParameter("oldCoverImg"); // Old file name from the form

            // Determine the file name to store
            String photoName = (fileName.isEmpty()) ? oldFileName : fileName;

            // Populate the BookDetails object
            Books b = new Books();
            b.setBookId(id);
            b.setCover(photoName);
            b.setTitle(bookName);
            b.setAuthor(author);
            b.setDescription(description);
            b.setCategory(category);
            b.setPrice(price);
            b.setStatus(status);
            

            BooksDAOImp dao = new BooksDAOImp(DBconnect.getConn());
            boolean f = dao.updateEditBooks(b);

            HttpSession session = req.getSession();
            if (f) {
                if (!fileName.isEmpty()) {
                    // Save the new file
                    String path = getServletContext().getRealPath("") + "uploads";
                    File file = new File(path);
                    part.write(path + File.separator + fileName);
                }

                session.setAttribute("successMsg", "Book Details Updated Successfully!");
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
