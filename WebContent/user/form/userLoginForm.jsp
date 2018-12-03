<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>

<html>
	<head>
	 	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="${project}shanghai_style.css">
	    <title>${head_main}</title>
	</head>
	<!-- Status: No User-->
	<c:if test="${sessionScope.id eq null}">	
	<body>
		<div class="login">
			<form class="form-signin" method="post" action="userLoginPro.jk" name="loginform">
		  		<a href="main.jk">
		  			<img class="pt-0 mt-0 mb-4 w-25" src="/urPresent/images/brandLogo.png" alt="UrPresent Brand Logo">
		  		</a>
		     	<input type="text" name="id" class="form-control" placeholder="${str_id}" required autofocus>   			 	
		 	 	<input type="password" name="password" class="form-control" placeholder="${str_passwd}" required>	 		
		  		<button class="btn btn-lg btn-secondary btn-block" type="submit">${btn_login}</button>
		  		<a href="userInputForm.jk">${page_input}</a> |
		  		<a onclick="window.open('findId.jk','아이디 찾기','width=400,height=400,location=no,status=no,scrollbars=no');">${page_findId}</a> |
				<a onclick="window.open('findPassword.jk','비밀번호 찾기','width=400,height=400,location=no,status=no,scrollbars=no');">${page_findPasswd}</a>
		  		<p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>	
		  	</form>
		</div>
	</body>
	</c:if>
	<!-- Status: User logged-in -->
	 <c:if test="${sessionScope.id ne null}">
		<c:redirect url="userMyPage.jk"/>		
	</c:if>
</html>

