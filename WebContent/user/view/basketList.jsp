<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
	<head>
		<title>${head_basketList}</title>
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
				<div class="mt-3"><h5 id="totalNumberOfItems">${str_itemsTotal}${basketCount}${str_quantityUnit}</h5></div>
				
				<!-- If Basket is empty -->
				<c:if test="${basketCount eq 0}">
					<div class="row font-weight-bold text-center pt-5">
						${msg_emptyBasket}
					</div>
				</c:if>
				
				<!-- If Basket has items -->
				<c:if test="${basketCount ne 0}">
					<div class="row font-weight-bold text-center pt-5">
						<div class="col-lg-1">
							${str_select}
						</div>
						<div class="col-lg-2">
							${str_productImage}
						</div>
						<div class="col-lg-3">
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
						<div class="col-lg-2">
							${str_productPrice}
						</div>
						<div class="col-lg-1">
						</div>
					</div>
					
					<script type="text/javascript">
						var prodCode=[];
					</script>
					<form class="form basketListForm" name="basketListForm" method="post" action="basketListPro.jk">
						<c:forEach var="basketList" items="${basketList}">				
							<div class="form-group row border text-center" id="${basketList.productCode}">
								<script type="text/javascript">
									prodCode.push('${basketList.productCode}');
								</script>
								<div class="col-lg-1 pt-5">
									<input type="checkbox" id="itemChecked" name="itemChecked" value="${basketList.productCode}" checked>
								</div>
								<div class="col-lg-2">
									<img class="w-50" src="/Shanghai/images/${basketList.thumbnail}" alt="Product Img">
								</div>
								<div class="col-lg-3 pt-5">
									${basketList.productName}<br>
									<small id="discount_${basketList.productCode}"></small>
									<script type="text/javascript">
										if('${basketList.discount}'!=0) {
											$('#discount_${basketList.productCode}').text('${basketList.discount}${str_discount}');
										}
									</script>
								</div>
								<div class="col-lg-1 pt-5">
									<select class="" id="selectColorOptions_${basketList.productCode}" name="selectColorOptions_${basketList.productCode}"><option value="unselected" selected>${str_select}</option></select>
									<script type="text/javascript">
										var key='${basketList.productCode}';
										var prodColors=JSON.parse('${colorOptions}')[key];
										for(var color in prodColors) {
											if('${basketList.productCode}'.length>3) {
												if('${basketList.productCode}'.substring(0,2)==prodColors[color]) {
													$('#selectColorOptions_${basketList.productCode}').removeAttr('selected');
													$('#selectColorOptions_${basketList.productCode}').append('<option value="'+prodColors[color]+'" selected>'+prodColors[color]+'</option>');
												} else {
													$('#selectColorOptions_${basketList.productCode}').append('<option value="'+prodColors[color]+'">'+prodColors[color]+'</option>');
												}
											} else {
												$('#selectColorOptions_${basketList.productCode}').append('<option value="'+prodColors[color]+'">'+prodColors[color]+'</option>');
											} 
										}
									</script>
								</div>
								<div class="col-lg-1 pt-5">							
									<select class="" id="selectSizeOptions_${basketList.productCode}" name="selectSizeOptions_${basketList.productCode}"><option value="unselected" selected>${str_select}</option></select>
									<script type="text/javascript">
										var prodSizes=JSON.parse('${sizeOptions}')[key];
										
										for(var size in prodSizes) {
											if('${basketList.productCode}'.length>3) {
												if('${basketList.productCode}'.substring('${basketList.productCode}'.length-2,'${basketList.productCode}'.length)==prodSizes[size]) {
													$('#selectSizeOptions_${basketList.productCode}').removeAttr('selected');
													$('#selectSizeOptions_${basketList.productCode}').append('<option value="'+prodSizes[size]+'" selected>'+prodSizes[size]+'</option>');
												} else {
													$('#selectSizeOptions_${basketList.productCode}').append('<option value="'+prodSizes[size]+'">'+prodSizes[size]+'</option>');
												}
											} else {
												$('#selectSizeOptions_${basketList.productCode}').append('<option value="'+prodSizes[size]+'">'+prodSizes[size]+'</option>');
											}	
										}
									</script>
								</div>
								<div class="col-lg-1 pt-5 d-flex flex-column">
									<input type="number" name="basketQuantity_${basketList.productCode}" id="basketQuantity_${basketList.productCode}"
									class="form-control form-control-sm" value="${basketList.basketQuantity}" min="1" max="${basketList.productQuantity}">
									<small id="soldOut_${basketList.productCode}"></small>
									<script type="text/javascript">
										if('${basketList.productQuantity}'<5) {
											$('#soldOut_${basketList.productCode}').text('${str_remainingProdQty}: ${basketList.productQuantity}');
										} else if('${basketList.productQuantity}'==0) {
											$('#basketQuantity_${basketList.productCode}').attr('min', 0);
											$('#soldOut_${basketList.productCode}').text('${str_soldOut}');							
										}
									</script>
								</div>
								<div class="col-lg-2 pt-5">
									<div class="prodPrice" id="productPrice_${basketList.productCode}"></div>
									<script type="text/javascript">
										var qty='${basketList.basketQuantity}';
										var unitPrice='${basketList.productPrice}';
										var discount=(100-'${basketList.discount}')/100;
										var productPrice=qty*unitPrice*discount;

										$('#productPrice_${basketList.productCode}').text(productPrice+'${str_currencyUnit}');
									
										$('#basketQuantity_${basketList.productCode}').on(
											'change',
											function(event) {
												var changedQty=$('#basketQuantity_${basketList.productCode}').val();
												var newProductPrice=changedQty*unitPrice*discount;
												$('#productPrice_${basketList.productCode}').text(newProductPrice+'${str_currencyUnit}');
											}
										);
									</script>
								</div>
								<div class="col-lg-1 pt-5">
									<button class="btn" id="basketItemDeleteBtn_${basketList.productCode}">${btn_delete}</button>
									<script type="text/javascript">
										$('#basketItemDeleteBtn_${basketList.productCode}').on(
											'click',
											function(event) {
												event.preventDefault();
												var basketCount='${basketCount}';
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
															console.log('basket update ${msg_success}');
															$('#${basketList.productCode}').remove()
															basketCount--;
															prodCode=prodCode.filter(function(item) {
																return item!='${basketList.productCode}'
															})
															$('#totalNumberOfItems').text('${str_itemsTotal}'+basketCount+'${str_quantityUnit}');
														} else {
															alert('${msg_tryLater}');
														}
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
						</c:forEach>
						<div class="col-lg-12 text-right mb-3"><h5 id="totalPrice"></h5></div>
						<script type="text/javascript">
							var grandTotal=0;
							for(product in prodCode) {
								var eachPrice=$('.prodPrice')[product].innerHTML;
								var price=eval(eachPrice.substring(0, eachPrice.length-1));
								grandTotal=grandTotal+price;
							}
							$('#totalPrice').text('${str_totalPrice}: '+grandTotal+'${str_currencyUnit}');
							
							$('.basketListForm').change(function(event) {
								var grandTotal=0;
								
								for(product in prodCode) {
									eachPrice=$('.prodPrice')[product].innerHTML;
									price=eval(eachPrice.substring(0, eachPrice.length-1));
									grandTotal=grandTotal+price;
								}
								
								$('#totalPrice').text('${str_totalPrice}: '+grandTotal+'${str_currencyUnit}');
							});
							
						</script>
						<div class="text-right">
							<button type="button" class="btn mr-1" onclick="returnToList()">${btn_continueShopping}</button>
							<button type="submit" class="btn" id="basketListFormSubmitBtn">${btn_orderCheckedItems}</button>
							<script type="text/javascript">
										
								$('#basketListFormSubmitBtn').on(
									'click',
									function(event) {
										if($('#itemChecked:checked').length=='0') {
											event.preventDefault();
											alert('${msg_selectItemsToOrder}');
										} else {
											$('#itemChecked:checked').each(function(e) {
												for(product in prodCode) {
													var sizeSelector='selectSizeOptions_'+prodCode[product];
													var colorSelector='selectColorOptions_'+prodCode[product];
													
													var sizeSelection=document.getElementById(sizeSelector);
													var colorSelection=document.getElementById(colorSelector);
													
													if(prodCode[product]==this.value) {
														if(colorSelection.value=='unselected') {
															event.preventDefault();
															alert('${msg_selectColor}');
															break;
														} else if(sizeSelection.value=='unselected') {
															event.preventDefault();
															alert('${msg_selectSize}');
															break;
														}
													}	
												}
											});
										}
									}
								);
							</script>
						</div>
					</form>
				</c:if>
			</div>
		</c:if>
	</body>
</html>