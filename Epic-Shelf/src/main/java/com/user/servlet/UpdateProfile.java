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

@WebServlet("/updateProfile")
public class UpdateProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String contact = req.getParameter("contact");
			String password = req.getParameter("password");
			
			User u=new User();
			u.setId(id);
			u.setName(name);
			u.setEmail(email);
			//u.setContact(contact);
			
			UserDAOImp dao=new UserDAOImp(DBconnect.getConn());
			
			HttpSession session = req.getSession();
			
			boolean f=dao.checkPassword(id, password);
			
			if (f) {
				boolean f2=dao.updateProfile(u);
				if(f2) {
					session.setAttribute("successMsg", "Profile Update Successful!");
					resp.sendRedirect("googleLogin.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Something went wrong on the server.");
					resp.sendRedirect("editProfile.jsp");
				}
			}
			else {
				session.setAttribute("failedMsg", "Incorrect Password");
				resp.sendRedirect("editProfile.jsp");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
