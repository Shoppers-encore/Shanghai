<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>썸네일</title>
</head>
<body>
	<%@ include file="../../setting.jsp" %>
	<form name="thumb" encType="multipart/form-data" method="post" action="thumbnailInputPro.jk">
		<input type="file" name="thumb">
		<br><br>
		<input type="submit" class="btn btn-primary" value="${str_send}">
		<input class="btn btn-secondary" type="button" value="${btn_cancel}" onclick="self.close()">
	</form>
</body>
</html>