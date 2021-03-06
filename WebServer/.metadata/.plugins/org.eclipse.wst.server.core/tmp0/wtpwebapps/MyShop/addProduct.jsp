<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.lang.*"%>

<!DOCTYPE html>
<html>

<jsp:include page="header.jsp" />

<body>

	<%
	String lang = (request.getParameter("language") == null) ? "ko" : request.getParameter("language");
	/* out.println("lang: " + lang); */
	%>

	<fmt:setLocale value="<%=lang%>" />
	<fmt:bundle basename="bundle.message">

		<jsp:include page="menu.jsp" />

		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="title" />
				</h1>
			</div>
		</div>

		<div class="container">

			<div class="text-right">
				<jsp:include page="ko_en.jsp" />
				<a href="logout.jsp" class="btn btn-sm btn-success pull-right"><fmt:message
						key="logout" /></a>
			</div>

			<form name="newProduct" action="./processAddProduct.jsp"
				class="form-horizontal" method="post" enctype="multipart/form-data">

				<!-- 상품 코드 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productId" /></label>
					<div class="col-sm-3">
						<input type="text" id="productId" name="productId"
							class="form-control">
					</div>
				</div>

				<!-- 상품명 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="pname" /></label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control">
					</div>
				</div>

				<!-- 가격 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
					<div class="col-sm-3">
						<input type="text" id="unitPrice" name="unitPrice"
							class="form-control">
					</div>
				</div>

				<!-- 상세 정보 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description" /></label>
					<div class="col-sm-5">
						<textarea name="description" cols="50" rows="2"
							class="form-control"></textarea>
					</div>
				</div>

				<!-- 출판사 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="publisher" /></label>
					<div class="col-sm-3">
						<input type="text" name="publisher" class="form-control">
					</div>
				</div>

				<!-- 분류 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="category" /></label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control">
					</div>
				</div>

				<!-- 재고 수 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
					<div class="col-sm-3">
						<input type="text" id="unitsInStock" name="unitsInStock"
							class="form-control">
					</div>
				</div>

				<!-- 상태 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="condition" /></label>
					<div class="col-sm-3">
						<input type="radio" name="condition" value="New">
						<fmt:message key="condition_New" />
						<input type="radio" name="condition" value="Old">
						<fmt:message key="condition_Old" />
					</div>
				</div>

				<!-- 이미지 업로드 -->
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productImage" /></label>
					<div class="col-sm-5">
						<input type="file" name="productImage" class="form-control">
					</div>
				</div>

				<!-- 등록 -->
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" class="btn btn-primary"
							value="<fmt:message key="button" />" onclick="checkAddProduct()">
					</div>
				</div>


			</form>
		</div>
	</fmt:bundle>
</body>

<jsp:include page="footer.jsp" />

</html>