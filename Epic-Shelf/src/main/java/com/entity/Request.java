package com.entity;

public class Request {
	
	private int requestId;
	private String title;
	private String author;
	private int quantity;
	private String email;
	private String contact;
	private String additional;
	public int getRequestId() {
		return requestId;
	}
	public void setRequestId(int requestId) {
		this.requestId = requestId;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public String getAdditional() {
		return additional;
	}
	public void setAdditional(String additional) {
		this.additional = additional;
	}
	@Override
	public String toString() {
		return "Request [requestId=" + requestId + ", title=" + title + ", author=" + author + ", quantity=" + quantity
				+ ", email=" + email + ", contact=" + contact + ", additional=" + additional + "]";
	}
	
}
