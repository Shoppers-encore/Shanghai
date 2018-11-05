<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<form name="mailCheckForm">
	<div class="container">
			<div>
				<br> ${msg_confirmAuthKey} <br><br>
				<input class="form-control" type="text"  name="emailcode"> <br>
			</div>
			<div class="text-center">
				<input class="btn btn-sm" type="button" value="${btn_confirm}" onclick="matchAuthKey()">
				<input class="btn btn-sm" type="button" value="${btn_resend}" onclick="window.location.reload()">
				<input type="hidden" name="mailnum" value="${num}">
			</div>
	</div>
</form>
</body>
</html>