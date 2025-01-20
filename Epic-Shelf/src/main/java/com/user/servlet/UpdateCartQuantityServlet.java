package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

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

@WebServlet("/updateCartQuantity")
public class UpdateCartQuantityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int cartId = Integer.parseInt(req.getParameter("cartId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            double price = Double.parseDouble(req.getParameter("price"));
            double totalPrice = price * quantity;
            
            Connection conn = DBconnect.getConn();
            CartDAOImp dao = new CartDAOImp(conn);
            
            boolean isUpdated = dao.updateQuantity(cartId, quantity, price, totalPrice);
            resp.getWriter().write(isUpdated ? "success" : "failure");
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("error");
        }
    }
}



