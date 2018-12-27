<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
	<title>관리자 메인</title>
  <style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
  * {
   font-family: 'Nanum Gothic';
	}
  body {
	  display:flex;
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
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">

<%@ include file="../view/admMenubar.jsp"%>
	<div class="col-sm-10 col-8" >
	</div>
</body>
</html>

