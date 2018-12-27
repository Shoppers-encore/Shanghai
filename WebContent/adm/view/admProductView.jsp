<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<title>상품목록</title>
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
	    	<form name="searchForm" action="admProductView.jk" method="post">
					<div class="input-group">
					    <input type="text" class="form-control" name="searchWord" style="width:60%">
					    <input type="submit" class="form-control btn btn-danger" value="${btn_search}" style="width:20%">
				  	</div>
			</form>
		</div>
		<c:if test="${ searchWord ne null and count eq 0 }"> <!-- IF searchWord exists but no result for the query -->
					<br><p><b>${searchWord}</b> ${msg_noSearchResult}</p>
			</c:if>
			<c:if test="${searchWord ne null and searchWord != '' and count ne 0}"> <!-- IF searchWord exists and result(s) also exist -->
				<br><p>${count} ${msg_searchResult} <b>${searchWord}</b></p><br>
		</c:if>
		
			<c:if test="${productCount ne 0}">
		    	<div class="row">
		    		<c:forEach var="product" items="${productList}">
						<div class="col-md-3"  align="center"><br>
					  		<form name="${product.ref}">
					  			<a class="goodName" href="admProductDetail.jk?ref=${product.ref}">
									<img src="/urPresent/save/${product.thumbnail}" id="thumb" name="${product.ref}"><br>
						     		${product.productName}<br>
							    	<input type="hidden" name="id" value="${sessionScope.id}">
							    	<input type="hidden" name="productCode" value="${product.ref}">
									<input type="hidden" name="var" value="1">
									${str_price} : 
										<c:if test="${product.discount eq null or product.discount eq 0}">
											<fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="￦"/>
										</c:if>
										<c:if test="${product.discount ne 0}">
											<fmt:formatNumber value="${product.productPrice-(product.productPrice*product.discount/100)}" type="currency" currencySymbol="￦"/>
										</c:if>
								</a><br>
							</form>
						</div>
				     </c:forEach>
				    </div>
				    </c:if>
	    <div align="center">
		    <c:if test="${count gt 0}">
				<c:if test="${currentPage ne 1}">
					<a href="admProductView.jk${url_pageNum}1${url_searchWord}${searchWord}">[◀◀]</a>
				<c:if test="${startPage gt pageBlock}">
					<a href="admProductView.jk${url_pageNum}${startPage-pageBlock}${url_searchWord}${searchWord}">[◀]</a>
					</c:if>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq currentPage}">
					<span>[${i}]</span>
					</c:if>
					<c:if test="${i ne currentPage}">
					<a href="admProductView.jk${url_pageNum}${i}${url_searchWord}${searchWord}">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage ne pageCount}">
					<c:if test="${pageCount>endPage}">
					<a href="admProductView.jk${url_pageNum}${startPage+pageBlock}${url_searchWord}${searchWord}">[▶]</a>
					</c:if>
					<a href="admProductView.jk${url_pageNum}${pageCount}${url_searchWord}${searchWord}">[▶▶]</a>
				</c:if>
			</c:if>
		</div> 
    </article>
</body>
</html>