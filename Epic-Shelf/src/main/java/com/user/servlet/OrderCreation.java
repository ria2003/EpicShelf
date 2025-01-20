package com.user.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.razorpay.Utils;
import com.DAO.CartDAOImp;
import com.DB.DBconnect;
import com.entity.Cart;
import com.entity.User;

public class OrderCreation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String KEY_ID = "rzp_test_7SrJ2IWTH0c0Iz";
    private static final String KEY_SECRET = "gAAh25BzOu7vw2K7T4oIh5Ba";
    
    public OrderCreation() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Initialize RazorPay Client
            RazorpayClient client = new RazorpayClient(KEY_ID, KEY_SECRET);
            
            // Get cart total from session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("userObj");
            CartDAOImp cartDao = new CartDAOImp(DBconnect.getConn());
            List<Cart> cartItems = cartDao.getBookByUser(user.getId());
            
            // Calculate total amount
            double totalAmount = 0.0;
            for (Cart item : cartItems) {
                totalAmount += item.getSubtotal();
            }
            
            // Convert to paise (Razorpay expects amount in smallest currency unit)
            int amountInPaise = (int) Math.round(totalAmount * 100);
            
            // Create order options
            JSONObject options = new JSONObject();
            options.put("amount", amountInPaise);
            options.put("currency", "INR");
            options.put("receipt", "order_" + System.currentTimeMillis());
            options.put("payment_capture", true);
            
            // Create Razorpay Order
            Order order = client.orders.create(options);
            String orderId = order.get("id");
            
            // Send order ID back to client
            response.getWriter().append(orderId);
            
        } catch (RazorpayException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().append("Error creating order: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Initialize RazorPay Client
            RazorpayClient client = new RazorpayClient(KEY_ID, KEY_SECRET);
            
            // Get payment details from request
            String razorpayPaymentId = request.getParameter("razorpay_payment_id");
            String razorpayOrderId = request.getParameter("razorpay_order_id");
            String razorpaySignature = request.getParameter("razorpay_signature");
            
            // Create JSON object with payment details
            JSONObject options = new JSONObject();
            options.put("razorpay_payment_id", razorpayPaymentId);
            options.put("razorpay_order_id", razorpayOrderId);
            options.put("razorpay_signature", razorpaySignature);
            
            // Verify payment signature
            boolean isValidSignature = Utils.verifyPaymentSignature(options, KEY_SECRET);
            
            HttpSession session = request.getSession();
            
            if (isValidSignature) {
                session.setAttribute("successOrderMsg", "Payment Successful and Order Placed");
                response.getWriter().append("Payment successful and signature verified");
                
               
                
            } else {
                // Payment verification failed
                session.setAttribute("failedOrderMsg", "Payment Verification Failed");
                response.getWriter().append("Payment failed: Signature verification failed");
            }
            
        } catch (RazorpayException e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("failedOrderMsg", "Payment Processing Error");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().append("Error processing payment: " + e.getMessage());
        }
    }
}