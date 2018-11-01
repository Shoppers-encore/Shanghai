<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
<head>
<title>${head_basketList}</title>
</head>
<body>
	<%@ include file="../form/userHeader.jsp" %>
	<c:if test="${id eq null}">
		<c:redirect url="userLoginForm.jk"/>
	</c:if>
	<c:if test="${id ne null}">
		<div class="container-fluid">
			<div><h5>${totalBasketCount}${basketCount}</h5></div>
		
		<c:forEach var="basketList" items="${basketList}">

		
		</c:forEach>
		</div>
	</c:if>
</body>