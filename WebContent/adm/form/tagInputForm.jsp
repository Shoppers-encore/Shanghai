<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
<head>
	<title>태그추가</title>
  <style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
  * {
   font-family: 'Nanum Gothic';
	}
	html, body {
		height:100%;
	}
	body {
	  display:flex;
	  align-items:center;
	}

	#tagInputForm {
		text-align : center;
		float : none;
		margin : 0 auto;
		width : 300px;
		height : 230px;
		padding : 20px;
	}
  </style>
</head>
<body onload="opener.location.reload(true)">
	<form name="tagInputForm" method="post" action="tagInputPro.jk">
		<div class="container-fluid">
		    <div class="col-*-4 border centered" id="tagInputForm">
		    	<br> ${msg_addTag} <br><br>
		    	<input type="text" class="form-control" name="newTag" autofocus> <br>
		    	<input type="submit" class="btn btn-primary" value="${btn_confirm}" >
		    	<input type="button" class="btn btn-primary" value="${btn_cancel}" onclick="self.close()">
			</div>
		</div>
	</form>
</body>
</html>