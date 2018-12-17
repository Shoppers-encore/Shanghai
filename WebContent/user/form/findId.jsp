<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>
<html>
<head>
</head>
<body>
<form name="findIdForm">
	<div class="container">
			<div id="id">
				<div id="findId">
					<br> ${msg_findId} <br><br>
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
							type : 'POST',
							url : 'findIdPro.jk',
							data : $('form[name="findIdForm"]').serialize(),
							success : function(data){
								if(data.result>0){
									var a = alert('아이디는 '+data.id+'입니다.');
									if(a){
										self.close();
									}
								}else{
									alert('존재하지 않는정보입니다.');
								}
							}
					});
				});
	
	//-->
</script>
</html>