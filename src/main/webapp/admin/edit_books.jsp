<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DAO.*"%>
<%@ page import="com.DB.*"%>
<%@ page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBconnect.getCon());
						BookDetails b = dao.getBookById(id);
						%>

						<form action="../edit_books" method="post">
							<input type="hidden" name="id" value="<%= b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									name="bname" aria-describedby="emailHelp" value=<%=b.getBookName() %>>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									name="author" value=<%=b.getAuthor() %>>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									name="price" aria-describedby="emailHelp" value=<%=b.getPrice() %>>
							</div>


							<div>
								<label for="inputState">Book Status </label> <select
									class="form-control" id="inputState" name="status">
									<% if("Active".equals(b.getStatus())){%>
										<option value="Active">Active</option>
										<option value="InActive">InActive</option>
									<% }
									else{%>
										<option value="Active">Active</option>
										<option value="InActive">InActive</option>
									<%}
									%>
									
								</select>
							</div>
							<Br>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 130px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>