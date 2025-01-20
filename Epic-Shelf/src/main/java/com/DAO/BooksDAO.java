package com.DAO;

import java.util.List;

import com.entity.Books;

public interface BooksDAO {
	
	public boolean addBooks(Books b);
	
	public List<Books> getAllBooks();
	
	public Books getBookById(int id);
	
	public boolean updateEditBooks(Books b);
	
	public boolean deleteBooks(int id);
	
	public List<Books> getFictionBook();
	
	public List<Books> getScienceBook();
	
	public List<Books> getBiographyBook();
	
	public List<Books> getKidsBook();
	
	public List<Books> getRecentBook();
	
	public List<Books> getOldBook();
	
	public List<Books> getAllFictionBook();
	
	public List<Books> getAllScienceBook();
	
	public List<Books> getAllBiographyBook();
	
	public List<Books> getAllKidsBook();
	
	public List<Books> getAllRecentBook();
	
	
	public List<Books> getAllOldBook();
	
	public List<Books> getSoldBooks(String email, String cat);
	
	public boolean deleteSoldBooks(String email, String cat, int id);

	public List<Books> getBookBySearch(String ch);
}
