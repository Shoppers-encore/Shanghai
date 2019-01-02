<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
	<title>태그관리</title>
  <style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
  * {
   font-family: 'Nanum Gothic';
	}
  body {
	  position:relative;
	}
  div.card {
  	text-align: center;
   }
  ul.nav-pills {
      top: 20px;
      position: fixed;
  }
  div.col-8 div {
      height: 500px;
  }
  </style>
</head>
<body class="container-fluid row" data-offset="1">
<%@ include file="../view/admMenubar.jsp"%>
<article  class="col-sm-10 col-8" >
	<div>
		<br><br>
		<h4> ${page_manageTag} </h4>
		<br><br>
		<form name="tagForm" method="post" action="tagDeletePro.jk" onsubmit="return isTagChecked()">
			<c:forEach var="tag" items="${tags}">   
				<label class="btn btn-info">
		           	<input type="checkbox" name="tag" value="${tag.tagId}">${tag.tagName}
		      	</label>
		    </c:forEach>
		    <br><hr><br>
		    <input type="button" class="btn btn-primary" value="${btn_addTag}"
		    		onclick="tagPopup()">
		    <input type="submit" class="btn btn-danger" value="${btn_delTag}">
		   	<input type="button" class="btn btn-secondary" value="${btn_back}"
		    		onclick="location='admProductList.jk'">
	    </form>
	</div>
</article>

</body>
</html>

