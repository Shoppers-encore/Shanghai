<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
	<head>
		<title>메인 페이지</title>
	</head>
	<body>
      	<c:if test="${sessionScope.memid ne null}">
		<div id="chat">
        	<img id="chatImg" src="images/chaticon.jpg" onclick="chatting()">
      	</div>
      	<div id="cart">
			<img id="cartImg" src="images/cart_red.png">
			<form><input type="hidden" name="id" value="${sessionScope.memid}"></form>
		</div>
		</c:if>
	</body>
</html>