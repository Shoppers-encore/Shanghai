<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
	<head>
		<title>메인 페이지</title>
	</head>
	<body>
      	<c:if test="${sessionScope.id ne null}">
			<div id="chat">
	        	<img id="chatImg" src="images/chaticon.jpg" onclick="chatting()">
	      	</div>
	      	<div id="cart">
				<img id="cartImg" src="images/cart_red.png">
				<form><input type="hidden" name="id" value="${sessionScope.id}"></form>
			</div>
		</c:if>
		<%@ include file="../form/userHeader.jsp" %>
		<article><br>
	    	<c:if test="${productCount eq null or productCount eq 0}">	
					<br><br><br><br><br>
					<p align="center">${msg_list_x}</p>
			</c:if>
			<c:if test="${productCount ne 0}">
		    	<div class="row">
		    		<c:forEach var="product" items="${productList}">
						<div class="col-md-3"  align="center"><br>
					  		<form name="${product.ref}">
					  			<a class="goodName" href="userProductDetail.jk?ref=${product.ref}">
									<img src="/WebProject/save/${product.thumbnail}" id="thumb" name="${product.ref}"><br>
						     		${product.productName}<br>
							    	<input type="hidden" name="id" value="${sessionScope.id}">
							    	<input type="hidden" name="productCode" value="${product.ref}">
									<input type="hidden" name="var" value="1">
									${str_price} : 
										<c:if test="${product.discount eq null or product.discount eq 0}">
											<fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="￦"/>
										</c:if>
										<c:if test="${product.discount ne 0}">
											<fmt:formatNumber value="${product.productPrice-(product.productPrice*product.discount/100)}" type="currency" currencySymbol="￦"/>
										</c:if>
								</a><br>
							</form>
						</div>
				     </c:forEach>
					<div align="center">
					    <c:if test="${count gt 0}">
							<c:if test="${currentPage ne 1}">
								<a href="main.jk">[◀◀]</a>
							<c:if test="${startPage gt pageBlock}">
								<a href="main.jk?pageNum=${startPage-pageBlock}">[◀]</a>
								</c:if>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i eq currentPage}">
								<span>[${i}]</span>
								</c:if>
								<c:if test="${i ne currentPage}">
								<a href="main.jk?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							<c:if test="${currentPage ne pageCount}">
								<c:if test="${pageCount>endPage}">
								<a href="main.jk?pageNum=${startPage+pageBlock}">[▶]</a>
								</c:if>
								<a href="main.jk?pageNum=${pageCount}">[▶▶]</a>
							</c:if>
						</c:if>
					</div>
		    	</div>
		    </c:if>
		</article>
	</body>
</html>