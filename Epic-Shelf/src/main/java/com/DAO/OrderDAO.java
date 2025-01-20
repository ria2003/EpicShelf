package com.DAO;

import java.util.List;

import com.entity.Orders;

public interface OrderDAO {

	boolean saveOrder(List<Orders> blist);
	
	public List<Orders> getBook(String email);
	
	public List<Orders> getAllOrders();
	
	public int getOrderCount();
	
	public double getTotalSales();
	
	
}
