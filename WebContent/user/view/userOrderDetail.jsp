<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>
		
		<c:forEach var="orderedItem" items="${orderListByOrderCode}">
			<c:set var="orderAddress1" value="${orderedItem.orderAddress1}"/>		
			<c:set var="orderAddress2" value="${orderedItem.orderAddress2}"/>		
			<c:set var="orderZipcode" value="${orderedItem.orderZipcode}"/>		
		</c:forEach>
		
		<!-- When logged in -->
		<c:if test="${id ne null}">
			<div class="container-fluid col-lg-10">
				<div class="mt-3"><h5>${str_orderCode}: ${orderCode}</h5></div>
				<div class="row pt-2 pl-3">
					${str_orderDate}: ${orderDate}
				</div>
				<div class="row pt-2 pl-3">
					${str_orderAddress}: ${orderAddress1} ${orderAddress2} ${orderZipcode}
				</div>
				
				<div class="row font-weight-bold text-center pt-5">
					<div class="col-lg-2">
						${str_productImage}
					</div>
					<div class="col-lg-1">
						${str_productCode}
					</div>
					<div class="col-lg-3">
						${str_productName}
					</div>
					<div class="col-lg-1">
						${str_productQuantity}
					</div>
					<div class="col-lg-2">
						${str_productPrice}
					</div>
					<div class="col-lg-2">
						${str_orderStatus}
					</div>
					<div class="col-lg-1">
						${str_review}
					</div>
				</div>
				<c:forEach var="orderedItem" items="${orderListByOrderCode}">
					<div class="row border text-center mt-1"> 					
						<div class="col-lg-2">
							<img class="w-50" src="/urPresent/save/${orderedItem.thumbnail}" alt="Product Img">
						</div>
						<div class="col-lg-1 pt-5">
							${orderedItem.productCode}
						</div>
						<div class="col-lg-3 pt-5">
							${orderedItem.productName}
						</div>
						<div class="col-lg-1 pt-5">
							${orderedItem.orderQuantity}
						</div>
						<div class="col-lg-2 pt-5">
							${orderedItem.orderPrice}${str_currencyUnit}
						</div>
						<div class="col-lg-2 pt-5">
							<c:if test="${orderedItem.orderStatus eq 0}">
								${str_orderStatus0}
							</c:if>								
							<c:if test="${orderedItem.orderStatus eq 1}">
								${str_orderStatus1}
							</c:if>								
							<c:if test="${orderedItem.orderStatus eq 2}">
								${str_orderStatus2}
							</c:if>								
							<c:if test="${orderedItem.orderStatus eq 3}">
								${str_orderStatus3}
							</c:if>								
						</div>
						<div class="col-lg-1 pt-5">
							<button class="btn btn-sm review_${orderedItem.productCode}" disabled>${btn_writeReview}</button>
							<script type="text/javascript">
								var orderStatus='${orderedItem.orderStatus}';
								var orderedProductCode='${orderedItem.productCode}';
								
								if(orderStatus=='3' && '${reviewedItems}'!='') {
									var jsonObj=$.parseJSON('${reviewedItems}');
									if(!jsonObj['${orderedItem.productCode}']) {
	 									$('.review_${orderedItem.productCode}').attr('disabled', false);
									}
								} else if(orderStatus=='3' && '${reviewedItems}'=='') {
									$('.review_${orderedItem.productCode}').attr('disabled', false);
								}
								
								$('.review_${orderedItem.productCode}').on(
									'click',
									function(event) {
										window.location.href='reviewWriteForm.jk?productCode=${orderedItem.productCode}&orderCode=${orderCode}';
									} 
								);
							</script>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<%@include file="../view/userCompanyInfo.jsp"%>
		<%@include file="../view/userFooter.jsp"%>
	</body>
</html>