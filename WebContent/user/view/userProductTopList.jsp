<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
	<head>
		<title>${category} 페이지</title>
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
		<%@ include file="../form/userHeader.jsp" %>
			<br>
			<a href="userProductTopList.jk">${str_cat_TnTOP_ALL}</a> &nbsp;/&nbsp;
			<a href="userProductTopList.jk?category=TSHIRTS">${str_cat_TSHIRTS}</a>&nbsp;/&nbsp;
			<a href="userProductTopList.jk?category=KNIT">${str_cat_KNIT}</a>
			<br>
		<article><br>
		<c:set var="id" value="aaa" scope="session"/>
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
					    <c:if test="${productCount gt 0}">
							<c:if test="${currentPage ne 1}">
								<a href="userProductShirtsList.jk?category=${category}">[◀◀]</a>
							<c:if test="${startPage gt pageBlock}">
								<a href="userProductShirtsList.jk?category=${category}&pageNum=${startPage-pageBlock}">[◀]</a>
								</c:if>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i eq currentPage}">
								<span>[${i}]</span>
								</c:if>
								<c:if test="${i ne currentPage}">
								<a href="userProductShirtsList.jk?category=${category}&pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							<c:if test="${currentPage ne pageCount}">
								<c:if test="${pageCount>endPage}">
								<a href="userProductShirtsList.jk?category=${category}&pageNum=${startPage+pageBlock}">[▶]</a>
								</c:if>
								<a href="userProductShirtsList.jk?category=${category}&pageNum=${pageCount}">[▶▶]</a>
							</c:if>
						</c:if>
					</div>
		    	</div>
		    </c:if>
		</article>
	</body>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript">
  	//<!--
  		$(document).ready(function(){
  			var cartDiv = document.getElementById( 'cart' );
  			$(document).on(
  				'click',
  				'img[id=cartImg]',
  				function(){
  					var foldbt = document.createElement( 'input' );
  					var cartbt = document.createElement( 'input' );
  					cartDiv.removeChild( document.getElementById( 'cartImg' ) );
  				//접기버튼 붙이기
  					foldbt.setAttribute( 'id', 'foldbt' );
  					foldbt.setAttribute( 'type', 'button' );
  					foldbt.setAttribute( 'class', 'btn btn-outline-danger btn-sm' );
  					foldbt.setAttribute( 'value', '${btn_fold}' );
  					cartDiv.appendChild( foldbt );
  				//장바구니 버튼 붙이기
  					cartbt.setAttribute( 'id', 'cartbt' );
  					cartbt.setAttribute( 'type', 'button' );
  					cartbt.setAttribute( 'class', 'btn btn-outline-danger btn-sm' );
  					cartbt.setAttribute( 'onclick', 'location="basketList.jk"');
  					cartbt.setAttribute( 'value', '${str_cart}' );
  					cartDiv.appendChild( cartbt );
				//장바구니 리스트 조회
  					show();
  			});
  			
  			$(document).on(
  				'click',
  				'input[id=foldbt]',
  				function (){
  					var cartDiv = document.getElementById( 'cart' );
  					var cartImg = document.createElement( 'img' );
  					cartImg.setAttribute( 'id', 'cartImg' );
  					cartImg.setAttribute( 'src', 'images/cart_red.png' );
  					if( document.getElementById( 'foldbt' ) ){
  						cartDiv.removeChild( document.getElementById( 'foldbt' ) );
  					}
  					if( document.getElementById( 'cartbt' ) ){
  						cartDiv.removeChild( document.getElementById( 'cartbt' ) );
  					}
  					if( document.getElementById( 'add_cart' ) ){
  						cartDiv.removeChild( document.getElementById ( 'add_cart' ) );
  					}
  					if( document.getElementById( 'table' ) ){
  						cartDiv.removeChild( document.getElementById( 'table' ) );
  					}
  					if( document.getElementById( 'cartImg' ) ){
  						cartDiv.removeChild( document.getElementById( 'cartImg' ) );
  					}
  					for( i=0; i<cartDiv.childNodes.length; i++ ){
  						cartDiv.removeChild( cartDiv.childNodes.item(i) );
  					}
  					cartDiv.appendChild( cartImg );
  				});
  			
  				//삭제 버튼 눌렀을 때 
  				$(document).on(
  	  				'click',
  	  				'input[value="${btn_x}"]',
  	  				function (event){
  	  					var targetid = $('input[value="${btn_x}"]').attr( "id" );
	  	  				$.ajax({
							type : 'POST',
							url : 'cartDelete.jk',
							data : $('form[name="' + targetid + '"]').serialize(),
							dataType : 'xml',
							success: setTimeout( function(){
								cartDiv.removeChild(document.getElementById('table'));
								show();
							}, 1000 )
	  					});
  	  				});
  	  				
  				//드래그 앤 드롭
	  			$("img[id~='thumb']").draggable({
	  	        	revert: "invalid",
	  	        	stack: ".draggable",
	  	        	helper: "clone"
	  	        });
	  			
	  	        $("#cart").droppable({
	  	        	activeClass: "ui-state-default",
	  	            hoverClass: "ui-state-hover",
	  	            drop: function (event, ui) {
	  	            if( document.getElementById ( 'add_cart' ) ){
	  	              document.getElementById( 'cart' ).removeChild( document.getElementById ( 'add_cart' ) );
	  	            }
	              	var draggable = ui.draggable;
	              	var targetname = draggable.attr( "name" );
	  	              $.ajax({
							type : 'POST',
							url : 'cartInsert.jk',
							data : $('form[name="' + targetname + '"]').serialize(),
							dataType : 'xml',
							success: setTimeout( function(){
								show();
							}, 1000 )
	  					});
  	        		}
  	        });
  		
  		//장바구니 리스트 조회 메소드
  		function show(){
  			$.ajax({
				type : 'POST',
				url : 'viewCart.jk',
				data: $('form').serialize(),
				success : function( data ){
					if( data.length > 0 ){
						$('#t').html('');
						var table = document.createElement( 'table' );
	  					var tbody = document.createElement( 'tbody' );
		  				table.setAttribute( 'border', '1' );
		  				table.setAttribute( 'id', 'table' );
	  					tbody.setAttribute( 'id', 't' );
	  					table.appendChild( tbody );
	  					cartDiv.appendChild( table );
						
						$.each(data, function(key, baskets){
							var html =
								'<tr>' +
								'<td><img style="width:50px; height:50px;" src="/Shanghai/save/' + baskets.thumbnail +'"></td>' 
								+ '<td><input type="button" id="' + baskets.productCode + '" class="btn btn-outline-secondary btn-sm" value="${btn_x}">'
								+ '<form name="' + baskets.productCode + '"><input type="hidden" name="id" value="${sessionScope.memid}"><input type="hidden" name="good_code" value="'
								+ baskets.productCode + '"></td></form></tr>';
								
								$(html).appendTo('#t');
						});
					} else {
 							var add_cart = document.createElement( 'img' );
 							add_cart.setAttribute( 'id', 'add_cart' );
 		  					add_cart.setAttribute( 'src', '/Shanghai/images/add_cart.png' );
 		  					cartDiv.appendChild( add_cart );
					}
				}
			});
  		}
  	});
	function chatting(){
		window.open("chatView.jk");
	}
  	//-->
  </script>
</html>