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
<body class="mypage">
	<a href="main.jk">
		<img class="iconMargin pt-3 w-25" src="/urPresent/images/brandLogo.png" alt="UrPresent Brand Logo">
	</a>
    <hr>	
	<div class="container">
		<h4><b>내 정보</b></h4>
		<br><br>
		<div class="text-center">
			<h4>${userDto.id} &nbsp; ${msg_main_login}</h4>
		</div>
		<form class="form-horizontal" method="post" action="userInputPro.jk" name="inputform" onsubmit="return inputcheck()">		
			<div class="form-group row"><!-- Id -->
					<label for="id" class="col-sm-2 col-form-label">${str_id}</label>
					<div class="col-sm-8">
						${userDto.id}				
					</div>								
			</div>
			<div class="form-group row"><!-- name -->
					<label for="name" class="col-sm-2 col-form-label">${str_name}</label>
					<div class="col-sm-8">
						${userDto.name}								
					</div>	
			</div>
			<div class="form-group row"><!-- birthday -->
					<label for="birthday" class="col-sm-2 col-form-label">${str_bday}</label>
					<div class="col-sm-8">
						${userDto.birthday}												
					</div>		
			</div>
			<div class="form-group row"><!-- tel -->
					<label for="tel" class="col-sm-2 col-form-label">${str_tel}</label>
					<div class="col-sm-8">
						${userDto.tel}												
					</div>			
			</div>
			<div class="form-group row"><!-- email -->
					<label for="email" class="col-sm-2 col-form-label">${str_email}</label>
					<div class="col-sm-8">
						${userDto.email}	
					</div>			
			</div>
			<div class="form-group row"><!--zip code -->
					<label for="zipcode" class="col-sm-2 col-form-label">${str_zipcode}</label>
					<div class="col-sm-8">
						${userDto.zipcode}												
					</div>							
			</div>
			<div class="form-group row"><!--address -->
					<label for="address" class="col-sm-2 col-form-label">${str_address}</label>
					<div class="col-sm-8">
						${userDto.address}												
					</div>			
			</div>
			<div class="form-group row"><!--addressDetail -->
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						${userDto.addressDetail}										
					</div>		
			</div>
			<div class="form-group row"><!-- gender -->
					<label for="gender" class="col-sm-2 col-form-label">${str_gender}</label>
					<div class="col-sm-10">
						<c:if test="${userDto.gender eq 0}">
							${str_gender_m}
						</c:if>
						<c:if test="${userDto.gender eq 1}">
							${str_gender_f}
						</c:if>														
					</div>				
			</div>
			<div class="form-group row"><!--height / weight-->
					<label for="height" class="col-sm-2 col-form-label">${str_height} / ${str_weight}</label>
					<div class="col-sm-3">
						${userDto.height}										
					</div>	
					cm
					<label class="col-sm-1 col-form-label"> &nbsp;&nbsp;/ </label>					
					<div class="col-sm-3">
						${userDto.weight}									
					</div>					
					kg					
			</div>
			<div class="col-sm-12 text-center mt-4"><!-- button -->
	            <button class="btn" type="button" onclick="location='userModifyForm.jk'">${btn_modify}</button>
	            <button class="btn" type="button" onclick="userDelete()">${btn_userDelete}</button>
	            <button class="btn" type="button" onclick="location='logout.jk'">${btn_logout}</button>
      	    </div>			
		</form>
	</div> <!-- container -->
	<script type="text/javascript">
	//<!--
		function userDelete(){
			var userDel = confirm('정말 탈퇴하실거나요?\n나가지 말아용~~\n더 잘해줄게~~');
			if(userDel){
				location='userDeletePro.jk'
			}
	}
	//-->
	</script>
</body> 
