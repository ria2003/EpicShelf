package com.user.servlet;

import javax.servlet.annotation.WebServlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DAO.FreeBooksDAOImp;
import com.DB.DBconnect;
import com.entity.FreeBooks;

@WebServlet("/viewPdfContent")
public class ViewPdfServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("bid"));
            FreeBooksDAOImp dao = new FreeBooksDAOImp(DBconnect.getConn());
            FreeBooks book = dao.getBookById(id);
            
            if(book != null) {
                String pdfPath = getServletContext().getRealPath("/books/pdfs/" + book.getPdfName());
                File file = new File(pdfPath);
                
                resp.setContentType("application/pdf");
                resp.setHeader("Content-Disposition", "inline; filename=\"" + book.getBookName() + ".pdf\"");
                
                try (FileInputStream in = new FileInputStream(file);
                     OutputStream out = resp.getOutputStream()) {
                    byte[] buffer = new byte[4096];
                    int length;
                    while ((length = in.read(buffer)) > 0) {
                        out.write(buffer, 0, length);
                    }
                }
            }
        } catch(Exception e) {
            resp.sendRedirect("error.jsp");
            e.printStackTrace();
        }
    }
}

