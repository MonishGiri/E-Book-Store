package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.*;
import com.DB.DBconnect;
import com.entity.BookDetails;
import com.entity.Cart;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/Cart")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DBconnect.getCon());
			BookDetails b =  dao.getBookById(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Float.parseFloat(b.getPrice()));
			c.setTotalPrice(Float.parseFloat(b.getPrice()));
			
			CartDAOImpl dao2 = new CartDAOImpl(DBconnect.getCon());
			boolean f = dao2.addCart(c);
			
			HttpSession session = request.getSession();
			
			if(f) {
				session.setAttribute("addCart", "Book Added to Cart Successfully");
				response.sendRedirect("all_new_book.jsp");
			}
			else {
				session.setAttribute("failed", "Something went wrong on Server");
				response.sendRedirect("all_new_book.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
