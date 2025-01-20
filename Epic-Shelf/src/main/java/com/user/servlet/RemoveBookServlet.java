package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImp;
import com.DB.DBconnect;

@WebServlet("/removeBook")
public class RemoveBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImp dao=new CartDAOImp(DBconnect.getConn());
		boolean f=dao.deleteBook(bid, uid, cid);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("successRemoveMsg", "Book removed from cart");
			resp.sendRedirect("cart.jsp");
		}
		else {
			session.setAttribute("failedRemoveMsg", "Something went wrong on server");
			resp.sendRedirect("cart.jsp");
		}
	}
}
