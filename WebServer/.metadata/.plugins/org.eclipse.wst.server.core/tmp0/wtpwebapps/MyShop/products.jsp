<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<!DOCTYPE html>
<html>

<jsp:include page="header.jsp" />

<body>

	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">책 목록</h1>
		</div>
	</div>

	<%
	ProductRepository dao = ProductRepository.getInstance();
	ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>

	<div class="container">
		<div class="row" align="center">
			<%
			for (int i = 0; i < listOfProducts.size(); i++) {
				Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">

				<img src="./resources/images/<%=product.getFilename() %>" style="width: 100%">


				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%></p>
				<p>분류: <%= product.getCategory() %></p>
				<p>출판사: <%=product.getPublisher()%></p>
				<p>가격: <%=product.getUnitPrice()%>원</p>
				<p>
					<a href="./product.jsp?id=<%=product.getProductId()%>"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>

</html>