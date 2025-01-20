package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {
	
	public boolean addBooks(BookDetails b);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean updateEditBooks(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getFictionBook();
	
	public List<BookDetails> getScienceBook();
	
	public List<BookDetails> getBiographyBook();
	
	public List<BookDetails> getKidsBook();
	
	public List<BookDetails> getRecentBook();
	
	public List<BookDetails> getOldBook();
	
	public List<BookDetails> getAllFictionBook();
	
	public List<BookDetails> getAllScienceBook();
	
	public List<BookDetails> getAllBiographyBook();
	
	public List<BookDetails> getAllKidsBook();
	
	public List<BookDetails> getAllRecentBook();
	
	
	public List<BookDetails> getAllOldBook();
	
	public List<BookDetails> getSoldBooks(String email, String cat);
	
	public boolean deleteSoldBooks(String email, String cat, int id);

	public List<BookDetails> getBookBySearch(String ch);
}
