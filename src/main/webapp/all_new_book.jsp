<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.*"%>
<%@page import="com.DAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

/* Toast */
#toast {
  min-width: 300px;
  position: fixed;
  bottom: 30px;
  left: 50%;
  margin-left: -125px;
  background: #333;
  padding: 10px;
  color: white;
  text-align: center;
  z-index: 1;
  font-size: 18px;
  visibility: hidden;
  box-shadow: 0px 0px 100px #000;
}

#toast.display{
  visibility: visible;
  animation: fadeIn 0.5s, fadeOut 0.5s 2.5s
}

@keyframes fadein {
  from{bottom:0;opacity:0;}
} to{
bottom:30px; opacity:1}


@keyframes fadeout {
  from {
  bottom:30px;
  opacity: 1;}
  to{
  bottom: 0;
  opacity:0;}
}

/* Toast */
</style>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>
<c:if test="${not empty addCart }">
	<div id="toast"> ${addCart}
		<script type="text/javascript">
			showToast();
			function showToast(content){
				$('#toast').addClass("display");
				$('#toast').html(content);
				setTimeout(()=>{
					$('#toast').removeClass("display");
				},2000)
			}
		</script>
		<c:remove var="addCart" scope="session"/>
	</div>
</c:if>

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center">All New Book</h3>
		<div class="row p-3" style="margin-right:-109px">
		<%
			BookDAOImpl dao = new BookDAOImpl(DBconnect.getCon());
			List<BookDetails> list = dao.getAllNewBook();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="java book img" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row" style="margin-right:-109px">
							
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
							
							 <a	href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a><a
								href="" class="btn btn-primary btn-sm ml-1"><%=b.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
	</div>
</body>
</html>