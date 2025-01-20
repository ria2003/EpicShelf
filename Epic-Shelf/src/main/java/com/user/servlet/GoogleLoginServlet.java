package com.user.servlet;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.UserDAOImp;
import com.DB.DBconnect;
import com.entity.User;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;

@WebServlet("/googleLogin")
public class GoogleLoginServlet extends HttpServlet {
    private static final String CLIENT_ID = "509453706533-08pvfk6tuj8e0glonotab0l910h03sqf.apps.googleusercontent.com";
    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String idTokenString = req.getParameter("idtoken");
            GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                    GoogleNetHttpTransport.newTrustedTransport(), JSON_FACTORY)
                    .setAudience(Collections.singletonList(CLIENT_ID))
                    .build();

            GoogleIdToken idToken = verifier.verify(idTokenString);
            if (idToken != null) {
                GoogleIdToken.Payload payload = idToken.getPayload();
                String email = payload.getEmail();
                String name = (String) payload.get("name");
                UserDAOImp dao = new UserDAOImp(DBconnect.getConn());
                
                // Check if user exists first
                User existingUser = dao.getUserByEmail(email);
                User user;

                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");

                if ("epicshelf25@gmail.com".equals(email)) {
                    if (existingUser != null) {
                        user = existingUser;
                    } else {
                        user = new User();
                        user.setEmail(email);
                        user.setName("Admin");
                        user.setRole("admin");
                        // Save new admin user and get ID
                        int userId = dao.userRegister(user);
                        user.setId(userId);
                    }
                    HttpSession session = req.getSession();
                    session.setAttribute("userObj", user);
                    resp.getWriter().write("{\"redirect\":\"admin/home.jsp\"}");
                } else {
                    if (existingUser != null) {
                        user = existingUser;
                    } else {
                        user = new User();
                        user.setEmail(email);
                        user.setName(name);
                        user.setRole("user");
                        // Save new user and get ID
                        int userId = dao.userRegister(user);
                        user.setId(userId);
                    }
                    HttpSession session = req.getSession();
                    session.setAttribute("userObj", user);
                    resp.getWriter().write("{\"redirect\":\"index.jsp\"}");
                }
            } else {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                resp.getWriter().write("{\"error\":\"Invalid ID token\"}");
            }
        } catch (GeneralSecurityException | IOException e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"error\":\"Authentication failed\"}");
        }
    }
}