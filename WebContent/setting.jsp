<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <script src="script.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 

	<!-- String -->
	<c:set var="str_review" value="Review"/>
	<c:set var="str_productName" value="상품명"/>
	<c:set var="str_title" value="글제목"/>
	<c:set var="str_writer" value="작성자"/>
	<c:set var="str_reviewDate" value="작성일"/>
	<!-- color -->
	<c:set var="str_color_wht" value="하얀색"/>
	<c:set var="str_color_blk" value="검은색"/>
	<c:set var="str_color_red" value="빨간색"/>
	<c:set var="str_color_blu" value="파란색"/>
	<c:set var="str_color_grn" value="초록색"/>
	<c:set var="str_color_ylw" value="노란색"/>
	<c:set var="str_color_brn" value="갈  색"/>
	<c:set var="str_color_nvy" value="네이비"/>
	<c:set var="str_color_gry" value="그레이"/>
	<c:set var="str_color_beg" value="베이지"/>
	<c:set var="str_color_sky" value="하늘색"/>
	
	
	
	
	
	<!-- Button -->
	
	
	
	
	
	
	<!-- Message -->
	<c:set var="msg_list_x" value="목록이 존재하지 않습니다."/>
	<c:set var="msg_noSearchResult" value="검색 결과가 존재하지 않습니다."/>
	<c:set var="msg_searchProduct" value="검색할 내용을 입력하세요."/>
