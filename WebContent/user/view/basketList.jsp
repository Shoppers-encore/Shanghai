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
						${str_productQuantity}
					</div>
					<div class="col-lg-2">
						${str_}
					</div>
				</div>
				<c:forEach var="basketList" items="${basketList}">
					<div class="row border text-center">
						<div class="col-lg-2">
							<img class="w-50" src="/Shanghai/images/${basketList.thumbnail}" alt="Product Img">
						</div>
						<div class="col-lg-4 pt-5">
							${basketList.productName}
						</div>
						<div class="col-lg-2 pt-5">
							${basketList.basketQuantity}
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</c:if>
</body>