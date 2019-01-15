<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404</title>
</head>
<body>
<%@ include file ="../setting.jsp" %>
	잘못된 페이지 경로입니다.
	<c:forEach var="list" items="${lists}"> 
		${list.name}
	</c:forEach>
</body>
</html>