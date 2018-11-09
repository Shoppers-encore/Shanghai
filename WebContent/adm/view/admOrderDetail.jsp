<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
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
  .btn-danger {
  	float: right;
  }

  </style>
</head>
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%> 
   <!-- Adm Order Detail View Page -->
    <article class="col-sm-10 col-8" ><br><br>
    	<h4>${str_orderDetail}</h4>
    	<!-- <input type="button" class="btn btn-danger" value="${btn_orderCancel}" onclick="location='cancelOrder.jk'"> -->
	    <table class="table table-striped">
   			<thead>
   				<tr>
   					<th>${str_productCode}</th>
   					<th>${str_productQuantity}</th>
   					<th>${str_price}</th>
   				</tr>
   			</thead>
   			<tbody>
   				<c:if test="${count eq null or count eq 0}">	
					<tr>
						<td colspan="3" align="center">
							${msg_list_x}
						</td>
					</tr>
				</c:if>
				<c:if test="${count ne 0}">
					<c:forEach var="order" items="${orderDetailList}">
						<tr>
							<td>${order.productCode}</td>
							<td>${order.orderQuantity}</td>
							<td>${order.orderPrice}</td>
						</tr>
					</c:forEach>
				</c:if>
   			</tbody>
   		</table>
    </article>
</body>
</html>