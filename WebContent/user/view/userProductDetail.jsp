<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>
		<script type="text/javascript">
			//<!--
			$(document).ready(
				function() {
					if(performance.navigation.type == 2){
						   location.reload(true);
					}
				}
			);
			
			$(document).ready(function(){
				$("select").change(function(){
					$("input[name='productCode']").val($("select[name='cl']").val()+$("input[name='reff']").val()+$("select[name='sz']").val());
					 $.ajax({
						type : 'POST',
						url : 'howManyQuantity.jk',
						data : $("input[name='productCode']").serialize(),
						dataType : "json",
						success: function(data){
							if(data.count>0){
								if(data.quantity == 0){
									alert("재고가 없습니다.");
									$("input[name='quantity']").val(data.quantity);
								}
								$("input[name='remainQuantity']").val(data.quantity);
								$("input[name='quantity']").attr("max",data.quantity);
								
							}
						}
					});
				});
				
				$("input:button[name='inputCart']").on("click",function(){
					if($("input[name='productCode']").val()==$("input[name='reff']").val()){
						checkSizeColor();
					}else if($("input[name='quantity']").val()==0 || $("input[name='remainQuantity']").val()==0){
						alert('수량을 선택해 주세요.');
					}else{
						location.href="basketInput.jk?productCode="+$("input[name='productCode']").val()+"&quantity="+$("input[name='quantity']").val()+"&ref="+$("input[name='reff']").val();
					}
				});
			});
			
			function checkSizeColor(){
				if($("select[name='cl']").val()==" " || $("select[name='sz']").val()==" "){
					alert('상품 세부사항을 선택해주세요');
					return false;
				}
				if($("input[name='quantity']").val()==0){
					alert('수량을 선택해 주세요.');
					return false;
				}
			}
			//-->
		</script>
		
		<div class="container col-10 productDetail text-center">
			<div class="productDetailImg mt-3">
				<img class="border w-100 pt-1 pb-1 pl-1 pr-1" src="/urPresent/save/${productList.get(0).thumbnail}" alt="Product Thumbnail">
			</div>
			<div class="productDetailDesc mt-5">
				<form method="post" name="productDetailForm" action="orderInputForm.jk" onsubmit="return checkSizeColor()">
					<h5 class="productName"><strong>${productList.get(0).productName}</strong></h5>
					<div class="form-inline justify-content-left mt-5">
						<div class="productLabel text-left mr-2">${str_price}:</div>
						<div class="productDesc">
							<c:if test="${productList.get(0).discount eq null or productList.get(0).discount eq 0}">
								<fmt:formatNumber value="${productList.get(0).productPrice}"/>
								<input type="hidden" name="price" value="${productList.get(0).productPrice}">
							</c:if>
							<c:if test="${productList.get(0).discount ne 0}">
								<fmt:formatNumber value="${productList.get(0).productPrice-(productList.get(0).productPrice*productList.get(0).discount/100)}"/>
								<input type="hidden" name="price" value="${productList.get(0).productPrice-(productList.get(0).productPrice*productList.get(0).discount/100)}">
							</c:if>
						</div>
						<div class="productPriceUnit">${str_currencyUnit}</div>
					</div>
					<div class="form-inline justify-content-left mt-2">
						<div class="productLabel text-left mr-2">${str_color}:</div>
						<div class="productDesc">
							<select name="cl">
								<option value=" " selected>${btn_select}</option>
								<c:forEach var="productColor" items="${colors}">
									<option value="${productColor}">${productColor}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-inline justify-content-left mt-2">
						<div class="productLabel text-left mr-2">${str_size}:</div>
						<div class="productDesc">
							<select name="sz">
								<option value=" " selected>${btn_select}</option>
								<c:forEach var="productSize" items="${sizes}">
									<option value="${productSize}">${productSize}</option>
								</c:forEach>
							</select>
						</div>
						<input type="hidden" id="reff" name="reff" value="${productList.get(0).ref}">
						<input type="hidden" id="productCode" name="productCode" value="${productList.get(0).ref}">
					</div>
					<div class="form-inline justify-content-left mt-2 mb-5">
						<div class="productLabel text-left mr-2">${str_productQuantity}:</div>
						<div class="productDesc">
							<input type="number" name="quantity" value="1" style="width:30px;" min="0">
							<input type="hidden" name="remainQuantity" value="0">
						</div>
					</div>
					<input type="submit" class="btn btn-secondary" value="${btn_buy}">
					<input type="button" id="basket" name="inputCart" class="btn btn-secondary" value="${btn_inputCart}">
				</form>
			</div>
		</div>
		<hr>
		<div class="container col-10 productDetail justify-content-center">
			${productList.get(0).productContent}
			<c:forEach var="img" items="${imageList}">
				<img src="/urPresent/save/${img.imageAddress}">
			</c:forEach>
		</div>	
		<hr>
		<div class="jumbotron bg-white mb-0 text-center">
			${str_leaveComment}
			<input type="button" class="btn btn-secondary" value="${str_review}" onclick="location='reviewList.jk?productName='"/>
		</div>
		<%@include file="../view/userCompanyInfo.jsp"%>
		<%@include file="../view/userFooter.jsp"%>
	</body>
</html>
