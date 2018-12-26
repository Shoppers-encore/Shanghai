 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>상품관리</title>
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
      position:fixed;
  }
  div.card {
    text-align: center;
  }
  .buttons {
     float: right;
  }
  </style>
</head>
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%> 
       <!-- Admin Good List View Page -->
	<article class="col-sm-10 col-8" ><br><br>
		<h4>${str_admProductList}</h4>
		<div class="col-sm-4 container-fluid centered">
	    	<form name="searchForm" action="admProductList.jk" method="post">
					<div class="input-group">
					    <input type="text" class="form-control" name="searchWord" style="width:60%">
					    <input type="submit" class="form-control btn btn-danger" value="${btn_search}" style="width:20%">
				  	</div>
			</form>
		</div>
		<c:if test="${ searchWord ne null and count eq 0 }"> <!-- IF searchWord exists BUT no result for the query -->
					<br><p><b>${searchWord}</b> ${msg_noSearchResult}</p>
			</c:if>
			<c:if test="${searchWord ne null and searchWord != '' and count ne 0}"> <!-- IF searchWord exists AND result(s) also exist -->
				<br><p>${count} ${msg_searchResult} <b>${searchWord}</b></p><br>
		</c:if>
		<div class="buttons">
			<a href="tagList.jk" class="btn btn-info">${btn_manageTag}</a>
			<a href="productInputForm.jk" class="btn btn-primary">${btn_goodInput}</a><br><br>
		</div>
	<form method="post" action="changeQuantity.jk">
		<table class="table">
			<thead class="thead-light">
				<tr align="center">
					<th>${str_productCode}</th>
					<th>${str_productName}</th>
					<th>${str_salePercent}</th>
					<th>${str_price}</th>
					<th>${str_var}</th>
					<th>${str_quantityMod}</th>
   				</tr>
			</thead>
			<tbody>
   				<c:if test="${count eq null or count eq 0}">  
				<tr>
					<td colspan="7" align="center">
					${msg_list_x}
					</td>
				</tr>
				</c:if>
				<c:if test="${count ne 0}">
					<c:forEach var="product" items="${products}">  
						<tr align="center">
							<td>
							${product.productCode}
							<input type="hidden" name="productCode" value="${product.productCode}">
							</td>
							<td>${product.productName}</td>
							<td>${product.discount}</td>
							<td>${product.productPrice}</td>
							<td>
							${product.productQuantity}
							<input type="hidden" name="quantity" value="${product.productQuantity}">
							</td>
							<td><input type="text" name="quantityMod" value="0" style="width:50px;"></td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="7" align="right">
							<input type="submit" class="btn btn-danger" value="${btn_save}">
							<input type="reset" class="btn btn-secondary" value="${btn_cancel}">
							</td>
						</tr>
				</c:if>
			</tbody>
		</table>
	</form>
         <div align="center">
               <c:if test="${count gt 0}">
               <c:if test="${currentPage ne 1}">
                  <a href="admProductList.jk${url_pageNum}1${url_searchWord}${searchWord}">[◀◀]</a>
               <c:if test="${startPage gt pageBlock}">
                  <a href="admProductList.jk${url_pageNum}${startPage-pageBlock}${url_searchWord}${searchWord}">[◀]</a>
                  </c:if>
               </c:if>
               <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <c:if test="${i eq currentPage}">
                  <span>[${i}]</span>
                  </c:if>
                  <c:if test="${i ne currentPage}">
                  <a href="admProductList.jk${url_pageNum}${i}${url_searchWord}${searchWord}">[${i}]</a>
                  </c:if>
               </c:forEach>
               <c:if test="${currentPage ne pageCount}">
                  <c:if test="${pageCount>endPage}">
                  <a href="admProductList.jk${url_pageNum}${startPage+pageBlock}${url_searchWord}${searchWord}">[▶]</a>
                  </c:if>
                  <a href="admProductList.jk${url_pageNum}${pageCount}${url_searchWord}${searchWord}">[▶▶]</a>
               </c:if>
            </c:if>
		</div>
	</article>
</body>
</html>