<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>주문관리</title>
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

  </style>
<script type="text/javascript">
//<!--
$(document).ready(function(){
   var btid = $('input[name=a]').val();
$('#btid').click(function(){
   var valueplus = $('input[name=btid]').val();
   var result = parseInt(valueplus) + 1;
   console.log(result);
$('input[name=btid]').attr('value', result)
});
});
//-->
</script>
</head>

<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%>
       
       <!-- Order List View Page -->
       <article class="col-sm-10 col-8" ><br><br>
          <h4>${str_admOrderList}</h4>
          <table class="table table-striped">
               <thead>
                  <tr>
                     <th>${str_orderCode}</th>
                     <th>${str_orderId}</th>
                     <th>${str_orderStatus}</th>
                     <th>${str_address}</th>
                     <th style="text-align:right">${str_totalPrice}</th>
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
                  <c:forEach var="order" items="${orders}"> 
                     <tr>
                        <td>${order.orderCode}</td>
                        <td>${order.id}<input type="hidden" name="id" value="${order.id}"></td>
                        <td><c:choose>
	                        	<c:when test="${order.orderStatus eq 0}">
	                        		<input type="text" value="${str_orderStatus0}" class="btn btn-outline-info btn-sm" id="status" name="${order.orderStatus}" style="width:80px" readonly>
	                        	</c:when>
	                        	<c:when test="${order.orderStatus eq 1}">
	                        		<input type="text" value="${str_orderStatus1}" class="btn btn-outline-info btn-sm" id="status" name="${order.orderStatus}" style="width:80px" readonly>
	                        	</c:when>
	                        	<c:when test="${order.orderStatus eq 2}">
	                        		<input type="text" value="${str_orderStatus2}" class="btn btn-outline-info btn-sm" id="status" name="${order.orderStatus}" style="width:80px" readonly>
	                        	</c:when>
	                        	<c:when test="${order.orderStatus eq 3}">
	                        		<input type="text" value="${str_orderStatus3}" class="btn btn-outline-info btn-sm" id="status" name="${order.orderStatus}" style="width:90px" readonly>
	                        	</c:when>
                        	</c:choose>
                        <c:if test="${order.orderStatus lt 3}">
                        	<input type="button" id="${order.orderCode}" class="btn btn-outline-info btn-sm" name="${order.orderCode}" value="${btn_confirm}" onclick="location='orderStatusChange.jk?id=${order.id}&orderCode=${order.orderCode}'">
                        </c:if>
                        </td>
                        <td>${order.orderAddress1} ${order.orderAddress2}<br></td>
   						<td id="sum_${order.orderCode}" style="text-align:right">
							<script type="text/javascript">
								var key='${order.orderCode}';
								var orderSum=JSON.parse('${orderSum}')[key].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								$('#sum_${order.orderCode}').text(orderSum+' ${str_currencyUnit}');
							</script>
						</td>
                        <td><a class="btn btn-sm btn-primary" href="admOrderDetail.jk?orderCode=${order.orderCode}">${btn_orderDetails}</a> 
                       		<input type="hidden" name="orderCode" value="${order.orderCode}"> </td>
                     </tr>
                  </c:forEach>
               </c:if>
             </tbody>
          </table>
          <div align="center">
             <c:if test="${count gt 0}">
            <c:if test="${currentPage ne 1}">
               <a href="admOrderList.jk">[◀◀]</a>
            <c:if test="${startPage gt pageBlock}">
               <a href="admOrderList.jk?pageNum=${startPage-pageBlock}">[◀]</a>
               </c:if>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
               <c:if test="${i eq currentPage}">
               <span>[${i}]</span>
               </c:if>
               <c:if test="${i ne currentPage}">
               <a href="admOrderList.jk?pageNum=${i}">[${i}]</a>
               </c:if>
            </c:forEach>
            <c:if test="${currentPage ne pageCount}">
               <c:if test="${pageCount>endPage}">
               <a href="admOrderList.jk?pageNum=${startPage+pageBlock}">[▶]</a>
               </c:if>
               <a href="admOrderList.jk?pageNum=${pageCount}">[▶▶]</a>
            </c:if>
         </c:if>
         </div>
       </article>

</body>
</html>