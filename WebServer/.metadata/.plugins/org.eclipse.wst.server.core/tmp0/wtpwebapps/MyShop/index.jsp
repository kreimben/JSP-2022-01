<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<%@ include file="header.jsp"%>

<body>

	<%
	String lang = (request.getParameter("language") != null) ? request.getParameter("language") : "ko";
	%>

	<fmt:setLocale value="<%=lang%>" />

	<%@ include file="menu.jsp"%>

	<%!String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";%>
	<fmt:bundle basename="bundle.message">

		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<%=greeting%>
				</h1>
			</div>
		</div>

		<jsp:include page="ko_en.jsp" />

		<div class="container">
			<div class="text-center">
				<h3>
					<fmt:message key="welcome" />
				</h3>
			</div>
		</div>

	</fmt:bundle>
</body>

<%@ include file="footer.jsp"%>

</html>