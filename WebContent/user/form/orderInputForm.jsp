<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<title>${head_orderInputForm}</title>
	</head>
	<style>
	   @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	 * {
	   font-family: 'Nanum Gothic'sans-serif;
	 }
	</style>
	<link rel="stylesheet" href="${project}shanghai_style.css">
	<body class="registration">
	    <img class="iconMargin" src="images/shanghai_icon.png" alt="logo" width="350" height="150">
	    <hr>	 
		
		<div class="container-fluid col-lg-10 justify-content-center">
			<div class="mt-3"><h5>${head_orderInputForm}</h5></div>
				
			<!-- If not logged in, redirect to login page -->
			<c:if test="${id eq null}">
				<c:redirect url="userLoginForm.jk"/>
			</c:if>
			
			<!-- When logged in -->
			<c:if test="${id ne null}">				
				<form class="form inputform" name="inputform" method="post" action="orderInputPro.jk">
					<!-- This page is redirected from userProductDetail -->
					<c:if test="${identifier eq 0}">
						<input type="hidden" name="identifier" value="${identifier}">
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
								<input type="hidden" name="orderQuantity" value="${basket.basketQuantity}">
							</div>
							<div class="col-lg-1 pt-5" id="productPrice">
								<script type="text/javascript">
									var discount=(100-'${product.discount}')/100;
									var unitPrice='${product.productPrice}'
									var price=qty*unitPrice*discount;
									$('#productPrice').text(price+'${str_currencyUnit}');
									$(window).on(
										'load',
										function(event) {
											$('#orderPrice').attr('value', price);
										}
									);
								</script>
								<input type="hidden" id="orderPrice" name="orderPrice"/>
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
						
						<div class="col-sm-8">
							<div class="form-group row mt-3"><!-- Id -->
								<label for="id" class="col-sm-3 col-form-label"><strong>${str_orderId}</strong></label>
								<div class="col-sm-6">
									<input class="form-control border-0 text-center" type="text" name="id" id="id" 
									value="${userInfo.name}(${userInfo.id})" readonly>										
								</div>							
							</div>
							
							<div class="form-group row"><!-- tel -->
								<label for="tel" class="col-sm-3 col-form-label"><strong>${str_tel}*</strong></label>
								<div class="col-sm-6">
									<input class="form-control text-center" type="text" name=tel value="${userInfo.tel}" maxlength="12" required>											
								</div>			
							</div>
							
							<div class="form-group row"><!-- email -->
								<label for="email" class="col-sm-3 col-form-label"><strong>${str_email}*</strong></label>
								<div class="col-sm-6">
									<input class="form-control text-center" type="email" name=email  value="${userInfo.email}" maxlength="70" required>											
								</div>
								<div class="col-sm-1">
									<button class="btn btn-md btn-secondary" type="button"  onclick="mailTransfer()">${btn_selfConfirm}</button>					
								</div>				
							</div>
							
							<div class="form-group row"><!--zip code -->
								<label for="zipcode" class="col-sm-3 col-form-label"><strong>${str_zipcode}*</strong></label>
								<div class="col-sm-6">
									<input class="form-control text-center" type="text" name=orderZipcode id="zipcode" value="${userInfo.zipcode}" required>											
								</div>
								<div class="col-sm-1">
									<button class="btn btn-md btn-secondary" type="button"  value="주소 찾기" 
									onclick="sample4_execDaumPostcode()">${btn_search}</button>					
								</div>				
							</div>
							<div class="form-group row"><!--address -->
								<label for="address" class="col-sm-3 col-form-label"><strong>${str_address}*</strong></label>
								<div class="col-sm-6">
									<input class="form-control text-center" type="text" name=orderAddress1 id="address" value="${userInfo.address}" required>											
								</div>	
							</div>
							<div class="form-group row"><!--addressDetail -->
								<div class="col-sm-3"></div>
								<div class="col-sm-6">
									<input class="form-control text-center" type="text" name=orderAddress2 value="${userInfo.addressDetail}" required>											
								</div>
								<div class="col-sm-3 text-right"><h4 id="totalPrice"></h4></div>
								<script type="text/javascript">
									$(window).on(
										'load',
										function(e) {
											var productPrice=$('#productPrice').innerHTML;
											var grandTotal=price;
											$('#totalPrice').text('${str_totalPrice}: '+grandTotal+'${str_currencyUnit}');
										}
									);
								</script>	
							</div>
						</div>
						
						<div class="col-sm-12">
							<div class="text-right mt-2">
								<button type="button" class="btn" onclick="returnToBasket()">${btn_returnToBasket}</button>
									<script type="text/javascript">
										function returnToBasket() {
											window.location.href='basketList.jk';
										}
									</script>
								<button type="submit" class="btn" id="inputformSubmitBtn">${btn_pay}</button>
							</div>
						</div>
						
					</c:if>
					
					<!-- This page is redirected from basketList -->
					<c:if test="${identifier eq 1}">
						<input type="hidden" name="identifier" value="${identifier}">
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
							<div class="col-lg-2">
								${str_size}
							</div>
							<div class="col-lg-1">
								${str_productQuantity}
							</div>
							<div class="col-lg-2">
								${str_productPrice}
							</div>
						</div>
						<c:forEach var="basket" items="${basket}">
							<div class="form-group row border text-center" id="${basket.productCode}">
								<div class="col-lg-2">
									<img class="w-50" src="/Shanghai/images/${basket.thumbnail}" alt="Product Img">
								</div>
								<div class="col-lg-4 pt-5">
									${basket.productName}<br>
									<small id="discount_${basket.productCode}"></small>
									<script type="text/javascript">
										if('${basket.discount}'!=0) {
											$('#discount_${basket.productCode}').text('${basket.discount}${str_discount}');
										}
									</script>
								</div>
								<div class="col-lg-1 pt-5" id="color_${basket.productCode}"></div>
									<script type="text/javascript">
										var prodCode='${basket.productCode}';
										color=prodCode.substring(0,2);
										$('#color_${basket.productCode}').text(color);
									</script>
								
								<div class="col-lg-2 pt-5" id="size_${basket.productCode}"></div>					
									<script type="text/javascript">
										size=prodCode.substring(prodCode.length-2,prodCode.length);
										$('#size_${basket.productCode}').text(size);
									</script>
								
								<div class="col-lg-1 pt-5">${basket.basketQuantity}</div>
									<script type="text/javascript">
										var qty='${basket.basketQuantity}';
									</script>
								
								<div class="col-lg-2 pt-5">
									<div class="orderPrice" id="orderPrice_${basket.productCode}"></div>
									<input type="hidden" name="orderPrice_${basket.productCode}" value="orderPrice_${basket.productCode}">
									<script type="text/javascript">
										var qty='${basket.basketQuantity}';
										var unitPrice='${basket.productPrice}';
										var discount=(100-'${basket.discount}')/100;
										var orderPrice=qty*unitPrice*discount;

										$('#orderPrice_${basket.productCode}').text(orderPrice+'${str_currencyUnit}');
									</script>
								</div>
							</div>
						</c:forEach>		
						
						<div class="col-sm-8">
							<div class="form-group row mt-3"><!-- Id -->
								<label for="id" class="col-sm-3 col-form-label"><strong>${str_orderId}</strong></label>
								<div class="col-sm-6">
									<input class="form-control border-0 text-center" type="text" name="id" id="id" 
									value="${userInfo.name}(${userInfo.id})" readonly>										
								</div>							
							</div>
							
							<div class="form-group row"><!-- tel -->
								<label for="tel" class="col-sm-3 col-form-label"><strong>${str_tel}*</strong></label>
								<div class="col-sm-6">
									<input class="form-control text-center" type="text" name=tel value="${userInfo.tel}" maxlength="12" required>											
								</div>			
							</div>
							
							<div class="form-group row"><!-- email -->
								<label for="email" class="col-sm-3 col-form-label"><strong>${str_email}*</strong></label>
								<div class="col-sm-6">
									<input class="form-control text-center" type="email" name=email  value="${userInfo.email}" maxlength="70" required>											
								</div>
								<div class="col-sm-1">
									<button class="btn btn-md btn-secondary" type="button"  onclick="mailTransfer()">${btn_selfConfirm}</button>					
								</div>				
							</div>
							
							<div class="form-group row"><!--zip code -->
								<label for="zipcode" class="col-sm-3 col-form-label"><strong>${str_zipcode}*</strong></label>
								<div class="col-sm-6">
									<input class="form-control text-center" type="text" name=zipcode id="zipcode" value="${userInfo.zipcode}" required>											
								</div>
								<div class="col-sm-1">
									<button class="btn btn-md btn-secondary" type="button"  value="주소 찾기" 
									onclick="sample4_execDaumPostcode()">${btn_search}</button>					
								</div>				
							</div>
							<div class="form-group row"><!--address -->
								<label for="address" class="col-sm-3 col-form-label"><strong>${str_address}*</strong></label>
								<div class="col-sm-6">
									<input class="form-control text-center" type="text" name=address id="address" value="${userInfo.address}" required>											
								</div>	
							</div>
							<div class="form-group row"><!--addressDetail -->
								<div class="col-sm-3"></div>
								<div class="col-sm-6">
									<input class="form-control text-center" type="text" name=addressDetail value="${userInfo.addressDetail}" required>											
								</div>
								<div class="col-sm-3 text-right"><h4 id="totalPrice"></h4></div>		
							</div>
						</div>
						
						<script type="text/javascript">
							$(window).on(
								'load',
								function(e) {
									var grandTotal=0;
							
									for(i=0; i<$('.orderPrice').length; i++) {
										var eachPrice=$('.orderPrice')[i].innerHTML;
										var price=eval(eachPrice.substring(0, eachPrice.length-1));
										grandTotal=grandTotal+price;
									}
									$('#totalPrice').text('${str_totalPrice}: '+grandTotal+'${str_currencyUnit}');
								}
							);
						</script>		
						
						<div class="col-sm-12">
							<div class="text-right mt-2">
								<button type="button" class="btn" onclick="returnToBasket()">${btn_returnToBasket}</button>
									<script type="text/javascript">
										function returnToBasket() {
											window.location.href='basketList.jk';
										}
									</script>
								<button type="submit" class="btn" id="inputformSubmitBtn">${btn_pay}</button>
							</div>
						</div>
					</c:if>
				</form>
				
				<!-- This page is redirected from userProductDetail; for some reason color and size options are null -->
				<!-- You are not supposed to see this page! -->
				<c:if test="${identifier eq 2}">
					<script type="text/javascript">
						alert('${msg_systemFailure}');
						window.location.href='basketList.jk';
					</script>
				</c:if>
			</c:if>
		</div> <!-- container -->
	</body>
</html>