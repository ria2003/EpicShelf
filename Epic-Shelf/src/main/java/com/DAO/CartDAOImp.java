package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.Cart;

public class CartDAOImp implements CartDAO {

		private Connection conn;
		
		public CartDAOImp(Connection conn)
		{
			this.conn=conn;
		}
		
		public boolean addCart(Cart c)
		{
			boolean f=false;
			try {
				String sql="insert into cart(bid,uid,photoName,bookName,author,price,quantity,totalPrice,subtotal) values(?,?,?,?,?,?,1,?,?)";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, c.getBid());
	            ps.setInt(2, c.getUid());
	            ps.setString(3, c.getPhotoName());
	            ps.setString(4, c.getBookName());
	            ps.setString(5, c.getAuthor());
	            ps.setDouble(6, c.getPrice());
	            ps.setDouble(7, c.getPrice()); // subtotal equals price for quantity 1
	            ps.setDouble(8, c.getPrice()); // initial totalPrice
				
				int i=ps.executeUpdate();
				if(i==1) {
					f=true;
				}
				
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return f;
			
			}

		@Override
		public boolean deleteBook(int bid, int uid, int cid) {
			boolean f=false;
			
			try {
				String sql="delete from cart where bid=? and uid=? and cid=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, bid);
				ps.setInt(2, uid);
				ps.setInt(3, cid);
				
				int i=ps.executeUpdate();
				if(i==1) {
					f=true;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}

		@Override
		public List<Cart> getBookByUser(int userId) {
			List<Cart> list=new ArrayList<Cart>();
			Cart c=null;
			double cartTotal=0;
			try {
				String sql="select * from cart where uid=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, userId);
				
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					 c = new Cart();
			            c.setCid(rs.getInt(1));
			            c.setBid(rs.getInt(2));
			            c.setUid(rs.getInt(3));
			            c.setPhotoName(rs.getString(4));
			            c.setBookName(rs.getString(5));
			            c.setAuthor(rs.getString(6));
			            c.setPrice(rs.getDouble(7));
			            c.setQuantity(rs.getInt(8));
			            double subtotal = rs.getDouble(7) * rs.getInt(8); // Calculate subtotal
			            c.setSubtotal(subtotal);
			            cartTotal += subtotal;
			            list.add(c);
			        }
			        
			        // Set total price for all items after loop
			        for(Cart item : list) {
			            item.setTotalPrice(cartTotal);
			        }
			    }
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		
		
		@Override
		public boolean updateQuantity(int cartId, int quantity, double price, double totalPrice) {
	        boolean updated = false;
	        PreparedStatement ps = null;
	        
	        try {
	            // Update quantity and subtotal for specific item
	            String sql = "UPDATE cart SET quantity = ?, subtotal = ? WHERE cid = ?";
	            ps = this.conn.prepareStatement(sql);
	            ps.setInt(1, quantity);
	            ps.setDouble(2, price * quantity); // subtotal = price * quantity
	            ps.setInt(3, cartId);
	            
	            if(ps.executeUpdate() > 0) {
	                // Update cart total
	                sql = "UPDATE cart c1, (SELECT uid, SUM(subtotal) as total FROM cart GROUP BY uid) c2 " +
	                     "SET c1.totalPrice = c2.total " +
	                     "WHERE c1.uid = c2.uid AND c1.cid = ?";
	                ps = this.conn.prepareStatement(sql);
	                ps.setInt(1, cartId);
	                updated = ps.executeUpdate() > 0;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if(ps != null) ps.close();
	            } catch(SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return updated;
	    }
	



		


		
}
