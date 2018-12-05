<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
	<head>
		<title>${head_best}</title>
		<style>
			div#cart {
				position: sticky;
				top: 300px;
				width: 120px;
				height: 150px;
				font-size: 20px;
				float: right;
			}
			div#chat {
				position: sticky;
				top: 600px;
				right: 120px;
				float: right;
			}
			img#cartImg {
				width: 30px;
				height: 30px;
			}
			img#chatImg {
				width: 40px;
				height: 40px;
			}
			img#thumb {
				width:80px;
				height:120px;
			}
		</style>
	</head>
	<body class="container">
      	<c:if test="${sessionScope.id ne null}">
			<div id="chat">
	        	<img id="chatImg" src="images/chaticon.jpg" onclick="chatting()">
	      	</div>
		</c:if>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
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
		</article>
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