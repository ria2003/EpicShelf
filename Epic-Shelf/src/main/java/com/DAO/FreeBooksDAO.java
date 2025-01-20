package com.DAO;

import java.util.List;
import com.entity.FreeBooks;

public interface FreeBooksDAO {
    public List<FreeBooks> getAllFreeBooks();
    public FreeBooks getBookById(int id);
}