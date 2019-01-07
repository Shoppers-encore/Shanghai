<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<!-- Status: User logged-in -->
		<c:if test="${sessionScope.id ne null}">
			<c:redirect url="userMyPage.jk"/>		
		</c:if>
		
		<div class="jumbotron bg-white mb-1 text-center">
		  	<a href="main.jk">
	  			<img class="brandLogo" src="/urPresent/images/brandLogo.png" alt="UrPresent Brand Logo">
	  		</a>
  		</div>
  		<div class="container-fluid text-center">
  			<div class="loginContainer justify-content-center mx-auto">
				<!-- Status: No User-->
				<c:if test="${sessionScope.id eq null}">	  		
			  		<form class="form-signin" method="post" action="userLoginPro.jk" name="loginform">
				     	<input type="text" name="id" class="form-control" placeholder="${str_id}" required autofocus>   			 	
				 	 	<input type="password" name="password" class="form-control" placeholder="${str_passwd}" required>	 		
				  		<button class="btn btn-secondary btn-block" type="submit">${btn_login}</button>
				  	</form>
				  	<small>
					  	<a onclick="findId()" class="mr-2" href="#">${page_findId}</a>
						<a onclick="findPw()" class="ml-2" href="#">${page_findPasswd}</a>
					</small>
				</c:if>
			</div>
		</div>
		
		<div class="container-fluid mt-5">
			<div class="flex-column loginContainer justify-content-center mx-auto">
				<div class="flex-item">
					<img class="joinUs pt-1 pb-1 pl-1 pr-1" src="/urPresent/images/join.png" alt="join">
				</div>
				<div class="flex-item">
					<small class="text-nowrap">${str_joinUsLine1}</small>
					<small class="text-nowrap">${str_joinUsLine2}</small>
				</div>			
				<div class="flex-item text-center">
					<button class="btn btn-secondary btn-block joinUsBtn" type="button">${page_input}</button>
					<script type="text/javascript">
						$('.joinUsBtn').on(
							'click',
							function(event) {
								window.location.href='userInputForm.jk';
							}
						);
					</script>
				</div>
			</div>
		</div>

		<%@include file="../view/userFooter.jsp"%>
	</body>
</html>

