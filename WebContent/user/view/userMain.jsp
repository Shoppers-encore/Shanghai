<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>
		
		<div class="container col-10 text-center">
			<c:if test="${everOrdered eq null or everOrdered eq 0}">
				<c:if test="${bpCount eq null or bpCount eq 0 or bpList eq '[]'}">
				  	<div class="mt-5 pt-5">
						<p class="mt-5 pt-5 mb-5 pb-5">${msg_list_x}</p>
					</div>
				</c:if>
				<c:if test="${bpCount ne 0 and bpList ne '[]'}">
					<div class="jumbotron bg-white col-12 text-center bestProductJumbotron mb-0 h-100">
						<h5>BEST SELLING</h5>		
					</div>
					<hr class="mt-0">
					<div class="d-flex">
						<div class="col-1">
							<a class="carousel-control-prev" href="#bestCarousel" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true">
								</span>
							</a>
						</div>
						<div id="bestCarousel" class="carousel slide col-10" data-ride="carousel">
							<div class="carousel-inner row w-100 h-100 mx-auto">
							  	<c:forEach var="product" items="${bpList}">
							  		<div class="carousel-item bg-white">
										<div class="card cardItem border-0 mt-2 mb-2 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
									  		<form name="${product.ref}">
									  			<div onclick="location='userProductDetail.jk?ref=${product.ref}'"> 
													<img src="/urPresent/save/${product.thumbnail}" name="${product.ref}" class="card-img-top img-fluid" style="height:350px;">
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
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="col-1">
							<a class="carousel-control-next" href="#bestCarousel" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</c:if>
			</c:if>
			
			<c:if test="${everOrdered gt 0}">
				<c:if test="${recCount eq null or recCount eq 0 or recList eq '[]'}">
				  	<div class="mt-5 pt-5">
						<p class="mt-5 pt-5 mb-5 pb-5">${msg_list_x}</p>
					</div>
				</c:if>
				<c:if test="${recCount ne 0 and recList ne '[]'}">
					<div class="jumbotron bg-white col-12 text-center bestProductJumbotron mb-0 h-100">
						<h5>${id}${str_recommendations}</h5>
						<small>${str_recDescription}</small>		
					</div>
					<hr class="mt-0">
					<div class="d-flex">
						<div class="col-1">
							<a class="carousel-control-prev" href="#recCarousel" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true">
								</span>
							</a>
						</div>
						<div id="recCarousel" class="carousel slide col-10" data-ride="carousel">
							<div class="carousel-inner row w-100 h-100 mx-auto">
							  	<c:forEach var="product" items="${recList}">
							  		<div class="carousel-item bg-white">
										<div class="card cardItem border-0 mt-2 mb-2 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
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
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="col-1">
							<a class="carousel-control-next" href="#recCarousel" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</c:if>
			</c:if>		
		</div>	
		<hr>	
		<div class="container col-10 text-center">
			<div class="jumbotron bg-white col-12 text-center bestProductJumbotron mb-0 h-100">
				<h5>ALL PRODUCTS</h5>		
			</div>
			<hr class="mt-0">
			<c:if test="${productCount eq null or productCount eq 0}">
				<div class="mt-5 pt-5 mb-5 pb-5">
					<p class="mb-5 pb-5">${msg_list_x}</p>
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
							<a href="main.jk">
								<img src="/urPresent/images/rewind.png" class="rewindAndFastForward">
							</a>
							<c:if test="${startPage gt pageBlock}">
								<a href="main.jk?pageNum=${startPage-pageBlock}">
									<img src="/urPresent/images/return.png" class="returnAndForward">
								</a>
							</c:if>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i eq currentPage}">
								<span><strong>${i}</strong></span>
							</c:if>
							<c:if test="${i ne currentPage}">
								<a href="main.jk?pageNum=${i}" class="text-secondary"><strong>${i}</strong></a>
							</c:if>
						</c:forEach>
						<c:if test="${currentPage ne pageCount}">
							<c:if test="${pageCount gt endPage}">
								<a href="main.jk?pageNum=${startPage+pageBlock}">
									<img src="/urPresent/images/forward.png" class="returnAndForward">
								</a>
							</c:if>
							<a href="main.jk?pageNum=${pageCount}">
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
					$('.carousel-item').first().addClass('active');
					
					$('.carousel').carousel({
						interval: 9000
					})
								
 					$('.carousel-item').each(
						function(){
							var next = $(this).next();
							if (!next.length) {
								next = $(this).siblings(':first');
							}
							next.children(':first-child').clone().appendTo($(this));
							
							var itemsPerSlide=1; //"1" displays 3 items per slide
							
							for (var i=0;i<itemsPerSlide;i++) {
								next=next.next();
								if (!next.length) {
									next = $(this).siblings(':first');
								}
								next.children(':first-child').clone().appendTo($(this));
							}
						}
					);
					
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