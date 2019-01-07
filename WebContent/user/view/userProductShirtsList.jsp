<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>		

		<div class="jumbotron col-12 bg-white text-center productCategoryJumbotron mb-0 h-100">
			<h5>${str_cat_BLnSHIRTS}</h5>		
			<small><a class="col-3 text-secondary" href="userProductShirtsList.jk">${str_cat_BLnSHIRTS_ALL}</a></small>
			<small><a class="col-3 text-secondary" href="userProductShirtsList.jk?category=BLOUSE">${str_cat_BLOUSE}</a></small>
			<small><a class="col-3 text-secondary" href="userProductShirtsList.jk?category=SHIRTS">${str_cat_SHIRTS}</a></small>
		</div>
		
		<div class="container col-10 text-center">
			<hr class="mt-0">
			<c:if test="${productCount eq null or productCount eq 0}">
				<div class="mt-5 pt-5 mb-5 pb-5">
					<p class="mt-5 pt-5 mb-5 pb-5">${msg_list_x}</p>
				</div>
			</c:if>
			
			<c:if test="${productCount ne 0}">				
				<c:forEach var="product" items="${productList}">
					<div class="card cardItem d-inline-flex border-0 mt-4 mb-4">
						<form name="${product.ref}">
							<div onclick="location='userProductDetail.jk?ref=${product.ref}'"> 
								<img src="/urPresent/save/${product.thumbnail}" name="${product.ref}" class="card-img-top img-fluid">
								<div class="mt-1 mb-1">
									<small>
										<span>${product.productName}</span>
										<br>
										<c:if test="${product.discount eq null or product.discount eq 0}">
											<fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="￦"/>
										</c:if> 
										<c:if test="${product.discount ne 0}">
											<fmt:formatNumber value="${product.productPrice-(product.productPrice*product.discount/100)}" 
											type="currency" currencySymbol="￦"/>
										</c:if>
									</small>
								</div>
								<input type="hidden" name="id" value="${sessionScope.id}">
								<input type="hidden" name="productCode" value="${product.ref}">
								<input type="hidden" name="var" value="1">
							</div>
							<c:if test="${sessionScope.id ne null}">
								<input class="btn btn-sm btn-outline-dark mt-1 mb-3" type="button" id="cart" name="${product.ref}" value="${btn_inputCart}">
							</c:if>	
						</form>
					</div>
				</c:forEach>
				     
				<div class="text-center">
					<c:if test="${productCount gt 0}">
						<c:if test="${currentPage ne 1}">
							<a href="userProductShirtsList.jk?category=${category}">
								<img src="/urPresent/images/rewind.png" class="rewindAndFastForward">
							</a>
							<c:if test="${startPage gt pageBlock}">
								<a href="userProductShirtsList.jk?category=${category}&pageNum=${startPage-pageBlock}">
									<img src="/urPresent/images/return.png" class="returnAndForward">
								</a>
							</c:if>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i eq currentPage}">
								<span><strong>${i}</strong></span>
							</c:if>
							<c:if test="${i ne currentPage}">
								<a href="userProductShirtsList.jk?category=${category}&pageNum=${i}"><strong>${i}</strong></a>
							</c:if>
						</c:forEach>
						<c:if test="${currentPage ne pageCount}">
							<c:if test="${pageCount gt endPage}">
								<a href="userProductShirtsList.jk?category=${category}&pageNum=${startPage+pageBlock}">
									<img src="/urPresent/images/forward.png" class="returnAndForward">
								</a>
							</c:if>
							<a href="userProductShirtsList.jk?category=${category}&pageNum=${pageCount}">
								<img src="/urPresent/images/fastForward.png" class="rewindAndFastForward">
							</a>
						</c:if>
					</c:if>
				</div>
			</c:if>
		</div>
		<%@include file="../view/userCompanyInfo.jsp"%>
		<%@include file="../view/userFooter.jsp"%>
	</body>
	
	<script type="text/javascript">
		//<!--
			$(document).ready(
				function(){
		  			var cartDiv = document.getElementById( 'cart' );
		  			$(document).on(
		  				'click',
		  				'input[id=cart]',
		  				
		  				function(){
		  					var name = this.name;
		  					$.ajax({
								type : 'POST',
								url : 'cartInsert.jk',
								data : $('form[name="' + name + '"]').serialize(),
								success: setTimeout( function(){
									var goToBasket=confirm('장바구니에 상품이 들어갔습니다. \n장바구니로 이동하시겠습니까?');
									if(goToBasket) {
										window.location.href='basketList.jk';
									}
								}, 500 )
		  					});
		  				}
		  			);
				}
			);
		//-->
	</script>
</html>