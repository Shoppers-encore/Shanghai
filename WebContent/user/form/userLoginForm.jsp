<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<!-- 로그인 한 페이지(admMain_loggedon)랑 안 한 페이지(이거) 합쳐서 admMain 페이지 하나로 하면 될 것 같아요 -->
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${project}shanghai_style.css">
</head>
<!-- Status: No User-->
<c:if test="${sessionScope.id eq null}">	
<body class="login">
	<form class="form-signin" method="post" action="userLoginPro.jk" name="loginform">
  		<a href="userMain.jk">
  			<img class="pt-0 mt-0 mb-4" src="images/shanghai_icon.png" alt="logo" width="350" height="200">
  		</a>
     	<input type="text" name="id" class="form-control" placeholder="${str_id}" required autofocus>   			 	
 	 	<input type="password" name="password" class="form-control" placeholder="${str_passwd}" required>	 		
  		<button class="btn btn-lg btn-secondary btn-block" type="submit">${btn_login}</button>
  		<a href="userInputForm.jk"><u>${page_input}</u></a>
  		<p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>	
  	</form>
</body>
</c:if>
<!-- Status: User logged-in -->
 <c:if test="${sessionScope.id ne null}">
	<c:redirect url="userMyPage.jk"/>		
</c:if>
</html>

