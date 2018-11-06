<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
   <title>${str_chat}</title>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <style>
 @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
 * {
   font-family: 'Nanum Gothic';
}
  body {
      position: relative;
  }
  ul.nav-pills {
      top: 20px;
      position: fixed;
  }
  div.card {
    text-align: center;

  }
  div.totalUser {
     float: right;
  }
  </style>
 
</head>
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%>
       
       <!-- User List View Page -->
       <article class="col-sm-10 col-8" ><br><br>
          <h4>${str_chat}</h4>
          
            <table class="table table-striped">
               <thead>
                  <tr>
                     <th>${str_id}</th>
                  </tr>
               </thead>
               <tbody>
               
               </tbody>
            </table>
      </article>
</body>
 <script type="text/javascript">
  	//<!--
  		$(document).ready(
  				function show(){
					$.ajax({
						type : 'POST',
						url : 'admChatList.jk',
						data : { id : '${sessionScope.id}'},
						success : function( data ){
							$('#content').html('');
							if( data.length > 0 ){
								$.each(data, function(key, chatData){
									var html = chatData.sender + ' : '
											 + chatData.chatContent + '\t'
											 + new Date(chatData.chatDate).toDateString() + '\n';
										$('#content').append( html );
							
								});
							}
						}
					});
				}		
  		);
  	//-->
  </script>
</html>