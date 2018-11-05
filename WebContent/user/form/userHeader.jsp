<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<head>

</head>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
		<a class="navbar-brand" href="main.jk">
			<img src="images/logo.png" alt="Logo">
		</a>
		<div class="dropdown">
			<a class="navbar-brand" href="#" data-toggle="dropdown">PRODUCT</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="userProductList.jk?category=TOP">TOP</a>
				<a class="dropdown-item" href="userProductList.jk?category=BOTTOM">BOTTOM</a>
			</div>
		</div>
		<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" href="userOrderList.jk">ORDER</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="userMyPage.jk">CUSTOMER</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="reviewList.jk">Review</a>
		</li>
		<c:if test="${sessionScope.id eq null or sessionScope.id.length() eq 0}">
			<li class="nav-item">
				<a class="nav-link" href="userLoginForm.jk">LOGIN</a>
			</li>
		</c:if>
		<c:if test="${sessionScope.id ne null}">
			<li class="nav-item">
				<a class="nav-link" href="logout.jk">LOGOUT</a>
			</li>
		</c:if>
		</ul>
	</div>
	
	<!-- ############################## ### 2 From here ################################## -->
	
	<a href="userSearchProduct.jk" id="search">
		<img src="images/red_magnifier.png" style="width:25px;">
		<span class="tooltiptext" id="search">${str_searchGood}</span>
	</a>

<!-- ############################## ### 2 To here ################################## -->

</nav>