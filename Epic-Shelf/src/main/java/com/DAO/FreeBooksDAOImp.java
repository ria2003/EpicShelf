package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.FreeBooks;

public class FreeBooksDAOImp implements FreeBooksDAO {
    private Connection conn;
    
    public FreeBooksDAOImp(Connection conn) {
        this.conn = conn;
    }
    
    @Override
    public List<FreeBooks> getAllFreeBooks() {
        List<FreeBooks> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM free_books";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                FreeBooks b = new FreeBooks();
                b.setId(rs.getInt("id"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setCategory(rs.getString("category"));
                b.setPhotoName(rs.getString("photoName"));
                b.setPdfName(rs.getString("pdfName"));
                list.add(b);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public FreeBooks getBookById(int id) {
        FreeBooks b = null;
        try {
            String sql = "SELECT * FROM free_books WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                b = new FreeBooks();
                b.setId(rs.getInt("id"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setCategory(rs.getString("category"));
                b.setPhotoName(rs.getString("photoName"));
                b.setPdfName(rs.getString("pdfName"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return b;
    }
}

