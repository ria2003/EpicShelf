package com.entity;

public class Books {
	
	private int bookId;
	private String cover;
	private String title;
	private String description;
	private String author;
	private String price;
	private String category;
	private String status;
	private String email;
	
	public Books() {
		super();
	}
	public Books(String cover, String title, String author, String description, String category, String price, String status,
			String email) {
		super();
		this.cover=cover;
		this.title = title;
		this.author = author;
		this.description = description;
		this.category = category;
		this.price = price;
		this.status = status;
		this.email = email;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Books [bookId=" + bookId + ", cover=" + cover + ", title=" + title + ", description=" + description
				+ ", author=" + author + ", price=" + price + ", category=" + category + ", status=" + status
				+ ", email=" + email + "]";
	}
	

}
