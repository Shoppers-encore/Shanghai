<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>썸네일</title><head>
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
<body>
	<form name="thumb" encType="multipart/form-data" method="post" action="thumbnailInputPro.jk">
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
</head>
<body>
	<%@ include file="../../setting.jsp" %>
	<form name="thumb" encType="multipart/form-data" method="post" action="thumbnailInputPro.jk">
		<input type="file" name="thumb">
		<br><br>
		<input type="submit" class="btn btn-primary" value="${str_send}">
		<input class="btn btn-secondary" type="button" value="${btn_cancel}" onclick="self.close()">
	</form>
</body>
</html>