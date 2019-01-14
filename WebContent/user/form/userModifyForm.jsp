<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>
      
	<!-- id, password, name, birthday, tel, email, gender, 
		userLevel=default 1, height(3,0), weight(3,0), address, addressDetail, zipcode -->
		<div class="container col-6">
			<h4 class="text-center pt-3 pb-4"><strong>${str_modifyMyInfo}</strong></h4>
			<form class="form-horizontal" method="post" action="userModifyPro.jk" name="inputform">		
				<div class="form-group row"><!-- Id -->
						<label for="id" class="col-sm-2 col-form-label">${str_id}<b>*</b></label>
						<div class="col-sm-8">
							${userDto.id}								
						</div>			
				</div>
				<div class="form-group row pass"><!-- password -->
						<label for="password1" class="col-sm-2 col-form-label">${str_passwd}<b>*</b></label>
						<div class="col-sm-8">
							<input class="form-control" type="password" name="password" id="password1" placeholder="${str_passwd}" maxlength="20" required onkeyup="passwordCheckFunction()"> 											
						</div>		
				</div>
				<div class="form-group row"><!-- re-confirm password-->
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<input class="form-control" type="password" name="repassword" id="password2" placeholder="${str_repasswd}" maxlength="20" required onkeyup="passwordCheckFunction()">					
						<h6 style="color: brown;" id="passwordCheckMessage"></h6>				
					</div>
				</div>
				<div class="form-group row"><!-- name -->
						<label for="name" class="col-sm-2 col-form-label">${str_name}<b>*</b></label>
						<div class="col-sm-8">
							<h5>${userDto.name}</h5>											
						</div>	
				</div>
				<div class="form-group row"><!-- birthday -->
						<label for="inputID" class="col-sm-2 col-form-label">${str_bday}<b>*</b></label>
						<div class="col-sm-8">
							<h5>${userDto.birthday}</h5>	
						</div>		
				</div>
				<div class="form-group row"><!-- tel -->
						<label for="inputID" class="col-sm-2 col-form-label">${str_tel}<b>*</b></label>
						<div class="col-sm-8">
							<input class="form-control" type="text" name=tel placeholder="-없이 입력해주세요" maxlength="12"  value="${userDto.tel}" required>											
						</div>			
				</div>
				<div class="form-group row"><!-- email -->
						<label for="inputID" class="col-sm-2 col-form-label">${str_email}<b>*</b></label>
						<div class="col-sm-8">
							<input class="form-control" type="email" name=email  placeholder="e-mail" maxlength="12" value="${userDto.email}" required>											
						</div>
						<div class="col-sm-2">
							<button class="btn btn-md btn-secondary" type="button" onclick="mailTransfer(inputform)">${btn_selfConfirm}</button>					
						</div>				
				</div>
				<div class="form-group row"><!--zip code -->
						<label for="zipcode" class="col-sm-2 col-form-label">${str_zipcode}<b>*</b></label>
						<div class="col-sm-8">
							<input class="form-control" type="text" name=zipcode id="zipcode" placeholder="${str_zipcode}" value="${userDto.zipcode}" required>											
						</div>
						<div class="col-sm-2">
							<button class="btn btn-md btn-secondary" type="button"  value="주소 찾기" onclick="sample4_execDaumPostcode()">${btn_search}</button>					
						</div>				
				</div>
				<div class="form-group row"><!--address -->
						<label for="inputID" class="col-sm-2 col-form-label">${str_address}<b>*</b></label>
						<div class="col-sm-8">
							<input class="form-control" type="text" name=address id="address" placeholder="${str_address}" value="${userDto.address}" required>											
						</div>				
				</div>
				<div class="form-group row"><!--addressDetail -->
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							<input class="form-control" type="text" name=addressDetail placeholder="${str_addressDetail}" value="${userDto.addressDetail}" required>											
						</div>		
				</div>
				<div class="form-group row"><!-- gender -->
						<label for="inputID" class="col-sm-2 col-form-label">${str_gender}</label>
						<div class="col-sm-10">	
							<h5>${userDto.gender==0?'남자':'여자'}</h5>											
						</div>				
				</div>
				<div class="form-group row"><!--height / weight-->
						<label for="height" class="col-sm-2 col-form-label">${str_height} / ${str_weight}</label>
						<div class="col-sm-3">
							<input class="form-control" type="number" name=height placeholder="height (optional)" value="${userDto.height}" maxlength="3">											
						</div>	
						cm
						<label class="col-sm-1 col-form-label"> &nbsp;&nbsp;/ </label>					
						<div class="col-sm-3">
							<input class="form-control" type="number" name=weight placeholder="weight (optional)" value="${userDto.weight}" maxlength="3">									
						</div>					
						kg					
				</div>
				<div class="col-sm-12 text-center mt-4"><!-- button -->
		            <button class="btn btn_join" type="submit">수정</button>
		            <button class="btn btn_cancel" type="reset">취소</button>
	      	    </div>			
			</form>
		</div>
		<%@include file="../view/userCompanyInfo.jsp"%>
		<%@include file="../view/userFooter.jsp"%>
	</body>
</html>