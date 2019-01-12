<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>
  		
  		<div class="container col-12 col-sm-12 col-md-10 col-lg-8 col-xl-6">
			<h4 class="mb-5 mt-5"><b>${page_input}</b></h4>
			
			<form class="form-horizontal" method="post" action="userInputPro.jk" name="inputform" onsubmit="return joincheck()">
				<div class="form-group inputformGroup">
					<!-- Id -->
					<label for="id" class="inputformLabel">${str_id}<b>*</b></label>
					<div class="inputfield mb-2">
						<input class="form-control" type="text" name="id" 
							id="id" placeholder="ID" maxlength="12" required autofocus>
						<small id="confirmIdResult"></small>
					</div>
					<div class="inputformBtn">
						<button class="btn btn-md btn-secondary" type="button" onclick="confirmId()">${btn_confirm}</button>
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!-- password -->
					<label for="password1" class="inputformLabel">${str_passwd}<b>*</b></label>
					<div class="inputfield">
						<input class="form-control" type="password" name="password"
							id="password1" placeholder="${str_passwd}" maxlength="20" required
							onkeyup="passwordCheckFunction()">
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!-- re-confirm password-->
					<div class="inputformLabel"></div>
					<div class="inputfield mb-2">
						<input class="form-control" type="password" name="repassword"
							id="password2" placeholder="${str_repasswd}" maxlength="20"
							required onkeyup="passwordCheckFunction()">
						<small id="passwordCheckMessage"></small>
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!-- name -->
					<label for="name" class="inputformLabel">${str_name}<b>*</b></label>
					<div class="inputfield mb-2">
						<input class="form-control" type="text" name="name"
							placeholder="name" maxlength="10" required onkeyup="checkNumber()">
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!-- birthday -->
					<label for="birthday" class="inputformLabel">${str_bday}<b>*</b></label>
					<div class="inputfield mb-2">
						<input class="form-control" type="date" name="birthday" maxlength="10" required>
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!-- tel -->
					<label for="tel" class="inputformLabel">${str_tel}<b>*</b></label>
					<div class="inputfield mb-2">
						<input class="form-control" type="tel" name="tel" pattern="[0-9]{10}||[0-9]{11}"
							placeholder="${str_noDash}" maxlength="12" required>
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!-- email -->
					<label for="email" class="inputformLabel">${str_email}<b>*</b></label>
					<div class="inputfield">
						<input class="form-control" type="email" name="email" id="email" 
							placeholder="e-mail" maxlength="70" required>
						<small id="emailVerificationMsg">${msg_emailVerificationNeeded}</small>
					</div>
					<div class="inputformBtn" id="maildiv">
						<button class="btn btn-md btn-secondary emailVerificationBtn" type="button" onclick="mailTransfer(inputform)">${btn_selfConfirm}</button>
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!--zip code -->
					<label for="zipcode" class="inputformLabel">${str_zipcode}<b>*</b></label>
					<div class="inputfield mb-2">
						<input class="form-control" type="text" name="zipcode" id="zipcode"
							placeholder="${str_addressPlaceholder}" required readonly>
					</div>
					<div class="inputformBtn">
						<button class="btn btn-md btn-secondary addressSearchBtn" type="button"
							value="주소 찾기" onclick="sample4_execDaumPostcode()">${btn_search}</button>
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!--address -->
					<label for="address" class="inputformLabel">${str_address}<b>*</b></label>
					<div class="inputfield">
						<input class="form-control" type="text" name="address" id="address" required readonly>
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!--addressDetail -->
					<div class="inputformLabel"></div>
					<div class="inputfield mb-2">
						<input class="form-control" type="text" name="addressDetail"
							placeholder="${str_addressDetail}" required>
					</div>
				</div>
				<div class="form-group inputformGroup">
					<!-- gender -->
					<label for="gender" class="inputformLabel">${str_gender}</label>
					<div class="inputfield">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								value="0" checked> <label class="form-check-label">${str_gender_m}
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								value="1"> <label class="form-check-label">${str_gender_f}
							</label>
						</div>
					</div>
				</div>
				<div class="form-group heightWeightForm">
					<!--height / weight-->
					<label for="height" class="heightLabel">${str_height} / ${str_weight}</label>
					<div class="heightGroup d-flex">
						<div class="heightWeight">
							<input class="form-control" type="number" name="height" min="0"
								placeholder="height (optional)" onkeyup="return checkHeight()">
						</div>	
						<div class="units pt-2 pb-2 pl-2">cm &ensp;/</div>
					</div>
					<div class="heightGroup d-flex">
						<div class="heightWeight">
							<input class="form-control" type="number" name="weight" min="0"
								placeholder="weight (optional)" onkeyup="return checkHeight()">
						</div>
						<div class="units pt-2 pb-2 pl-2">kg</div>
					</div>
				</div>
				<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-center mt-4">
					<button class="btn btn-secondary btn_join" type="submit">${btn_join}</button>
					<button class="btn btn-secondary btn_cancel" type="reset">${btn_cancelJoin}</button>
				</div>
			</form>
		</div>
	<%@include file="../view/userFooter.jsp"%>
	</body>
	<script type="text/javascript">
	//<--
	//SMTP - Simple Mail Transfer Protocol
	function mailTransfer(form) {
		if(form.email.value.indexOf("@") == -1 || form.email.value.indexOf(".") == -1){ //check proper email format
		      alert(emailfmterror);
		      return false;
		 }
		$.ajax({
			type:'POST',
			url : 'isMail.jk',
			data : $("input[name='email']").serialize(),
			dataType : "json",
			success : function(data){
				console.log(data.result)
				if(data.result>0){
					alert('사용 중인 이메일입니다.\n다른 이메일 주소를 입력해주세요');
					$("input[name='email']").focus();
				}else{
					var url = "userMailCheck.jk?email="+form.email.value;	//direct to UserProHandler.java with email value
					//open(URL, name, specs, replace)
					window.open(url,"name", "status=no, scrollbars=no, menubar=no, resizable=no, width=500, height=180, top=180, left=630");

				}
			}
		});
	}
	$(document).ready(
		$("input[name='email']").change(function(){
			 $('#emailVerificationMsg').text('이메일 인증을 해 주세요.');
			 $('#emailVerificationMsg').css({color: 'brown'});
		})
	);
	$(document).ready(
			$("input[name='id']").change(function(){
				 $('#confirmIdResult').html('아이디 인증을 해 주세요.');
				 $('#confirmIdResult').css({color: 'brown'});
				 idCheck=0;
			})
	);
	//-->
	</script>
</html>