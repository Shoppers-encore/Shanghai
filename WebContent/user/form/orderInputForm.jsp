<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
	<head>
		<title>${head_orderInputForm}</title>
	</head>
	<body>
		<%@ include file="../form/userHeader.jsp" %>
		
		<!-- Must be removed later -->
		<c:set var="id" value="aaa" scope="session"/>
		
		<!-- If not logged in, redirect to login page -->
		<c:if test="${id eq null}">
			<c:redirect url="userLoginForm.jk"/>
		</c:if>
		
		<!-- When logged in -->
		<c:if test="${id ne null}">
			<div class="container-fluid col-lg-10">
				<div class="mt-3"><h5>${head_orderInputForm}</h5></div>
			</div>
		</c:if>
	</body>
</html>
