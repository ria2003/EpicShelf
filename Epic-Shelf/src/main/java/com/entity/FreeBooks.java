package com.entity;

public class FreeBooks {
    private int id;
    private String bookName;
    private String author;
    private String category;
    private String photoName;
    private String pdfName;
    private String description;
    
    // Constructor
    public FreeBooks() {
        super();
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
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
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getPhotoName() {
        return photoName;
    }
    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }
    public String getPdfName() {
        return pdfName;
    }
    public void setPdfName(String pdfName) {
        this.pdfName = pdfName;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
}