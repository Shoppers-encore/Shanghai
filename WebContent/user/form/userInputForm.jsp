<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<div class="jumbotron bg-white mb-1 text-center">
		  	<a href="main.jk">
	  			<img class="brandLogo" src="/urPresent/images/brandLogo.png" alt="UrPresent Brand Logo">
	  		</a>
  		</div>
  		
  		<div class="container col-lg-6">
			<h4 class="mb-5"><b>${page_input}</b></h4>
			
			<form class="form-horizontal" method="post" action="userInputPro.jk" name="inputform" onsubmit="return inputCheck()">
				<div class="form-group row">
					<!-- Id -->
					<label for="id" class="col-sm-2 col-form-label">${str_id}<b>*</b></label>
					<div class="col-sm-8">
						<input class="form-control" type="text" name="id" 
						id="id" placeholder="ID" maxlength="12" required autofocus>
						<small id="confirmIdResult"></small>
					</div>
					<div class="col-sm-2">
						<button class="btn btn-md btn-secondary" type="button" onclick="confirmId()">${btn_confirm}</button>
					</div>
				</div>
				<div class="form-group row pass">
					<!-- password -->
					<label for="password1" class="col-sm-2 col-form-label">${str_passwd}<b>*</b></label>
					<div class="col-sm-8">
						<input class="form-control" type="password" name="password"
							id="password1" placeholder="${str_passwd}" maxlength="20" required
							onkeyup="passwordCheckFunction()">
					</div>
				</div>
				<div class="form-group row">
					<!-- re-confirm password-->
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<input class="form-control" type="password" name="repassword"
							id="password2" placeholder="${str_repasswd}" maxlength="20"
							required onkeyup="passwordCheckFunction()">
						<small id="passwordCheckMessage"></small>
					</div>
				</div>
				<div class="form-group row">
					<!-- name -->
					<label for="name" class="col-sm-2 col-form-label">${str_name}<b>*</b></label>
					<div class="col-sm-8">
						<input class="form-control" type="text" name=name
							placeholder="name" maxlength="10" required onkeyup="checkNumber()">
					</div>
				</div>
				<div class="form-group row">
					<!-- birthday -->
					<label for="birthday" class="col-sm-2 col-form-label">${str_bday}<b>*</b></label>
					<div class="col-sm-8">
						<input class="form-control" type="date" name="birthday" maxlength="10" required>
					</div>
				</div>
				<div class="form-group row">
					<!-- tel -->
					<label for="tel" class="col-sm-2 col-form-label">${str_tel}<b>*</b></label>
					<div class="col-sm-8">
						<input class="form-control" type="text" name=tel
							placeholder="${str_noDash}" maxlength="12" required
							onkeyup="numberonly(event, inputform)">
					</div>
				</div>
				<div class="form-group row">
					<!-- email -->
					<label for="email" class="col-sm-2 col-form-label">${str_email}<b>*</b></label>
					<div class="col-sm-8">
						<input class="form-control" type="email" name=email 
							placeholder="e-mail" maxlength="70" required>
							<script type="text/javascript">
								var emailVerified=0;
							</script>
					</div>
					<div class="col-sm-2">
						<button class="btn btn-md btn-secondary" type="button"
							onclick="mailTransfer(inputform)">${btn_selfConfirm}</button>
					</div>
				</div>
				<div class="form-group row">
					<!--zip code -->
					<label for="zipcode" class="col-sm-2 col-form-label">${str_zipcode}<b>*</b></label>
					<div class="col-sm-8">
						<input class="form-control" type="text" name=zipcode id="zipcode"
							placeholder="${str_addressPlaceholder}" required readonly>
					</div>
					<div class="col-sm-2">
						<button class="btn btn-md btn-secondary" type="button"
							value="주소 찾기" onclick="sample4_execDaumPostcode()">${btn_search}</button>
					</div>
				</div>
				<div class="form-group row">
					<!--address -->
					<label for="address" class="col-sm-2 col-form-label">${str_address}<b>*</b></label>
					<div class="col-sm-8">
						<input class="form-control" type="text" name=address id="address" required readonly>
					</div>
				</div>
				<div class="form-group row">
					<!--addressDetail -->
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<input class="form-control" type="text" name=addressDetail
							placeholder="${str_addressDetail}" required>
					</div>
				</div>
				<div class="form-group row">
					<!-- gender -->
					<label for="gender" class="col-sm-2 col-form-label">${str_gender}</label>
					<div class="col-sm-10">
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
				<div class="form-group row">
					<!--height / weight-->
					<label for="height" class="col-sm-2 col-form-label">${str_height} / ${str_weight}</label>
					<div class="col-sm-3">
						<input class="form-control" type="number" name="height"
							placeholder="height (optional)" onkeyup="return checkHeight()">
					</div>
					cm <label class="col-sm-1 col-form-label"> &nbsp;&nbsp;/ </label>
					<div class="col-sm-3">
						<input class="form-control" type="number" name=weight
							placeholder="weight (optional)" onkeyup="return checkHeight()">
					</div>
					kg
				</div>
				<div class="col-sm-12 text-center mt-4">
					<!-- button -->
					<button class="btn btn_join" type="submit">회원가입</button>
					<button class="btn btn_cancel" type="reset">가입취소</button>
				</div>
			</form>
		</div>
	<%@include file="../view/userFooter.jsp"%>
	</body>
</html>