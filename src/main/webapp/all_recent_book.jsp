<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.*"%>
<%@page import="com.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center">All Recent Book</h3>
		<div class="row p-3" style="margin-right:-109px">
		<%
		BookDAOImpl dao2 = new BookDAOImpl(DBconnect.getCon());
		List<BookDetails> list2 = dao2.getAllRecentBook();
		for(BookDetails b:list2)
		{%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="java book img" src="book/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>
						<%
							if(b.getBookCategory().equals("Old"))
							{%>
							Category:<%=b.getBookCategory() %></p>
							<div class="row">
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><%=b.getPrice() %> <i class="fas fa-rupee-sign"></i></a></a>
						</div>	
							<%}else{%>
								Category:<%=b.getBookCategory() %></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i> Add to cart</a>
							<%
							} else {
							%>
							<a href="Cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i> Add to cart</a>
							<%
							}
							%>
							
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><%=b.getPrice() %> <i class="fas fa-rupee-sign"></i></a>
							</a>
						</div>
							<%}
						%>
							
					</div>
				</div>
			</div>
		<%}
		%>



		</div>
	</div>
</body>
</html>