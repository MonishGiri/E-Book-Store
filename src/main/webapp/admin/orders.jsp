<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"/>
	</c:if>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-stripped">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone Number</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<%
				BookOrderImpl dao = new BookOrderImpl(DBconnect.getCon());
				List<Book_Order> blist = dao.getAllOrder();
				for(Book_Order b:blist)
				{%>
				<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getUserName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFullAddress() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
			</tr>
				<%}
			%>
			
		</tbody>
	</table>

	<div style="margin-top: 130px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>