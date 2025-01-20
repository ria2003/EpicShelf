package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.entity.User;

public class UserDAOImp implements UserDAO {

    private Connection conn;

    public UserDAOImp(Connection conn) {
        super();
        this.conn = conn;
    }
    
    @Override
    public int userRegister(User user) {
        int userId = -1;
        try {
            String sql = "INSERT INTO users(name, email, role) VALUES(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getRole());
            
            int i = ps.executeUpdate();
            if (i == 1) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    userId = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }


    
    @Override
    public boolean updateProfile(User u) {
        boolean f = false;
        try {
            String sql = "update users set name=?, email=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setInt(3, u.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    @Override
    public int getRegisteredCount() {
        int count = 0;
        try {
            String sql = "select count(*) from users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    @Override
    public boolean checkEmail(String email) {
        boolean found = false;
        try {
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                found = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return found;
    }
    
    
    @Override
    public User getUserByEmail(String email) {
        User user = null;
        try {
            String sql = "select * from users where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));  // Changed order - name should be set from name column
                user.setEmail(rs.getString(3)); // Changed order - email should be set from email column
                user.setRole(rs.getString(4)); 
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

	public User login(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean resetPassword(String email, String newPassword) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean checkPassword(int id, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
}
