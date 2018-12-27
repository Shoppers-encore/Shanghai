<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<title>리뷰관리</title>
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
      clear: all;
  }
  ul.nav-pills {
      top: 20px;
      position: fixed;
  }
  div.card {
 	text-align: center;
  }
  .btn.write {
  	float: right;
  }

  </style>
</head>
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%>
	    
	    <!-- Board List View Page -->
	    <article class="col-sm-10 col-8"><br><br>
	    	<h4>${str_reviewList}</h4>
	    	<table class="table table-striped">
	   			<thead>
	   				<tr>
	   					<th>${str_productCode}</th>
	   					<th>${str_title}</th>
	   					<th>${str_writer}</th>
	   					<th>${str_reviewDate}</th>
	   				</tr>
	   			</thead>
	   			<tbody>
	   				<c:if test="${count eq null or count eq 0}">	
						<tr>
							<td colspan="4" align="center">
								${msg_list_x}
							</td>
						</tr>
					</c:if>
					<c:if test="${count ne 0}">
						<c:forEach var="reviewList" items="${reviewList}">
							<tr>
								<c:set var="productCode" value="${reviewList.productCode}"/>
								<td>${reviewList.productCode}</td>
								<td><a href="admReviewDetail.jk?reviewNo=${reviewList.reviewNo}&productCode=${reviewList.productCode}">
									${reviewList.title}</a></td>
								<td>${reviewList.id}</td>
								<td>${reviewList.reviewDate}</td>
							</tr>
						</c:forEach>
					</c:if>
    			</tbody>
    		</table>
    			<div align="center">
    			<c:if test="${count gt 0}">
				<c:if test="${currentPage ne 1}">
					<a href="admReviewList.jk">[◀◀]</a>
				<c:if test="${startPage gt pageBlock}">
					<a href="admReviewList.jk?pageNum=${startPage-pageBlock}${url_searchWord}${searchWord}">[◀]</a>
					</c:if>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq currentPage}">
					<span>[${i}]</span>
					</c:if>
					<c:if test="${i ne currentPage}">
					<a href="admReviewList.jk?pageNum=${i}${url_searchWord}${searchWord}">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage ne pageCount}">
					<c:if test="${pageCount>endPage}">
					<a href="admReviewList.jk?pageNum=${startPage+pageBlock}${url_searchWord}${searchWord}">[▶]</a>
					</c:if>
					<a href="admReviewList.jk?pageNum=${pageCount}${url_searchWord}${searchWord}">[▶▶]</a>
				</c:if>
			</c:if>
			</div>
			<br>
			<div align="center">
			<form name="searchForm" action="admReviewList.jk" method="post">
			     <select name="searchType">
			       <option value="ttl">${str_searchTitle}</option>
			       <option value="ctt">${str_content}</option>
			       <option value="both">${str_searchBoth}</option>
			       <option value="writer">${str_writer}</option>
			     </select>
			   <input type="text" name="searchWord">
			   <input type="submit" value="${btn_search}">
			</form>
			</div>
	    </article>
</body>
</html>