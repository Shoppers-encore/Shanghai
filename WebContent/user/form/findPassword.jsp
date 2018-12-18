<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body onload="findPassword(${result})">
		<div class="container col-10 mt-3">
			<form name="findPasswordForm" method="post" action="findPasswordPro.jk">
				<div>
					<strong class="mt-5">${page_findPasswd}</strong>
				</div>
				<div>
					<small>${msg_findPasswd}</small>
				</div>
				<div id="password" class="mt-3">
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
	</body>
	<script type="text/javascript">
		//<!--
			function findPassword(result){
				if(result==null){
				}else if(result==1){
					alert('입력된 주소로 비밀번호를 전송하였습니다.\n메일을 확인해주세요');
					self.close();
				}else{
					alert('해당 정보가 존재하지 않습니다. 다시 시도해주세요!');
				}
			}
		//-->
	</script>
</html>