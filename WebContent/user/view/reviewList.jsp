<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${str_review}</title>
</head>
<c:set var="id" value="aaa" scope="session"/>
<body class="container">
	<!-- User Header -->
	<%@ include file="../../user/form/userHeader.jsp" %>
	<!-- Review Board List -->
	<article><br><br>
	    	<h4>${str_review}</h4>
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
						<c:forEach var="reviewlist" items="${reviewLists}">
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
			       <option value="ttl">제목</option>
			       <option value="ctt">내용</option>
			       <option value="both">제목+내용</option>
			       <option value="writer">작성자</option>
			     </select>
			   <input type="text" name="searchWord">
			   <input type="submit" value="검색">
			</form>
	    </article>
</body>
</html>