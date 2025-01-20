package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImp;
import com.DB.DBconnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			UserDAOImp dao=new UserDAOImp(DBconnect.getConn());
			
			HttpSession session=req.getSession();
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User u=new User();
				u.setName("Admin");
				session.setAttribute("userObj", u);
				resp.sendRedirect("admin/home.jsp");
			}
			else {
				
				User u=dao.login(email, password);
				if (u!=null) {
					session.setAttribute("userObj", u);
					resp.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Invalid Email or Password");
					resp.sendRedirect("login.jsp");
				}
				
			}
			
			//System.out.println(email+" "+password);
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
