package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImp;
import com.DAO.OrderDAOImp;
import com.DB.DBconnect;
import com.entity.Cart;
import com.entity.Orders;
import com.service.EmailService;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String contact = req.getParameter("contact");
            String fullAddress = req.getParameter("address") + ", " + 
                               req.getParameter("landmark") + ", " + 
                               req.getParameter("city") + ", " + 
                               req.getParameter("state") + ", " + 
                               req.getParameter("pincode");
            String payment = req.getParameter("payment");

            CartDAOImp cartDao = new CartDAOImp(DBconnect.getConn());
            List<Cart> cartItems = cartDao.getBookByUser(id);
            
            if (cartItems.isEmpty()) {
                session.setAttribute("failedMsg", "Add a few books..");
                resp.sendRedirect("cart.jsp");
                return;
            }
            
            if ("selected".equals(payment)) {
                session.setAttribute("failedOrderMsg", "Please choose payment method");
                resp.sendRedirect("cart.jsp");
                return;
            }

            OrderDAOImp orderDao = new OrderDAOImp(DBconnect.getConn());
            ArrayList<Orders> orderList = new ArrayList<Orders>();
            Random r = new Random();
            double orderTotal = 0;

            for (Cart cartItem : cartItems) {
                Orders order = new Orders();
                order.setOrderId(r.nextInt(1000));
                order.setUsername(name);
                order.setEmail(email);
                order.setContact(contact);
                order.setFullAdd(fullAddress);
                order.setPhotoName(cartItem.getPhotoName());
                order.setTitle(cartItem.getBookName());
                order.setAuthor(cartItem.getAuthor());
                order.setQuantity(cartItem.getQuantity());
                order.setPrice(cartItem.getPrice());
                order.setSubtotal(cartItem.getSubtotal());
                order.setPayment(payment);
                orderTotal += cartItem.getSubtotal();
                orderList.add(order);
            }

            boolean ordersSaved = orderDao.saveOrder(orderList);
            if (ordersSaved) {
                session.setAttribute("successOrderMsg", "Order Placed Successfully. Check your email for invoice!");
             // invoice
                EmailService emailService = new EmailService();
                emailService.sendOrderInvoice(
                    email,  
                    orderList,  
                    name   
                );
            } else {
                session.setAttribute("failedOrderMsg", "Order Failed");
            }
            resp.sendRedirect("cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedOrderMsg", "Order Failed Due to System Error");
            resp.sendRedirect("cart.jsp");
        }
    }
}
