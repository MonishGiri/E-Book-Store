<%@page import="com.entity.*"%>
<%@page import="com.DB.*"%>
<%@page import="com.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBconnect.getCon());
	BookDetails b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 200px; width: 150px"><br>
				<h4 class="mt-3">
					Book Name:<span class="text-success"> <%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-info"> <%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-danger"> <%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
				if (b.getBookCategory().equals("Old")) {
				%>
				<h5 class="text-primary font-weight-bold">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="far fa-envelope"></i> Email:
					<%=b.getEmail()%></h5>
				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-center text-success p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-center text-warning p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Easy Returns</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Delivery</p>
					</div>

				</div>
				
				<%
					if(b.getBookCategory().equals("Old"))
					{%>
						<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
						Continue Shopping</a> <a href="" class="btn btn-primary"><%=b.getPrice() %> <i
						class="fas fa-rupee-sign"></i></a>
				</div>
					<%}
					else{
					%>	
					<div class="text-center p-3">
					<a href="" class="btn btn-danger"><i class="fas fa-cart-plus"></i>
						Add to Cart</a> <a href="" class="btn btn-primary"><%=b.getPrice() %> <i
						class="fas fa-rupee-sign"></i></a>
					<%}
				%>

			</div>
		</div>
	</div>
</body>
</html>