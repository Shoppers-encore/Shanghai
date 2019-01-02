<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 마이페이지</title>
  <style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
  * {
   font-family: 'Nanum Gothic';
	}
	ul.nav-pills {
	      top: 20px;
	      position: fixed;
	}
	div.card {
		text-align : center;
	}

	#mpinput {
		text-align : center;
		margin : 0 auto;
		width : 400px;
		height : 530px;
		padding : 10px;
	    top: 20px;
		float : none;
	}
  </style>
  
</head>
<body class="container-fluid row">
<%@ include file="../view/admMenubar.jsp"%>
	<article class="col-sm-10">
			<br><br><br><br>
		    <div class="centered border" id="mpinput">
					<p>
			      	<br> ${str_mypage} <br>
					</p>
					<form name="admModForm" method="post" action="admModifyPro.jk" onsubmit="return admModcheck()">
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">${str_id}</span>
							</div>
							<input type="text" name="id" class="form-control" value="${userDto.id}" disabled>
						</div>
	
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">${str_passwd}</span>
							</div>
							<input type="password" name="passwd" class="form-control" autofocus 
								placeholder="${msg_rewritepw}" maxlength="10">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">${str_passwd}</span>
							</div>
							<input type="password" name="repasswd" class="form-control" maxlength="10">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">${str_name}</span>
							</div>
							<input type="text" name="name" class="form-control" value="${userDto.name}" maxlength="12">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">${str_tel}</span>
							</div>
							<input type="text" name="tel" class="form-control" value="${userDto.tel}"
							onkeyup="numberonly(event, admModForm)" maxlength="11">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">${str_email}</span>
							</div>
							<input type="text" name="email" class="form-control" value="${userDto.email}" maxlength="30"/>
						</div>
						<div>
	 			    		<input class="btn btn-outline-primary" type="button" value="${btn_confirmmail}"
							onclick=""> <br><br>		<!-- mailTransfer(admModForm) 들어갈 자리 -->
						</div>
						<input class="btn btn-secondary" type="button" value="${btn_back}"
									onclick="history.back()">
						<input class="btn btn-primary" type="submit" value="${btn_membermod}">
					</form>
					
			 </div>
		</article>
	</div>
</div>
</body>

</html>