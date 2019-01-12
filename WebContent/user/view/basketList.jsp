<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>	

		<!-- When logged in -->
		<c:if test="${id ne null}">
			<div class="container-fluid col-lg-10">
				<div class="mt-3"><h5 id="totalNumberOfItems">${str_itemsTotal}${basketCount}${str_quantityUnit}</h5></div>
				
				<!-- If Basket is empty -->
				<c:if test="${basketCount eq 0}">
					<div class="row font-weight-bold text-center mt-5 mb-5 pt-5 pb-5">
						${msg_emptyBasket}
					</div>
				</c:if>
				
				<!-- If Basket has items -->
				<c:if test="${basketCount ne 0}">
					<div class="row font-weight-bold text-center pt-5" id="emptyBasketDiv" hidden></div>
					<div class="row font-weight-bold text-center pt-5" id="basketDiv">
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
							<div class="form-group row border text-center basketListDiv" id="${basketList.productCode}">
								<script type="text/javascript">
									prodCode.push('${basketList.productCode}');
								</script>
								<div class="col-lg-1 pt-5">
									<input type="checkbox" class="itemChecked" id="itemChecked_${basketList.productCode}" name="itemChecked" value="${basketList.productCode}" checked>
								</div>
								<div class="col-lg-2">
									<img class="w-50" src="/urPresent/save/${basketList.thumbnail}" alt="Product Img">
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
											if('${basketList.productCode}'.length>5) {
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
											if('${basketList.productCode}'.length>5) {
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
										
										$('#selectColorOptions_${basketList.productCode}').on(
											'change',
											function(event) {
												if($('#selectColorOptions_${basketList.productCode}').val()!='unselected' && $('#selectSizeOptions_${basketList.productCode}').val()!='unselected') {
													
													var ref;
													if('${basketList.productCode}'.length>5) {
														ref='${basketList.productCode}'.substring(2, '${basketList.productCode}'.length-2);
													} else {
														ref='${basketList.productCode}';
													}
													
													var itemCode=$('#selectColorOptions_${basketList.productCode}').val()+ref+$('#selectSizeOptions_${basketList.productCode}').val();
													
													$.ajax({
														url: 'getProductQuantityAjax.jk',
														contentType: 'application/json; charset="UTF-8"',
														cache: false,
														data: {
															productCode: itemCode,
														},
														success: function(data) {
															console.log('product quantity fetch ${msg_success}');
															var prodQty=JSON.parse(data);	
															if(prodQty==0) {
																$('#basketQuantity_${basketList.productCode}').attr('disabled', true);
																$('#basketQuantity_${basketList.productCode}').attr('min', '0');
																$('#productPrice_${basketList.productCode}').text(0+'${str_currencyUnit}');
																$('#soldOut_${basketList.productCode}').text('${str_soldOut}');
																$('#itemChecked_${basketList.productCode}').removeAttr('checked');
																$('#itemChecked_${basketList.productCode}').attr('disabled', true);
															} else {
																$('#basketQuantity_${basketList.productCode}').attr('disabled', false);
																$('#basketQuantity_${basketList.productCode}').attr('min', '1');
																$('#basketQuantity_${basketList.productCode}').attr('max', prodQty);																
																$('#productPrice_${basketList.productCode}').text(('${basketList.productPrice}'*(100-'${basketList.discount}')/100)+'${str_currencyUnit}');
																$('#itemChecked_${basketList.productCode}').attr('checked', true);
																$('#itemChecked_${basketList.productCode}').attr('disabled', false);
															}
															
															if(prodQty<5) {
																$('#soldOut_${basketList.productCode}').text('${str_remainingProdQty}: '+prodQty);	
															}
															
															if(prodQty>=5) {
																$('#soldOut_${basketList.productCode}').text('');
															}
														},
														error: function(e) {
															console.log('product quantity fetch ${msg_failure}');
														}
													});
												}
											}
										);
										
										$('#selectSizeOptions_${basketList.productCode}').on(
											'change',
											function(event) {
												if($('#selectColorOptions_${basketList.productCode}').val()!='unselected' && $('#selectSizeOptions_${basketList.productCode}').val()!='unselected') {
													
													var ref;
													if('${basketList.productCode}'.length>5) {
														ref='${basketList.productCode}'.substring(2, '${basketList.productCode}'.length-2);
													} else {
														ref='${basketList.productCode}';
													}
													
													var itemCode=$('#selectColorOptions_${basketList.productCode}').val()+ref+$('#selectSizeOptions_${basketList.productCode}').val();
													
													$.ajax({
														url: 'getProductQuantityAjax.jk',
														contentType: 'application/json; charset="UTF-8"',
														cache: false,
														data: {
															productCode: itemCode,
														},
														success: function(data) {
															console.log('product quantity fetch ${msg_success}');
															var prodQty=JSON.parse(data);	
															if(prodQty==0) {
																$('#basketQuantity_${basketList.productCode}').attr('disabled', true);
																$('#basketQuantity_${basketList.productCode}').attr('min', '0');
																$('#productPrice_${basketList.productCode}').text(0+'${str_currencyUnit}');
																$('#soldOut_${basketList.productCode}').text('${str_soldOut}');
																$('#itemChecked_${basketList.productCode}').removeAttr('checked');
																$('#itemChecked_${basketList.productCode}').attr('disabled', true);
															} else {
																$('#basketQuantity_${basketList.productCode}').attr('disabled', false);
																$('#basketQuantity_${basketList.productCode}').attr('min', '1');
																$('#basketQuantity_${basketList.productCode}').attr('max', prodQty);
																$('#productPrice_${basketList.productCode}').text(('${basketList.productPrice}'*(100-'${basketList.discount}')/100)+'${str_currencyUnit}');
																$('#itemChecked_${basketList.productCode}').attr('checked', true);
																$('#itemChecked_${basketList.productCode}').attr('disabled', false);
															}
															
															if(prodQty<5) {
																$('#soldOut_${basketList.productCode}').text('${str_remainingProdQty}: '+prodQty);						
															}
															
															if(prodQty>=5) {
																$('#soldOut_${basketList.productCode}').text('');
															}
														},
														error: function(e) {
															console.log('product quantity fetch ${msg_failure}');
														}
													});
												}
											}
										);
									</script>
								</div>
								<div class="col-lg-1 pt-5 d-flex flex-column">
									<input type="number" name="basketQuantity_${basketList.productCode}" id="basketQuantity_${basketList.productCode}"
									class="form-control form-control-sm" value="${basketList.basketQuantity}" min="1" max="${basketList.productQuantity}">
									<small id="soldOut_${basketList.productCode}"></small>
									<script type="text/javascript">
										$(window).on(
											'load',
											function(event) {
												if('${basketList.productQuantity}'==0) {
													$('#basketQuantity_${basketList.productCode}').attr('disabled', true);
													$('#basketQuantity_${basketList.productCode}').attr('min', '0');
													$('#productPrice_${basketList.productCode}').text(0+'${str_currencyUnit}');
													$('#soldOut_${basketList.productCode}').text('${str_soldOut}');
													$('#itemChecked_${basketList.productCode}').removeAttr('checked');
													$('#itemChecked_${basketList.productCode}').attr('disabled', true);
												}
												
												if('${basketList.productQuantity}'<5) {
													$('#soldOut_${basketList.productCode}').text('${str_remainingProdQty}: ${basketList.productQuantity}');						
												}
											}
										);
									</script>
								</div>
								<div class="col-lg-2 pt-5">
									<div class="prodPrice" id="productPrice_${basketList.productCode}"></div>
									<script type="text/javascript">
										var qty_${basketList.productCode}='${basketList.basketQuantity}';
										var unitPrice_${basketList.productCode}='${basketList.productPrice}';
										var discount_${basketList.productCode}=(100-'${basketList.discount}')/100;
										var productPrice_${basketList.productCode}=qty_${basketList.productCode}
											*unitPrice_${basketList.productCode}*discount_${basketList.productCode};

										$('#productPrice_${basketList.productCode}').text(productPrice_${basketList.productCode}+'${str_currencyUnit}');
									
										$('#basketQuantity_${basketList.productCode}').on(
											'change',
											function(event) {
												var changedQty_${basketList.productCode}=this.value;
												var newProductPrice_${basketList.productCode}=productPrice_${basketList.productCode}
													*(changedQty_${basketList.productCode}/qty_${basketList.productCode});
												$('#productPrice_${basketList.productCode}').text(newProductPrice_${basketList.productCode}+'${str_currencyUnit}');
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
															$('#${basketList.productCode}').remove();
															basketCount=document.getElementsByClassName('basketListDiv').length;
															if(basketCount==0) {
																$('#basketDiv').remove();
																$('#totalPrice').remove();
																$('#continueShoppingBtn').remove();
																$('#basketListFormSubmitBtn').remove();
																$('#emptyBasketDiv').text(emptyBasket);
																$('#emptyBasketDiv').removeAttr('hidden');
																$('#totalNumberOfItems').text(emptyBasketCount);
															}
															
															prodCode=prodCode.filter(function(item) {
																return item!='${basketList.productCode}'
															})
															$('#totalNumberOfItems').text('${str_itemsTotal}'+basketCount+'${str_quantityUnit}');
														} else {
															alert('${msg_tryLater}');
														}
														
														var grandTotal=0;
														
														for(product in prodCode) {
															eachPrice=$('.prodPrice')[product].innerHTML;
															price=eval(eachPrice.substring(0, eachPrice.length-1));
															grandTotal=grandTotal+price;
														}
														
														$('#totalPrice').text('${str_totalPrice}: '+grandTotal+'${str_currencyUnit}');
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
							$(window).on(
								'load',
								function(e) {
									var grandTotal=0;
									for(product in prodCode) {
										var eachPrice=$('.prodPrice')[product].innerHTML;
										var price=eval(eachPrice.substring(0, eachPrice.length-1));
										grandTotal=grandTotal+price;
									}
									$('#totalPrice').text('${str_totalPrice}: '+grandTotal+'${str_currencyUnit}');
								}
							);
							
							$('.basketListForm').on(
								'change',
								function(event) {
									var grandTotal=0;
									
									for(product in prodCode) {
										stringConcat='itemChecked_'+prodCode[product];
										checkDiv=document.getElementById(stringConcat);
										if(checkDiv.checked) {
											eachPrice=$('.prodPrice')[product].innerHTML;
											price=eval(eachPrice.substring(0, eachPrice.length-1));
											grandTotal=grandTotal+price;
										}
									}
									
									$('#totalPrice').text('${str_totalPrice}: '+grandTotal+'${str_currencyUnit}');
								}
							);
							
						</script>
						<div class="text-right">
							<button type="button" class="btn mr-1" id="continueShoppingBtn" onclick="returnToList()">${btn_continueShopping}</button>
							<button type="submit" class="btn" id="basketListFormSubmitBtn">${btn_orderCheckedItems}</button>
							<script type="text/javascript">
								$('#basketListFormSubmitBtn').on(
									'click',
									function(event) {
										if($('.itemChecked:checked').length=='0') {
											event.preventDefault();
											alert('${msg_selectItemsToOrder}');
										} else {
											$('.itemChecked:checked').each(function(e) {
												for(product in prodCode) {
													var sizeSelector='selectSizeOptions_'+prodCode[product];
													var colorSelector='selectColorOptions_'+prodCode[product];
													
													var sizeSelection=document.getElementById(sizeSelector);
													var colorSelection=document.getElementById(colorSelector);
													
													if(prodCode[product]==this.value) {
														if(colorSelection.value=='unselected') {
															event.preventDefault();
															alert('${msg_selectColor}');
															return false;
														} else if(sizeSelection.value=='unselected') {
															event.preventDefault();
															alert('${msg_selectSize}');
															return false;
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
		<%@include file="../view/userCompanyInfo.jsp"%>
		<%@include file="../view/userFooter.jsp"%>
	</body>
</html>