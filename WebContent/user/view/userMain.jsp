<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
<head>
<title>${head_main}</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Nanum Gothic';
}
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}

.nav-brand img {
	width: 40px;
}

body {
	position: relative;
}

ul.nav-pills {
	top: 20px;
	position: fixed;
}

div.card {
	text-align: center;
}

div#chat {
	position: sticky;
	top: 900px;
	float: right;
}

#cartImg {
	width: 40px;
	height: 40px;
}

img#chatImg {
	width: 40px;
	height: 40px;
}

img#thumb {
	width: 80px;
	height: 120px;
}
</style>
</head>
<body class="container">
	<c:if test="${sessionScope.id ne null}">
		<div id="chat">
			<img id="chatImg" src="images/chaticon.jpg" onclick="chatting()">
		</div>
	</c:if>
	<header id="demo" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/1809main02.png" alt="main01" width="767px"
					height="480px">
			</div>
			<div class="carousel-item">
				<img src="images/1809main01.png" alt="main02">
			</div>
			<div class="carousel-item">
				<img src="images/1809main03.png" alt="main03">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>


	</header>

	<%@ include file="../form/userHeader.jsp"%>
	<article>
		<br>
		<c:if test="${productCount eq null or productCount eq 0}">
			<br>
			<br>
			<br>
			<br>
			<br>
			<p align="center">${msg_list_x}</p>
		</c:if>
		<c:if test="${productCount ne 0}">
			<div class="row">
				<c:forEach var="product" items="${productList}">
					<div class="col-md-3" align="center">
						<br>
						<form name="${product.ref}">
							<a class="goodName"
								href="userProductDetail.jk?ref=${product.ref}"> <img
								src="/Shanghai/save/${product.thumbnail}" id="thumb"
								name="${product.ref}"><br> ${product.productName}<br>
								<input type="hidden" name="id" value="${sessionScope.id}">
								<input type="hidden" name="productCode" value="${product.ref}">
								<input type="hidden" name="var" value="1">
								<c:if test="${product.discount eq null or product.discount eq 0}">
									<fmt:formatNumber value="${product.productPrice}"
										type="currency" currencySymbol="￦"/>
								</c:if> <c:if test="${product.discount ne 0}">
									<fmt:formatNumber
										value="${product.productPrice-(product.productPrice*product.discount/100)}"
										type="currency" currencySymbol="￦"/>
								</c:if>
							</a><br>
							<c:if test="${sessionScope.id ne null}">
								<input type="button" id="cart" name="${product.ref}"
									value="장바구니">
							</c:if>
						</form>

					</div>
				</c:forEach>
				<div align="center">
					<c:if test="${productCount gt 0}">
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