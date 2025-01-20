package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.Request;

public class RequestDAOImp implements RequestDAO {
    private Connection conn;

    public RequestDAOImp(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addRequest(Request request) {
        boolean success = false;
        try {
            String sql = "INSERT INTO requests(title, author, quantity, email, contact, additional_notes) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, request.getTitle());
            ps.setString(2, request.getAuthor());
            ps.setInt(3, request.getQuantity());
            ps.setString(4, request.getEmail());
            ps.setString(5, request.getContact());
            ps.setString(6, request.getAdditional());

            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    @Override
    public List<Request> getAllRequests() {
        List<Request> requests = new ArrayList<>();
        try {
            String sql = "SELECT * FROM requests ORDER BY request_id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Request request = new Request();
                request.setRequestId(rs.getInt("request_id"));
                request.setTitle(rs.getString("title"));
                request.setAuthor(rs.getString("author"));
                request.setQuantity(rs.getInt("quantity"));
                request.setEmail(rs.getString("email"));
                request.setContact(rs.getString("contact"));
                request.setAdditional(rs.getString("additional_notes"));
                requests.add(request);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return requests;
    }

    @Override
    public boolean deleteRequest(int requestId) {
        boolean success = false;
        try {
            String sql = "DELETE FROM requests WHERE request_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, requestId);
            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}

