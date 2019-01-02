<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<c:if test="${productCount eq null or productCount eq 0 or productList eq null}">
	  	<div class="mt-5 pt-5">
			<p align="center">${msg_list_x}</p>
		</div>
	</c:if>
	<c:if test="${productCount ne 0 and productList ne null}">
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
</html>