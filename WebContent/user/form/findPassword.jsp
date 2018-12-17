<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>
<html>
<head>
</head>
<body>
<form name="findPasswordForm">
	<div class="container">
			<div id="password">
				<div id="findPassword">
					<br> ${msg_findPassword} <br><br>
					id : <input class="form-control" type="text" name="id"><br>
					name : <input class="form-control" type="text"  name="name"> <br>
					email : <input class="form-control" type="text" name="email"> <br>
				</div>
			</div>
			<div class="text-center">
				<input class="btn btn-sm" type="submit" name="confirm" value="${btn_confirm}">
				<input class="btn btn-sm" type="button" name="cancel" value="${btn_exit}" onclick="self.close()">
			</div>
	</div>
</form>
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
								if(data.result>0){
									alert('이메일로 비밀번호가 발송되었습니다.\n확인해주세요.');
									window.self.close();
								}else{
									alert('존재하지 않는정보입니다.');
								}
							}
					});
				});
	
	//-->
</script>
</html>