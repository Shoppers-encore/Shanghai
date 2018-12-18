<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<div class="container col-10 mt-3 pt-1">
			<form name="findPasswordForm">
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
			$(document).on(
				'click',
				'input:submit',
				function( event ){
					$.ajax({
						type : 'post',
						url : 'findPasswordPro.jk',
						data : $('form[name="findPasswordForm"]').serialize(),
						success : function(data){
							alert(data.result)
							
 							if(data.result>0){
								alert(data.result);
								alert('이메일로 비밀번호가 발송되었습니다.\n확인해주세요.');
								self.close();
							}else{
								alert('존재하지 않는정보입니다.');
							}
						}
					});
				}
			);
		//-->
	</script>
</html>