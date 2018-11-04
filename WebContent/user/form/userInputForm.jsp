<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link rel="stylesheet" href="${project}shanghai_style.css">
<body class="registration">
	<h2>회원가입</h2> 
<!-- id, password, name, birthday, tel, email, gender, 
	userLevel=default 1, height(3,0), weight(3,0), address, addressDetail, zipcode -->
	<hr>
	<div class="container" style="width: 800px">
		<form class="form-horizontal" method="post" action="userInputPro.go" name="inputform" onsubmit="return inputcheck()">		
			<div class="form-group row"><!-- Id -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_id}*</label>
					<div class="col-sm-8">
						<input type="text" name=id class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!-- password -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_passwd}*</label>
					<div class="col-sm-8">
						<input type="password" name=password class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!-- name -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_name}*</label>
					<div class="col-sm-8">
						<input type="text" name=name class="form-control" placeholder="name" maxlength="10" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!-- birthday -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_bday}*</label>
					<div class="col-sm-8">
						<input type="text" name=birthday class="form-control" placeholder="ex)월/일/년도, 01/01/2019" maxlength="7" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!-- tel -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_tel}*</label>
					<div class="col-sm-8">
						<input type="tel" name=id class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!-- gender -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_gender}</label>
					<div class="col-sm-8">
						<input type="email" name=id class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!-- email -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_email}*</label>
					<div class="col-sm-8">
						<input type="email" name=id class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!--address -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_address}*</label>
					<div class="col-sm-8">
						<input type="email" name=id class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!--height -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_height}*</label>
					<div class="col-sm-8">
						<input type="email" name=id class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!--weight -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_weight}*</label>
					<div class="col-sm-8">
						<input type="email" name=id class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
		</form>
	</div>
</body>
</html>