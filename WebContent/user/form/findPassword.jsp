<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>

	<body onload="findPassword(${result})">
		<div class="container col-10 mt-3 pt-1">
			<form name="findPasswordForm" method="post" action="findPasswordPro.jk">
				<div>
					<strong class="mt-5">${page_findPasswd}</strong>
				</div>
				<div>
					<small>${msg_findPasswd}</small>
				</div>
				<div id="password" class="mt-3 pt-4">
					<div id="findPassword">
						<div class="mt-1">
							${str_id}
						</div>
						<div class="mt-1">
							<input class="form-control" type="text" name="id">
						</div>
						<div class="mt-1">
							${str_name}
						</div>
						<div class="mt-1">
							<input class="form-control" type="text"  name="name">
						</div>
						<div class="mt-1">
							${str_email}
						</div>
						<div class="mt-1">
							<input class="form-control" type="text" name="email">
						</div>
					</div>
				</div>
				<div class="text-center mt-4">
					<input class="btn btn-sm" type="submit" name="confirm" value="${btn_confirm}">
					<input class="btn btn-sm" type="button" name="cancel" value="${btn_exit}" onclick="self.close()">
				</div>
			</form>
		</div>
		<%@include file="../view/userFooter.jsp"%>
	</body>
	<script type="text/javascript">
		//<!--
			function findPassword(result){
				if(result==null){
				}else if(result==1){
					alert('입력하신 이메일로 임시 비밀번호를 전송하였습니다.\n메일을 확인해 주세요.');
					self.close();
				}else{
					alert('회원정보를 찾지 못했습니다. \n입력하신 정보를 다시 확인해 주세요.');
				}
			}
		//-->
	</script>
</html>