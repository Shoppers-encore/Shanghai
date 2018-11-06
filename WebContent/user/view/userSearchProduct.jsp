<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>   
<head>
	<title>${searchWord}의 검색 결과</title>
	<style>
	   @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		/* 색상 체크박스를 위한 container */
		#colorcontainer {
		    position: relative;
		    padding-left: 20px;
		    cursor: pointer;
		    font-size: 11px;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    width : 20px;
		    border : none;
		}
		
		/* 디폴트 체크박스 숨기기 */
		#colorcontainer input {
		    position: absolute;
		    opacity: 0;
		    cursor: pointer;
		}
		
		/* 색상별 체크박스 커스터마이징 */
		.checkmark {
		    position: absolute;
		    top: 0;
		    left: 0;
		    height: 20px;
		    width: 20px;
		    background-color: #eee;
		}
		.checkmark#white {
		    height: 19px;
		    width: 19px;
		   background-color : #FFFFFF;
		   border : 1px solid;
		}
		.checkmark#black {
		   background-color : #000000;
		}
		.checkmark#red {
		   background-color : #FF0000;
		}
		.checkmark#blue {
		   background-color : #0000DC;
		}
		.checkmark#green {
		   background-color : #008000;
		}
		.checkmark#yellow {
		   background-color : #FFE400;
		}
		.checkmark#brown {
		   background-color : #5D4200;
		}
		.checkmark#navy {
		   background-color : #030066;
		}
		.checkmark#gray {
		   background-color : #BDBDBD;
		}
		.checkmark#beige {
		   background-color : #F2CB61;
		}
		.checkmark#skyblue {
		   background-color : #6EE3F7;
		}
		.checkmark#etc {
		   background: url('../images/rainbow.jpg') center/32px no-repeat; 
		}
		
		/* 체크박스 마킹 시 이미지 뜨게 설정 */
		.checkmark:after {
		    content: "";
		    position: absolute;
		    display: none;
		}
		
		/* 체크 시 표시 이미지를 띄워주기  */
		#colorcontainer input:checked ~ .checkmark:after {
		    display: block;
		}
		
		/* 체크이미지 조절 */
		#colorcontainer .checkmark:after {
		    left: 8px;
		    top: 3px;
		    width: 6px;
		    height: 10px;
		    border: solid white;
		    border-width: 0 2px 2px 0;
		    -webkit-transform: rotate(45deg);
		    -ms-transform: rotate(45deg);
		    transform: rotate(45deg);
		}
		/* 흰 색 체크박스는 다른 색과 달리 체크 이미지가 검정색+크기가 좀 달라서 따로 조정해줌 */
		#colorcontainer .checkmark#white:after {
		    left: 6px;
		    top: 2px;
		    width: 6px;
		    height: 10px;
		    border: solid black;
		    border-width: 0 2px 2px 0;
		}
		/* 말풍선 텍스트 영역 설정 */
		#colorcontainer .tooltiptext {
		    visibility: hidden;
		    width: 120px;
		    background-color: #ff0000;
		    color: #fff;
		    text-align: center;
		    border-radius: 6px;
		    padding: 5px 0;
		    position: absolute;
		    z-index: 1;
		    top: 23px;
		    left: 50%;
		    margin-left: -60px;
		    opacity: 0;
		    transition: opacity 0.3s;
		}
		#colorcontainer .tooltiptext#white {
		    background-color: #E1E1E1;
		    color: #000;
		}
		#colorcontainer .tooltiptext#black {
		    background-color: #000000;
		}
		#colorcontainer .tooltiptext#blue {
		    background-color: #0000DC;
		}
		#colorcontainer .tooltiptext#green {
		    background-color: #008000;
		}
		#colorcontainer .tooltiptext#yellow {
		    background-color: #FFE400;
		}
		#colorcontainer .tooltiptext#brown {
		    background-color: #5D4200;
		}
		#colorcontainer .tooltiptext#navy {
		    background-color: #030066;
		}
		#colorcontainer .tooltiptext#gray {
		    background-color: #BDBDBD;
		}
		#colorcontainer .tooltiptext#beige {
		    background-color: #F2CB61;
		}
		#colorcontainer .tooltiptext#skyblue {
		    background-color: #6EE3F7;
		}
		#colorcontainer .tooltiptext#etc {
		   background: url('../images/rainbow.jpg') left/120px no-repeat; 
		}
		#colorcontainer:hover .tooltiptext {
		    visibility: visible;
		    opacity: 0.7;
		}
	  </style>
	</head>
	<body>
		<div id="cart">
			<img id="cartImg" src="images/cart_red.png">
		</div>
		<div class="container">
		<%@ include file="../form/userHeader.jsp" %>
		<article><br>
	    	<c:if test="${ searchWord eq null}">
	    	<!-- 검색어가 null일 때 (초기 화면일 때와 암것도 안쓰고 검색 실행시) -->
					<br><br><br><br><br>
					<p>${msg_searchProduct}</p>
			</c:if>
			<c:if test="${ searchWord ne null and count eq 0 }">
			<!-- 검색어가 있고 검색 결과 개수가 0 또는 null일 때 -->
					<br><br><br><br><br>
					<p><b>${searchWord}</b> ${msg_noSearchResult}</p>
			</c:if>
			<form name="searchForm" action="userSearchProduct.jk" method="post" style="text-align:center;">
				<div class="input-group col-md-3 container-fluid">
				    <input type="text" class="form-control" name="searchWord" style="width:80%" autofocus placeholder="${msg_searchWithWord}">
				    <input type="submit" class="form-control btn btn-danger" value="${btn_search}" style="width:20%">
			  	</div>
				<div class="container-fluid col-md-4 row centered input-group" id="colors">
					<label class="container form-control " id="colorcontainer">
					    <input type="checkbox" name="color" value="WH">
					    <span class="checkmark" id="white"></span>
					    <span class="tooltiptext" id="white">${str_color_wht}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
				    	<input type="checkbox" name="color" value="BK">
				    	<span class="checkmark" id="black"></span>
				   		<span class="tooltiptext" id="black">${str_color_blk}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="RD">
						<span class="checkmark" id="red"></span>
						<span class="tooltiptext" id="red">${str_color_red}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="BL">
						<span class="checkmark" id="blue"></span>
						<span class="tooltiptext" id="blue">${str_color_blu}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="GN">
						<span class="checkmark" id="green"></span>
						<span class="tooltiptext" id="green">${str_color_grn}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="YL">
						<span class="checkmark" id="yellow"></span>
						<span class="tooltiptext" id="yellow">${str_color_ylw}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="BR">
						<span class="checkmark" id="brown"></span>
						<span class="tooltiptext" id="brown">${str_color_brn}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="NV">
						<span class="checkmark" id="navy"></span>
						<span class="tooltiptext" id="navy">${str_color_nvy}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="GR">
						<span class="checkmark" id="gray"></span>
						<span class="tooltiptext" id="gray">${str_color_gry}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="BG">
						<span class="checkmark" id="beige"></span>
						<span class="tooltiptext" id="beige">${str_color_beg}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="SK">
						<span class="checkmark" id="skyblue"></span>
						<span class="tooltiptext" id="skyblue">${str_color_sky}</span>
					</label>
					<label class="container form-control" id="colorcontainer">
						<input type="checkbox" name="color" value="ETC">
						<span class="checkmark" id="etc"></span>
						<span class="tooltiptext" id="etc">${str_color_etc}</span>
					</label>
			   </div>
				<br><br>
			</form>
			<c:if test="${ searchWord ne null and count ne 0 }">
			<!-- 검색어가 있고 검색 결과도 있을 때 -->
				<br><p>${count} ${msg_searchResult} <b>${searchWord}</b></p><br>
				<c:if test="${selectedColors ne null}">
					<p><b>${msg_selectedColors}</b>
						<c:if test="${selectedColors.contains('WH')}">
							${msg_color_wht}
						</c:if>
						<c:if test="${selectedColors.contains('BK')}">
							${msg_color_blk}
						</c:if>
						<c:if test="${selectedColors.contains('RD')}">
							${msg_color_red}
						</c:if>
						<c:if test="${selectedColors.contains('BL')}">
							${msg_color_blu}
						</c:if>
						<c:if test="${selectedColors.contains('GN')}">
							${msg_color_grn}
						</c:if>
						<c:if test="${selectedColors.contains('YL')}">
							${msg_color_ylw}
						</c:if>
						<c:if test="${selectedColors.contains('BR')}">
							${msg_color_brn}
						</c:if>
						<c:if test="${selectedColors.contains('NV')}">
							${msg_color_nvy}
						</c:if>
						<c:if test="${selectedColors.contains('GR')}">
							${msg_color_gry}
						</c:if>
						<c:if test="${selectedColors.contains('BG')}">
							${msg_color_beg}
						</c:if>
						<c:if test="${selectedColors.contains('SK')}">
							${msg_color_sky}
						</c:if>
						 <c:if test="${selectedColors.contains('ETC')}">
							${msg_color_etc}
						</c:if>
					</p>
				</c:if>
				<div class="row">
					<c:forEach var="product" items="${productList}">
						<div class="col-md-3"  align="center"><br>
							<img src="/WebProject/save/${product.thumbnail}" name="thumb"><br>
							<!-- How to get image names from image_info DataBean -->
							<a class="goodName" href="userProductDetail.jk?ref=${product.ref}">${product.productName}<br>
							<input type="hidden" name="" value="${product.ref}"> ${str_price} : <c:if test="${product.discount eq null or product.discount eq 0}"><fmt:formatNumber value="${product.productPrice}"/></c:if>
							<c:if test="${product.discount ne null and product.discount ne 0}"></c:if></a><br>
						</div>
					</c:forEach>
				</div>
		    </c:if>
		    <br>
		    <!-- pageBlock 12로 설정필!! -->
		    <div align="center">
			    <c:if test="${count gt 0}">
					<c:if test="${currentPage ne 1}">
						<a href="searchGood.jk?searchWord=${searchWord}&color=${color}">[◀◀]</a>
					<c:if test="${startPage gt pageBlock}">
						<a href="searchGood.jk?pageNum=${startPage-pageBlock}&searchWord=${searchWord}">[◀]</a>
						</c:if>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i eq currentPage}">
						<span>[${i}]</span>
						</c:if>
						<c:if test="${i ne currentPage}">
						<a href="searchGood.jk?pageNum=${i}&searchWord=${searchWord}">[${i}]</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage ne pageCount}">
						<c:if test="${pageCount>endPage}">
						<a href="searchGood.jk?pageNum=${startPage+pageBlock}&searchWord=${searchWord}">[▶]</a>
						</c:if>
						<a href="searchGood.jk?pageNum=${pageCount}&searchWord=${searchWord}">[▶▶]</a>
					</c:if>
				</c:if>
			</div>
		</article>
	  </div>
	  <footer style="color: lightgray">
	  <br><br>
	  	<div class="container">
	  		<div class="row">
	  			<div class="col-sm-12" style="text-align: center;">
	  			<p>Copyright &copy; 2018 삼김일정(3Kim1Jeong)</p></div>
	  		</div>
	  	</div>
	  </footer>
	</body>
</html>