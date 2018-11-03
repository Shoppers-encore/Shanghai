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
			
			<c:set var="i" value="1"/>
			<c:forEach var="prodColors" items="${productColors}">
				<c:set var="i" value="${i}"/>
				<c:set var="'colorOptions'+${i}" value="${prodColors}"/>
				<c:set var="i" value="${i+1}"/>
				<div>${i}: </div>
			</c:forEach>
			
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
					<c:if test="${!fn:startsWith(basketList.productCode, 'XX')}">					
						<div class="row border text-center">
							<div class="col-lg-2">
								<img class="w-50" src="/Shanghai/images/${basketList.thumbnail}" alt="Product Img">
							</div>
							<div class="col-lg-4 pt-5">
								${basketList.productName}
							</div>
							<div class="col-lg-2 pt-5">
								${productColors}
							</div>
							<div class="col-lg-2 pt-5">
								${productSizes}
							</div>
							<div class="col-lg-1 pt-5">
								${basketList.basketQuantity}
							</div>
							<div class="col-lg-1 pt-5">
								<button class="btn">${btn_delete}</button>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	</c:if>
</body>