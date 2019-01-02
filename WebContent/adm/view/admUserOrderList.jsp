<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
	<title>${userid}님의 주문내역</title>
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
	    	<h4><b>${userid}</b> ${str_userOrderList} : ${count}${str_orderUnit}</h4>
			<a href="userList.jk" class="btn btn-secondary" style="float:right;">${str_userList}</a><br><br>
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
							${msg_emptyOrderList}
						</td>
					</tr>
				</c:if>
				<c:if test="${count ne 0}">
	   				<c:forEach var="distinctOrderList" items="${distinctOrderList}">	
	   					<tr>
	   						<td>${distinctOrderList.orderCode}</td>
	   						<td id="date_${distinctOrderList.orderCode}">
								<script type="text/javascript">
									var key='${distinctOrderList.orderCode}';
									var orderDate=JSON.parse('${orderDate}')[key];
									$('#date_${distinctOrderList.orderCode}').text(orderDate);
								</script>
							</td>
	   						<td id="count_${distinctOrderList.orderCode}">
								<script type="text/javascript">
									var orderCount=JSON.parse('${orderCount}')[key];
									$('#count_${distinctOrderList.orderCode}').text(orderCount+'${str_orderUnit}');
								</script>
							</td>
	   						<td>
								<c:if test="${distinctOrderList.orderStatus eq 0}">
									${str_orderStatus0}
								</c:if>								
								<c:if test="${distinctOrderList.orderStatus eq 1}">
									${str_orderStatus1}
								</c:if>								
								<c:if test="${distinctOrderList.orderStatus eq 2}">
									${str_orderStatus2}
								</c:if>								
								<c:if test="${distinctOrderList.orderStatus eq 3}">
									${str_orderStatus3}
								</c:if>			
	   						</td> 
	   						<td>
								<button class="btn btn-sm orderListDetails_${distinctOrderList.orderCode}">${btn_orderDetails}</button>
								<script type="text/javascript">
									$('.orderListDetails_${distinctOrderList.orderCode}').on(
										'click',
										function(event) {
											window.location.href='admOrderDetail.jk?orderCode=${distinctOrderList.orderCode}&orderDate='+orderDate;
										}
									);
								</script>
							</td>
	   					</tr>
	   				</c:forEach>
	   			</c:if>
	   			</tbody>
	   		</table>
	   		<div align="center">
		   		<c:if test="${count gt 0}">
					<c:if test="${currentPage ne 1}">
						<a href="admUserOrderList.jk?userid=${userid}&">[◀◀]</a>
						<c:if test="${startPage gt pageBlock}">
							<a href="admUserOrderList.jk?userid=${userid}&pageNum=${startPage-pageBlock}">[◀]</a>
						</c:if>
					</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq currentPage}">
					<span>[${i}]</span>
					</c:if>
					<c:if test="${i ne currentPage}">
					<a href="admUserOrderList.jk?userid=${userid}&pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage ne pageCount}">
					<c:if test="${pageCount>endPage}">
					<a href="admUserOrderList.jk?userid=${userid}&pageNum=${startPage+pageBlock}">[▶]</a>
					</c:if>
					<a href="admUserOrderList.jk?userid=${userid}&pageNum=${pageCount}">[▶▶]</a>
				</c:if>
				</c:if>
			</div>
	   </article>
</body>
</html>