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
<title>All Old Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center">All Old Book</h3>
		<div class="row p-3" style="margin-right:-109px">
		<%
		BookDAOImpl dao3 = new BookDAOImpl(DBconnect.getCon());
		List<BookDetails> list3 = dao3.getAllOldBook();
		for(BookDetails b:list3)
		{%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="java book img" src="book/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">
							 <a
								href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a><a
								href="" class="btn btn-primary btn-sm ml-1"><%=b.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
							
					</div>
				</div>
			</div>
		<%}
		%>



		</div>
	</div>
</body>
</html>