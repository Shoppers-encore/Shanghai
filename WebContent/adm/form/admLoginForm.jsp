<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
<head>
	<title>관리자 로그인</title>
	  <meta charset="utf-8">
	  
	  <style>
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	  * {
	   font-family: 'Nanum Gothic';
		}
		html, body {
			height:100%;
		}
		body {
		  display:flex;
		  align-items:center;
		}
	
		#admlogin {
			text-align : center;
			float : none;
			margin : 0 auto;
			width : 400px;
			height : 250px;
			padding : 10px;
		}
	  </style>
	  </head>
	<body>
		<div class="container-fluid">
		    <div class="centered col-*-4 border" id="admlogin">
				<p>
			    <br> ${msg_admLogin} <br>
				</p>
				<form name="loginform" method="post" action="admLoginPro.jk">
						<div class="input-group mb-3">
							<div class="input-group-prepend" >
								<span class="input-group-text" >${str_id}</span>
							</div>
							<input type="text" name="id" class="form-control" maxlength="5" autofocus>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text">${str_passwd}</span>
							</div>
							<input type="password" name="password" class="form-control" maxlength="10">
						</div>
						<input class="btn btn-primary" type="submit" value="${btn_login}" onclick="location='admMain.jk'">
						<input class="btn btn-secondary" type="button" value="${btn_gotoUserMain}" onclick="location='main.jk'">
				</form>
			 </div>
		</div>
	</body>
</html>