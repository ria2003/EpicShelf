package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Orders;

public class OrderDAOImp implements OrderDAO {

	private Connection conn;

	public OrderDAOImp(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveOrder(List<Orders> blist) {
		boolean f = false;
		try {

			String sql = "insert into orders (orderId, name, email, address, contact, photoName, title, author, price, subtotal, payment, quantity) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			double cartTotal = blist.stream().mapToDouble(b -> b.getSubtotal()).sum();

			for (Orders b : blist) {
				ps.setInt(1, b.getOrderId());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAdd());
				ps.setString(5, b.getContact());
				ps.setString(6, b.getPhotoName());
				ps.setString(7, b.getTitle());
				ps.setString(8, b.getAuthor());
				ps.setDouble(9, cartTotal); // total cart price
				ps.setDouble(10, (b.getPrice()) * b.getQuantity()); // subtotal
				ps.setString(11, b.getPayment());
				ps.setInt(12, b.getQuantity());
				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Orders> getBook(String email) {

		List<Orders> list = new ArrayList<Orders>();
		Orders o = null;

		try {
			String sql = "select * from orders where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Orders();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getInt(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setContact(rs.getString(6));
				o.setPhotoName(rs.getString(7));
				o.setTitle(rs.getString(8));
				o.setAuthor(rs.getString(9));
				o.setPrice(rs.getDouble(10));
				o.setSubtotal(rs.getDouble(11));				
				o.setPayment(rs.getString(12));
				o.setQuantity(rs.getInt(13));
				list.add(o);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Orders> getAllOrders() {
		List<Orders> list = new ArrayList<Orders>();
		Orders o = null;

		try {
			String sql = "select * from orders";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Orders();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getInt(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setContact(rs.getString(6));
				o.setPhotoName(rs.getString(7));
				o.setTitle(rs.getString(8));
				o.setAuthor(rs.getString(9));
				o.setPrice(rs.getDouble(10));
				o.setSubtotal(rs.getDouble(11));				
				o.setPayment(rs.getString(12));
				o.setQuantity(rs.getInt(13));
				list.add(o);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int getOrderCount() {
		int count = 0;
		try {
			String sql = "select count(*) from orders";
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

	public double getTotalSales() {
		double sales = 0;
		try {
			String sql = "select sum(price) from orders";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				sales = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sales;
	}

}
