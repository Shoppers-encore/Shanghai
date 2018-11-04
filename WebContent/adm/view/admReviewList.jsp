<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<title>${str_boardList}</title>
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
  .btn.write {
  	float: right;
  }

  </style>
</head>
<body class="container-fulid row">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%>
	    
	    <!-- Board List View Page -->
	    <article class="col-sm-10 col-8" ><br><br>
	    	<h4>${str_reviewList}</h4>
	    	<table class="table table-striped">
	   			<thead>
	   				<tr>
	   					<th>${str_productName}</th>
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
						<c:forEach var="reviewlist" items="${articles}">
							<tr>
								<td><a href="userProductDetail.jk?productCode=${reviewlist.productCode}">${reviewlist.productName}</a></td>
								<td><a href="reviewDetail.jk?reviewNo=${reviewlist.reviewNo}">
									<img src="${reviewlist.photo1}" style="width:50px; height:50px;">
									${reviewlist.title}</a></td>
								<td>${reviewlist.id}</td>
								<td>${reviewlist.reviewDate}</td>
							</tr>
						</c:forEach>
					</c:if>
    			</tbody>
    		</table>
    			<c:if test="${count gt 0}">
				<c:if test="${currentPage ne 1}">
					<a href="reviewList.jk">[◀◀]</a>
				<c:if test="${startPage gt pageBlock}">
					<a href="reviewList.jk?pageNum=${startPage-pageBlock}">[◀]</a>
					</c:if>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq currentPage}">
					<span>[${i}]</span>
					</c:if>
					<c:if test="${i ne currentPage}">
					<a href="reviewwList.jk?pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage ne pageCount}">
					<c:if test="${pageCount>endPage}">
					<a href="reviewList.jk?pageNum=${startPage+pageBlock}">[▶]</a>
					</c:if>
					<a href="reviewList.jk?pageNum=${pageCount}">[▶▶]</a>
				</c:if>
			</c:if>
			<br>
			<form name="searchForm" action="reviewList.js" method="post">
			     <select name="searchType">
			       <option value="ttl">${str_searchTitle}</option>
			       <option value="ctt">${str_content}</option>
			       <option value="both">${str_searchBoth}</option>
			       <option value="writer">${str_writer}</option>
			     </select>
			   <input type="text" name="searchWord">
			   <input type="submit" value="${btn_search}">
			</form>
	    </article>
</body>
</html>