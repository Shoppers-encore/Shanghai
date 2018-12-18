<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<div class="container col-10 mt-3 pt-1">
			<form name="findIdForm">
				<div>
					<strong class="mt-5">${page_findId}</strong>
				</div>
				<div>
					<small>${msg_findId}</small>
				</div>
				<div id="id" class="mt-3 pt-5">
					<div id="findId">
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
						type : 'POST',
						url : 'findIdPro.jk',
						data : $('form[name="findIdForm"]').serialize(),
						success : function(data){
							if(data.result>0){
								alert('아이디는 '+data.id+'입니다.');
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