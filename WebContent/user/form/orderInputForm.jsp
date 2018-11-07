<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
	<head>
		<title>${head_orderInputForm}</title>
	</head>
	<body>
		<%@ include file="../form/userHeader.jsp" %>
				
		<!-- If not logged in, redirect to login page -->
		<c:if test="${id eq null}">
			<c:redirect url="userLoginForm.jk"/>
		</c:if>
		
		<!-- When logged in -->
		<c:if test="${id ne null}">
			<div class="container-fluid col-lg-10">
				<div class="mt-3"><h5>${head_orderInputForm}</h5></div>
				
				<div class="row font-weight-bold text-center pt-5">
					<div class="col-lg-2">
						${str_productImage}
					</div>
					<div class="col-lg-4">
						${str_productName}
					</div>
					<div class="col-lg-1">
						${str_color}
					</div>
					<div class="col-lg-1">
						${str_size}
					</div>
					<div class="col-lg-1">
						${str_productQuantity}
					</div>
					<div class="col-lg-1">
						${str_productPrice}
					</div>
					<div class="col-lg-2">
						${str_saveToBasket}
					</div>
				</div>
				
				<form class="form orderInputForm" name="orderInputForm" method="post" action="orderInputPro.jk">
					<!-- This page is redirected from userProductDetail -->
					<c:if test="${identifier eq 0}">
						<input type="hidden" name="productCode" value="${basket.productCode}">
						<div class="row border text-center">
							<div class="col-lg-2">
								<img class="w-50" src="/Shanghai/images/${product.thumbnail}" alt="Product Img">
							</div>
							<div class="col-lg-4 pt-5">
								${product.productName}<br>
								<small id="discount_${basket.productCode}"></small>
								<script type="text/javascript">
									if('${product.discount}'!=0) {
										$('#discount_${basket.productCode}').text('${product.discount}${str_discount}');
									}
								</script>
							</div>
							<div class="col-lg-1 pt-5" id="color">
								<script type="text/javascript">
									var prodCode='${basket.productCode}';
									color=prodCode.substring(0,2);
									$('#color').text(color);
								</script>
							</div>
							<div class="col-lg-1 pt-5" id="size">
								<script type="text/javascript">
									size=prodCode.substring(prodCode.length-2,prodCode.length);
									$('#size').text(size);
								</script>
							</div>
							<div class="col-lg-1 pt-5">
								${basket.basketQuantity}
								<script type="text/javascript">
									var qty='${basket.basketQuantity}';
								</script>
								<input type="hidden" name="basketQuantity" value="${basket.basketQuantity}">
							</div>
							<div class="col-lg-1 pt-5" id="productPrice">
								<script type="text/javascript">
									var discount=(100-'${product.discount}')/100;
									var unitPrice='${product.productPrice}'
									var price=qty*unitPrice*discount;
									$('#productPrice').text(price+'${str_currencyUnit}');
								</script>
							</div>
							<div class="col-lg-2 pt-5">
								<button type="button" class="btn" id="saveToBasket">${btn_save}</button>
								<script type="text/javascript">
									$('#saveToBasket').on(
										'click',
										function(event) {
											$.ajax({
												url: 'cartInsert.jk',
												contentType: 'application/json; charset="UTF-8"',
												cache: false,
												data: {
													productCode: '${basket.productCode}',
													'var': '${basket.basketQuantity}'
												},
												success: function() {
													console.log('basket insert ${msg_success}');
													alert('${msg_saveSuccess}');
													window.location.href='main.jk';
												},
												error: function(e) {
													console.log('basket update ${msg_failure}');
													alert('${msg_systemFailure}');
												}
											});
										}
									);
								</script>
							</div>
						</div>
						<div class="text-right mt-2">
							<button type="button" class="btn" onclick="returnToList()">${btn_continueShopping}</button>
							<button type="submit" class="btn" id="basketListFormSubmitBtn">${btn_pay}</button>
						</div>
						
					</c:if>
					
					<!-- This page is redirected from basketList -->
					<c:if test="${identifier eq 1}">
						<c:forEach var="basket" items="${basket}">
							
						</c:forEach>
					</c:if>
				</form>
			</div>
			
			<!-- This page is redirected from userProductDetail; for some reason color and size options are null -->
			<!-- You are not supposed to see this page! -->
			<c:if test="${identifier eq 2}">
				<script type="text/javascript">
					alert('${msg_systemFailure}');
					window.location.href='basketList.jk';
				</script>
			</c:if>
		</c:if>
	</body>
</html>
