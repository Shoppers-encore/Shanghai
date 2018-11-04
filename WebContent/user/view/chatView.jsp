<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
		<script type="text/javascript">
			//<!--
				$(document).ready(function(){
				window.onload = setInterval( function(){
								show();}, 700 );
				$(document).on(
						'click',
						'input:submit', function( event ){
							$.ajax({
								type : 'POST',
								url : 'chatInsert.jk',
								data : $('form[name="msgInputForm"]').serialize(),
								success : show()
						});
					});

				function show(){
					$.ajax({
						type : 'POST',
						url : 'chatView.jsp',
						data : {id : '${sessionScope.memid}'},
						success : function( data ){
							$('#content').html('');
							var code = $(data).find('code').text().trim();
							if( code == 'success' ){
								var count = $(data).find('count').text().trim();
								if( count != 0 ){
									var contents = eval( "(" + $(data).find('contents').text() + ")" );
									for( var i=0; i<contents.content.length; i++ ){
										var html = contents.content[i].sender + ' : '
											+ contents.content[i].content + '\t'
											+ contents.content[i].writetime + '\n';
										$('#content').append( html );
									}

								}
							}
						});
					}
				});
		//-->
	</script>
		<style>
			@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
			* {
				font-family: 'Nanum Gothic';
			}
			textarea {
				overflow-y: scroll;
				resize: none; /* Remove this if you want the user to resize the textarea */
			}
		</style>
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
						<input type="text" class="form-control" id="message" name="message" style="margin:0px 15px; width:240px">
						<input type="submit" class="btn btn-default" value="${btn_send}" style="width:50px">
						<input type="hidden" name="id" value="${sessionScope.memid}">
						<input type="hidden" name="receiver" value="관리자">
						<input type="hidden" name="readnumber" value="0">
					</form>
				</td> 
			</tr>
		</table>
	</body>
</html>