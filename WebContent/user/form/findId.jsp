<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<form name="findIdForm">
	<div class="container">
			<div>
				<br> ${msg_confirmAuthKey} <br><br>
				name : <input class="form-control" type="text"  name="name"> <br>
				email : <input class="form-control" type="text" name="email"> <br>
			</div>
			<div class="text-center">
				<input class="btn btn-sm" type="button" name="confirm" value="${btn_confirm}">
			</div>
	</div>
</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	//<!--
		$(document).ready(function(){
			
		});
	//-->
</script>
</html>