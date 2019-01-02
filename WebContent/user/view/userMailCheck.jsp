<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<form name="mailCheckForm">
			<div class="container mailCheckContainer">
					<div>
						<div class="mt-4 mb-2"> ${msg_confirmAuthKey}</div>
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