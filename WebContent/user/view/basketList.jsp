<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
<head>
<title>상하이몰 - 장바구니 상세페이지</title>
</head>
<body>
	<c:if test="${id eq null}">
		<c:redirect url="userLoginForm.jk"/>
	</c:if>
	<c:if test="${id ne null}">
		<c:forEach var="" items="">
		</c:forEach>
	</c:if>
</body>