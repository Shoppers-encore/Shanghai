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
<style>
   @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
 * {
   font-family: 'Nanum Gothic'sans-serif;
 }
 </style>
<link rel="stylesheet" href="${project}shanghai_style.css">
<body class="registration">
    <img class="iconMargin" src="images/shanghai_icon.png" alt="logo" width="350" height="150">
    <hr>	       
<!-- id, password, name, birthday, tel, email, gender, 
	userLevel=default 1, height(3,0), weight(3,0), address, addressDetail, zipcode -->
	<div class="container" style="width: 800px">
		<h4><b>회원가입</b></h4>
		<br><br>
		<form class="form-horizontal" method="post" action="userInputPro.go" name="inputform" onsubmit="return inputcheck()">		
			<div class="form-group row"><!-- Id -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_id}<b>*</b></label>
					<div class="col-sm-8">
						<input type="text" name=id class="form-control" placeholder="ID" maxlength="12" required autofocus>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="IdCheck()">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row pass"><!-- password -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_passwd}<b>*</b></label>
					<div class="col-sm-8">
						<input type="password" name=password class="form-control" placeholder="${str_passwd}" maxlength="12" required>											
					</div>		
			</div>
			<div class="form-group row pass"><!-- re-confirm password-->
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="userPassword2" name="repassword" placeholder="비밀번호 재입력" maxlength="30" required onkeyup="passwordCheckFunction()">					
					<h6 style="color: brown;" id="passwordCheckMessage"></h6>				
				</div>
			</div>
			<div class="form-group row"><!-- name -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_name}<b>*</b></label>
					<div class="col-sm-8">
						<input type="text" name=name class="form-control" placeholder="name" maxlength="10" required>											
					</div>	
			</div>
			<div class="form-group row"><!-- birthday -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_bday}<b>*</b></label>
					<div class="col-sm-8">
						<input type="text" name=birthday class="form-control" placeholder="ex)월/일/년도, 01/01/2019" maxlength="10" required>											
					</div>		
			</div>
			<div class="form-group row"><!-- tel -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_tel}<b>*</b></label>
					<div class="col-sm-8">
						<input type="text" name=tel class="form-control" placeholder="-없이 입력해주세요" maxlength="12" required>											
					</div>			
			</div>
			<div class="form-group row"><!-- email -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_email}<b>*</b></label>
					<div class="col-sm-8">
						<input type="email" name=email class="form-control" placeholder="e-mail" maxlength="12" required>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="">${btn_selfConfirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!--address -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_address}<b>*</b></label>
					<div class="col-sm-8">
						<input type="text" name=address class="form-control" placeholder="${str_address}" required>											
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" onclick="">${btn_confirm}</button>					
					</div>				
			</div>
			<div class="form-group row"><!--addressDetail -->
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<input type="text" name=addressDetail class="form-control" placeholder="${str_addressDetail}" required>											
					</div>		
			</div>
			<div class="form-group row"><!-- gender -->
					<label for="inputID" class="col-sm-2 col-form-label">${str_gender}</label>
					<div class="col-sm-10">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender" value="0" checked> 								
								<label class="form-check-label" for="gridRadios2">${str_gender_m} </label>															
						</div>		
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender" value="1"> 								
								<label class="form-check-label" for="gridRadios1">${str_gender_f} </label>								
						</div>																		
					</div>				
			</div>
			<div class="form-group row"><!--height / weight-->
					<label for="height" class="col-sm-2 col-form-label">${str_height} / ${str_weight}</label>
					<div class="col-sm-3">
						<input type="number" name=height class="form-control" placeholder="height (optional)" maxlength="3">											
					</div>	
					cm
					<label class="col-sm-1 col-form-label"> &nbsp;&nbsp;/ </label>					
					<div class="col-sm-3">
						<input type="number" name=weight class="form-control" placeholder="weight (optional)" maxlength="3">									
					</div>					
					kg					
			</div>
			<div class="col-sm-12 text-center mt-4"><!-- button -->
	            <button class="btn btn_join" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
	            <button class="btn btn_cancel" type="reset">가입취소<i class="fa fa-times spaceLeft"></i></button>
      	    </div>			
		</form>
	</div> <!-- container -->
</body>
</html>