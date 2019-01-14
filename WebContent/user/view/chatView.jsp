<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<head>
		<title>${str_chat}</title>
		<meta charset="UTF-8">
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
		<link rel="icon" href="/urPresent/images/favicon2.png" type="image/png">
	</head>
	<body onload="messagefocus()">
		<div class="container-fluid col-12 pl-0 pr-0" align="center">
			<textarea id="content" class="ml-1 mr-1 mt-1 col-12" style="height: 400px" readonly></textarea> 
			<form class="form-row mt-1 mb-1" name="msgInputForm" onsubmit="return enterChat()"> 
				<input type="text" class="form-control ml-1 mr-1 col-9" id="message" name="message">
				<input type="submit" class="btn btn-default" value="${btn_send}">
			</form>
		</div>
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
						url : 'userChatInput.jk',
						data : $('form[name="msgInputForm"]').serialize(),
						success : show()
				});
			});
	
			function show(){
				$.ajax({
					type : 'POST',
					url : 'chat.jk',
					data : { id : '${sessionScope.id}'},
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