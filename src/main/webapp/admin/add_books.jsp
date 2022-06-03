<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									name="bname" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									name="price" aria-describedby="emailHelp">
							</div>

							<div>
								<label>Book Categories </label> <select class="form-control"
									name="categories">
									<option selected>---Select---</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div>
								<label for="inputState">Book Status </label> <select
									class="form-control" id="inputState" name="status">
									<option value="selected">---Select---</option>
									<option value="Active">Active</option>
									<option value="InActive">InActive</option>
								</select>
							</div>
							<Br>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="bimg">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
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