package com.entity;

public class BookDetails {
	
	private int bookId;
	private String bookName;
	private String author;
	private String price;
	private String category;
	private String status;
	private String photoName;
	private String email;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BookDetails() {
		super();
	}
	public BookDetails(String bookName, String author, String price, String category, String status, String photoName,
			String email, String name) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.category = category;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
		this.name=name;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
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
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", category=" + category + ", status=" + status + ", photoName=" + photoName + ", email=" + email
				+ ", name=" + name + "]";
	}

}
