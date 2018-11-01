<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<title>${str_goodList}</title>
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
 img {
 	width: 100%;

  }
  a.goodName {
  	color: black;
  }
  p {
  	text-align: center;
  }

  </style>
</head>
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%>
    <!-- Good List View Page -->
    <article class="col-sm-10 col-8" ><br><br>
    	<h4>${str_productList}</h4><br>
    	
    	<div class="col-sm-4 container-fluid" style="float:none; margin:0 auto;">
	    	<form name="searchForm" action="./goodList.jk" method="post">
					<div class="input-group">
					    <input type="text" class="form-control" name="searchWord" style="width:60%">
					    <input type="submit" class="form-control btn btn-danger" value="${btn_search}" style="width:20%">
				  	</div>
			</form>
		</div>
		<c:if test="${ searchWord ne null and count eq 0 }"> <!-- 검색어가 있고 검색 결과 개수가 0 또는 null일 때 -->
					<br><p><b>${searchWord}</b> ${msg_noSearchResult}</p>
			</c:if>
			<c:if test="${searchWord ne null and searchWord != '' and count ne 0}"> <!-- 검색어가 있고 검색 결과도 있을 때 -->
				<br><p>${count} ${msg_searchResult} <b>${searchWord}</b></p><br>
		</c:if>
		
		
    	<c:if test="${goods eq null or goods.size() eq 0}">	
				<br><br><br><br><br>
				<p>${msg_list_x}</p>
		</c:if>
		<c:if test="${count ne 0}">
	    	<div class="row">
	    		<c:forEach var="good" items="${goods}">
	    			<c:set var="loop-flag" value="0"/>
	    			<c:set var="image" value="0"/>
	    			<c:forEach var="i" items="${imageList}" step="2">
	    				<c:if test="${loop-flag eq 0}">
		    				<c:if test="${good.ref eq i.ref}">
		    					<c:set var="loop-flag" value="1"/>
		    					<c:set var="image" value="${i.image_address}"/>
				        	</c:if>
			        	</c:if>
	    			</c:forEach>
		    		<div class="col-md-3"  align="center"><br>
		            	<img src="/WebProject/save/${image}" name="thumb"><br>
			         	<!-- How to get image names from image_info DataBean -->
			         	<a class="goodName" href="productDetail.jk?ref=${good.ref}">${good.good_name}<br>
			         	${str_price} : <fmt:formatNumber value="${good.price}"/></a><br>
			        </div>
			     </c:forEach>
	    	</div>
	    </c:if>
	    <div align="center">
		    <c:if test="${count gt 0}">
				<c:if test="${currentPage ne 1}">
					<a href="goodList.jk${url_pageNum}1${url_searchWord}${searchWord}">[◀◀]</a>
				<c:if test="${startPage gt pageBlock}">
					<a href="goodList.jk${url_pageNum}${startPage-pageBlock}${url_searchWord}${searchWord}">[◀]</a>
					</c:if>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq currentPage}">
					<span>[${i}]</span>
					</c:if>
					<c:if test="${i ne currentPage}">
					<a href="goodList.jk${url_pageNum}${i}${url_searchWord}${searchWord}">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage ne pageCount}">
					<c:if test="${pageCount>endPage}">
					<a href="goodList.jk${url_pageNum}${startPage+pageBlock}${url_searchWord}${searchWord}">[▶]</a>
					</c:if>
					<a href="goodList.jk${url_pageNum}${pageCount}${url_searchWord}${searchWord}">[▶▶]</a>
				</c:if>
			</c:if>
		</div> 
    </article>
</body>
</html>