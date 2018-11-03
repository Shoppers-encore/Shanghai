<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>


<html>
<head>
<title>${head_basketList}</title>
</head>
<body>
	<!-- Customer ID only temporarily loaded to sessionScope -->
	<c:set var="id" value="aaa"/>
	<%@ include file="../form/userHeader.jsp" %>
	
	<!-- If not logged in, redirect to login page -->
	<c:if test="${id eq null}">
		<c:redirect url="userLoginForm.jk"/>
	</c:if>
	
	<!-- When logged in -->
	<c:if test="${id ne null}">
		<div class="container-fluid col-lg-10">
			<div class="mt-3"><h5>${str_itemsTotal}${basketCount}${str_quantityUnit}</h5></div>
			
			<!-- If Basket is empty -->
			<c:if test="${basketCount eq 0}">
				<div class="row font-weight-bold text-center pt-5">
					${msg_emptyBasket}
				</div>
			</c:if>
		
			<c:if test="${basketCount ne 0}">
				<div class="row font-weight-bold text-center pt-5">
					<div class="col-lg-2">
						${str_productImage}
					</div>
					<div class="col-lg-4">
						${str_productName}
					</div>
					<div class="col-lg-2">
						${str_color}
					</div>
					<div class="col-lg-2">
						${str_size}
					</div>
					<div class="col-lg-1">
						${str_productQuantity}
					</div>
					<div class="col-lg-1">
					</div>
				</div>
						
				<c:forEach var="basketList" items="${basketList}">					
						<div class="row border text-center ${basketList.productCode}">
							<div class="col-lg-2">
								<img class="w-50" src="/Shanghai/images/${basketList.thumbnail}" alt="Product Img">
							</div>
							<div class="col-lg-4 pt-5">
								${basketList.productName}
							</div>
							<div class="col-lg-2 pt-5 colorOptions_${basketList.productCode}">
								<script type="text/javascript">
									var key='${basketList.productCode}';
									var prodColors=JSON.parse('${colorOptions}')[key];
									$('.colorOptions_${basketList.productCode}').text(prodColors);
								</script>
							</div>
							<div class="col-lg-2 pt-5 sizeOptions_${basketList.productCode}">								
								<script type="text/javascript">
									var key='${basketList.productCode}';
									var prodSizes=JSON.parse('${sizeOptions}')[key];
									$('.sizeOptions_${basketList.productCode}').text(prodSizes);
								</script>
							</div>
							<div class="col-lg-1 pt-5">
								${basketList.basketQuantity}
							</div>
							<div class="col-lg-1 pt-5">
								<button class="btn basketItemDeleteBtn_${basketList.productCode}">${btn_delete}</button>
								<script type="text/javascript">
									$('.basketItemDeleteBtn_${basketList.productCode}').on(
										'click',
										function(event) {
											$.ajax({
												url: 'deleteBasketItemAjax.jk',
												contentType: 'application/json; charset="UTF-8"',
												cache: false,
												data: {
													productCode: '${basketList.productCode}',
												},
												success: function(data) {
													var isItemDeleted=JSON.parse(data);
													
													if(isItemDeleted=='true') {
														console.log('basket update 성공');
														$('.${basketList.productCode}').remove();
													} else {
														alert('죄송합니다. 잠시 후 다시 시도해 주세요.');
													}
												},
												error: function(e) {
													console.log('basket update 실패');
													alert('시스템 점검 중 입니다. 잠시 후 다시 시도해 주세요.');
												}
											});
										}
									);
								</script>
							</div>
						</div>
				</c:forEach>
			</c:if>
		</div>
	</c:if>
</body>