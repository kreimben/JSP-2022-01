<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<jsp:include page="header.jsp" />

<body>

	<%
	String lang = (request.getParameter("language") != null) ? request.getParameter("language") : "ko";
	%>

	<fmt:setLocale value="<%=lang%>" />
	<jsp:include page="menu.jsp" />
	<fmt:bundle basename="bundle.message">
		<div class="jumbotron">
			<div class="container">
				<h2 class="alert alert-danger">
					<fmt:message key="not_found_product_id" />
				</h2>
			</div>
		</div>

		<div class="container">
			<p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
			<p>
				<a href="products.jsp" class="btn btn-secondary"><fmt:message
						key="product_list" /> &raquo;</a>
		</div>
	</fmt:bundle>
</body>

<jsp:include page="footer.jsp" />

</html>