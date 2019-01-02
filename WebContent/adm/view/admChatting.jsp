<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${id} 실시간 상담</title>
			
	</head>
	<body onload="messagefocus()">
		<table class="table table-hover">
			<tr>
				<td>
					<textarea id="content" style="width:300px; height:300px;" readonly></textarea> 
				</td>
			</tr>
			<tr>
				<td>
					<form class="row" name="msgInputForm" onsubmit="return enterChat()"> 
						<input type="hidden" name="id" value="${id}">
						<input type="text" class="form-control" id="message" name="chatContent" style="margin:0px 15px; width:240px">
						<input type="submit" class="btn btn-default" value="${btn_send}" style="width:50px">
					</form>
				</td> 
			</tr>
		</table>
	</body>
	<script type="text/javascript">
			//<!--
				function messagefocus(){
					document.msgInputForm.message.focus();
				}
				$(document).ready(function(){
					window.onload = setInterval( function(){
					show(); }, 700 );

				$(document).on(
					'click',
					'input:submit',
					function( event ){
						$.ajax({
							type : 'POST',
							url : 'admChatInput.jk',
							data : $('form[name="msgInputForm"]').serialize(),
							success : show()
					});
				});
		
				function show(){
					$.ajax({
						type : 'POST',
						url : 'admChat.jk',
						data : { id : '${id}'},
						success : function( data ){
							$('#content').html('');
							if( data.length > 0 ){
								$.each(data, function(key, chatData){
									var html = chatData.sender + ' : '
											 + chatData.chatContent + '\t'
											 + new Date(chatData.chatTime).toDateString() + '\n';
										$('#content').append( html );
							
								});
							}
						}
					});
				}
			});
			//-->
		</script>
</html>