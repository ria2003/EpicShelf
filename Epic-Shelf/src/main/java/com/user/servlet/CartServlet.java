package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImp;
import com.DAO.CartDAOImp;
import com.DB.DBconnect;
import com.entity.BookDetails;
import com.entity.Books;
import com.entity.Cart;

@WebServlet("/cart")
@MultipartConfig
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BooksDAOImp dao=new BooksDAOImp(DBconnect.getConn());
			Books b=dao.getBookById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setPhotoName(b.getCover());
			c.setBookName(b.getTitle());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImp dao2=new CartDAOImp(DBconnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("addCart", "Book added to cart");
				resp.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute("failed", "Something went wrong on server");
				resp.sendRedirect("index.jsp");
			}
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
