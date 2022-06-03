package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBconnect;

/**
 * Servlet implementation class DeleteOldBook
 */
@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String em = request.getParameter("em");
			int id = Integer.parseInt("id");
			BookDAOImpl dao = new BookDAOImpl(DBconnect.getCon());
			boolean f = dao.oldBookDelete(em, "Old",id);
			
			HttpSession session = request.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Old Book Deleted Successfully");
				response.sendRedirect("old_book.jsp");
			}
			else
			{
				session.setAttribute("succMsg", "Something wrong on server");
				response.sendRedirect("old_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
