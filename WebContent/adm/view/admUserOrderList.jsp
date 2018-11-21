<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<title>${str_userList}</title>
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
  div.totalUser {
  	float: right;
  }
  </style>
  
</head>
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%> 
	    <!-- User List View Page -->
	    <article class="col-sm-10 col-8" ><br><br>
	    	<h4>${userId} ${str_userOrderList}</h4>
	    	<div class="totalOrder">
	    		${userId} ${str_userOrderList} : ${count}${str_orderUnit}
	    	</div>
	   		<table class="table table-striped">
	   			<thead>
	   				<tr>
	   					<th>${str_orderCode}</th>
	   					<th>${str_orderDate}</th>
	   					<th>${str_orderCount}</th>
	   					<th>${str_orderStatus}</th>
	   					<th>${str_orderDetail}</th>
	   				</tr>
	   			</thead>
	   			<tbody>
	   			<c:if test="${count eq null or count eq 0}">	
					<tr>
						<td colspan="5" align="center">
							${msg_list_x}
						</td>
					</tr>
				</c:if>
				<c:if test="${count ne 0}">
	   				<c:forEach var="member" items="${members}">	<!-- member/members 명은 주미랑 확인 -->
	   					<tr>
	   						<td>${member.id}</td>
	   						<td>${member.name}</td>
	   						<td>${member.tel}</td>
	   						<td>${member.email}</td>
	   						<td>${member.address}</td>
	   						<td><input type="button" value="${str_orderList}" onclick="location='orderFind.jk?userid=${member.id}'"></td>
	   					</tr>
	   				</c:forEach>
	   			</c:if>
	   			</tbody>
	   		</table>
	   		<div align="center">
		   		<c:if test="${count gt 0}">
				<c:if test="${currentPage ne 1}">
					<a href="userList.jk">[◀◀]</a>
				<c:if test="${startPage gt pageBlock}">
					<a href="userList.jk?pageNum=${startPage-pageBlock}">[◀]</a>
					</c:if>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq currentPage}">
					<span>[${i}]</span>
					</c:if>
					<c:if test="${i ne currentPage}">
					<a href="userList.jk?pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage ne pageCount}">
					<c:if test="${pageCount>endPage}">
					<a href="userList.jk?pageNum=${startPage+pageBlock}">[▶]</a>
					</c:if>
					<a href="userList.jk?pageNum=${pageCount}">[▶▶]</a>
				</c:if>
				</c:if>
			</div>
	   </article>
</body>
</html>