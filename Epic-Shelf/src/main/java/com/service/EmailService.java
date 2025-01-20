package com.service;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import com.entity.Orders;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EmailService {
    private final String fromEmail = "epicshelf25@gmail.com"; 
    private final String password = "rovf euxu vefj nwrj"; 

    public void sendOrderInvoice(String toEmail, List<Orders> orders, String customerName) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Your EpicShelf Order Invoice");

            // Create HTML invoice
            String invoiceHtml = generateInvoiceHtml(orders, customerName);
            message.setContent(invoiceHtml, "text/html; charset=utf-8");

            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private String generateInvoiceHtml(List<Orders> orders, String customerName) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
        String currentDate = sdf.format(new Date());
        
        double totalAmount = 0;
        StringBuilder itemsHtml = new StringBuilder();
        
        for (Orders order : orders) {
            totalAmount += order.getSubtotal();
            itemsHtml.append(String.format("""
                <tr>
                    <td style='padding: 10px; border-bottom: 1px solid #ddd;'>%s</td>
                    <td style='padding: 10px; border-bottom: 1px solid #ddd;'>%s</td>
                    <td style='padding: 10px; border-bottom: 1px solid #ddd;'>%d</td>
                    <td style='padding: 10px; border-bottom: 1px solid #ddd;'>₹%.2f</td>
                </tr>
                """, 
                order.getTitle(),
                order.getAuthor(),
                order.getQuantity(),
                order.getSubtotal()
            ));
        }

        return String.format("""
            <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; line-height: 1.6; }
                    .invoice-container { max-width: 800px; margin: 0 auto; padding: 20px; }
                    .header { text-align: center; margin-bottom: 30px; }
                    .invoice-details { margin-bottom: 20px; }
                    table { width: 100%%; border-collapse: collapse; }
                    th { background-color: #f8f9fa; padding: 10px; text-align: left; }
                </style>
            </head>
            <body>
                <div class='invoice-container'>
                    <div class='header'>
                        <h1>EpicShelf</h1>
                        <h2>Order Invoice</h2>
                    </div>
                    
                    <div class='invoice-details'>
                        <p><strong>Date:</strong> %s</p>
                        <p><strong>Customer Name:</strong> %s</p>
                        <p><strong>Order ID:</strong> %s</p>
                    </div>
                    
                    <table>
                        <thead>
                            <tr>
                                <th>Book Title</th>
                                <th>Author</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            %s
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan='4' style='text-align: right; padding: 10px;'><strong>Total Amount:</strong></td>
                                <td style='padding: 10px;'><strong>₹%.2f</strong></td>
                            </tr>
                        </tfoot>
                    </table>
                    
                    <div style='margin-top: 30px;'>
                        <p>Thank you for shopping with EpicShelf!</p>
                        <p>If you have any questions, please contact our support team.</p>
                    </div>
                </div>
            </body>
            </html>
            """,
            currentDate,
            customerName,
            orders.get(0).getOrderId(),
            itemsHtml.toString(),
            totalAmount
        );
    }
}