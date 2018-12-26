<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>		
	
		<div class="container col-10 text-center">
	    	<c:if test="${productCount eq null or productCount eq 0 or productList eq '[]'}">
	    		<div class="mt-5 pt-5">
					<p align="center">${msg_list_x}</p>
				</div>
			</c:if>
			<c:if test="${productCount ne 0 and productList ne '[]'}">
		    	<div class="row">
		    		<c:forEach var="product" items="${productList}">
						<div class="col-md-3"  align="center"><br>
					  		<form name="${product.ref}">
					  			<a class="goodName" href="userProductDetail.jk?ref=${product.ref}">
									<img src="/Shanghai/save/${product.thumbnail}" id="thumb" name="${product.ref}"><br>
						     		${product.productName}<br>
							    	<input type="hidden" name="id" value="${sessionScope.id}">
							    	<input type="hidden" name="ref" value="${product.ref}">
									${str_price} : 
										<c:if test="${product.discount eq null or product.discount eq 0}">
											<fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="￦"/>
										</c:if>
										<c:if test="${product.discount ne 0}">
											<fmt:formatNumber value="${product.productPrice-(product.productPrice*product.discount/100)}" type="currency" currencySymbol="￦"/>
										</c:if>
								</a><br>
								<c:if test="${sessionScope.id ne null}">
							        <input type="button" id="cart" name="${product.ref}" value="장바구니">
								</c:if>
							</form>
							
						</div>
				     </c:forEach>
		    	</div>
		    </c:if>
		</div>
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
								alert('장바구니에 상품이 들어갔습니다.');
							}, 500 )
	  					});
	  				}
	  			);
  			}
  		);
  			
		function chatting(){
			window.open("chatView.jk");
		}
  	//-->
  </script>
</html>