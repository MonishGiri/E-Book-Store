package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BooksDAO {
	public boolean addBooks(BookDetails b);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean updateEditBooks(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBook();
	
	public List<BookDetails> getRecentBooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getAllRecentBook();
	
	public List<BookDetails> getAllNewBook();
	
	public List<BookDetails> getAllOldBook();
	
	public List<BookDetails> getBookByOld(String email,String cate);
	
	public boolean oldBookDelete(String email,String cate,int id);
	
	public List<BookDetails> getBookBySearch(String ch);
}
