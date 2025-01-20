package com.entity;

public class Orders {
	private int id;
	private int orderId;
	private String username;
	private String email;
	private String contact;
	private String fullAdd;
	private String payment;
	private String photoName;
	private String title;
	private String author;
	private double price;
	private int quantity;
	private String paymentId;
	private String paymentStatus;
	
	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	private double subtotal;

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public int getQuantity() {
	    return quantity;
	}

	public void setQuantity(int quantity) {
	    this.quantity = quantity;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getFullAdd() {
		return fullAdd;
	}
	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price ;
	}
	
	@Override
	public String toString() {
		return "Orders [id=" + id + ", orderId=" + orderId + ", username=" + username + ", email=" + email
				+ ", contact=" + contact + ", fullAdd=" + fullAdd + ", payment=" + payment + ", photoName=" + photoName
				+ ", title=" + title + ", author=" + author + ", price=" + price + ", quantity=" + quantity
				+ ", paymentId=" + paymentId + ", paymentStatus=" + paymentStatus + ", subtotal=" + subtotal + "]";
	}
	
}
