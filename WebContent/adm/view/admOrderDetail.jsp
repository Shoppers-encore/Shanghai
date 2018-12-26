<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>주문상세 : ${orderCode}</title>
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
  .buttons {
  	float:right;
  }

  </style>
</head>
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%> 
   <!-- Adm Order Detail View Page -->
    <article class="col-sm-10 col-8" ><br><br>
    	<h4>${str_orderDetail} : ${orderCode}</h4>
    	<!-- <input type="button" class="btn btn-danger" value="${btn_orderCancel}" onclick="location='cancelOrder.jk'"> -->
	    <div class="buttons">
	 	   <a href="userList.jk" class="btn btn-secondary">${str_userList}</a>
	 	   <a href="admOrderList.jk" class="btn btn-info">${btn_orderList}</a>
	    </div>
	    <br>
	    <h5> ${str_order_detail} </h5>
	    <table class="table table-striped">
   			<thead>
   				<tr>
   					<th style="width:20%">${str_orderId}</th>
   					<th style="width:20%">${str_orderDate}</th>
   					<th style="width:30%">${str_orderAddress}</th>
   					<th style="width:20%">${str_orderStatus}</th>
   				</tr>
   			</thead>
   			<tbody>
   				<tr>
   				<c:set var="order" value="${orderDetailList}"/>
	   				<td><a href="admUserOrderList.jk?userid=${order.get(0).id}" >${order.get(0).id}</a></td>
	   				<td>${order.get(0).orderDate}</td>
	   				<td>${order.get(0).orderZipcode} ${order.get(0).orderAddress1} ${order.get(0).orderAddress2}</td>
	   				<td>
						<c:if test="${order.get(0).orderStatus eq 0}">
							${str_orderStatus0}
						</c:if>								
						<c:if test="${order.get(0).orderStatus eq 1}">
							${str_orderStatus1}
						</c:if>								
						<c:if test="${order.get(0).orderStatus eq 2}">
							${str_orderStatus2}
						</c:if>								
						<c:if test="${order.get(0).orderStatus eq 3}">
							${str_orderStatus3}
						</c:if>	
	   				</td>
   				</tr>
   			</tbody>
	    </table>
	    <br>
	    <h5>${str_product_detail}</h5>
	    <table class="table table-striped">
   			<thead>
   				<tr>
   					<th>${str_productCode}</th>
   					<th>${str_productName}</th>
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
							<td id="name_${order.productCode}">
							<script type="text/javascript">
								var key='${order.productCode}';
								var prodName=JSON.parse('${prodNames}')[key];
								$('#name_${order.productCode}').text(prodName);
							</script>
							</td>
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