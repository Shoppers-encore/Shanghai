<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="text-center">
	<a href="main.jk">
		<img src="/urPresent/images/logo1-1.png" class="w-50" alt="Logo">
	</a>
</div>

<nav class="navbar navbar-expand-sm sticky-top">
	<div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
		<div class="dropdown">
			<a class="navbar-brand" href="#" data-toggle="dropdown">${str_product}</a>
			<div class="dropdown-menu">
				
				<a class="dropdown-item" href="userProductOuterList.jk">${str_cat_OUTER}</a>
				<a class="dropdown-item" href="userProductList.jk?category=DRESS">${str_cat_DRESS}</a>
				<a class="dropdown-item" href="userProductShirtsList.jk">${str_cat_BLnSHIRTS}</a>
				<a class="dropdown-item" href="userProductTopList.jk">${str_cat_TnTOP}</a>
				<a class="dropdown-item" href="userProductList.jk?category=SKIRT">${str_cat_SKIRT}</a>
				<a class="dropdown-item" href="userProductList.jk?category=PANTS">${str_cat_PANTS}</a>
				<a class="dropdown-item" href="userProductList.jk?category=SHOES">${str_cat_SHOES}</a>
				<a class="dropdown-item" href="userProductList.jk?category=BAG">${str_cat_BAG}</a>
				<a class="dropdown-item" href="userProductList.jk?category=ACCESSORY">${str_cat_ACCESSORY}</a>
			</div>
		</div>
		<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" href="userBestProductList.jk">BEST</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="userOrderList.jk">ORDER</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="userMyPage.jk">CUSTOMER</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="reviewList.jk">REVIEW</a>
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
	
	<c:if test="${sessionScope.id ne null}">
        <a href="basketList.jk"><img id="cartImg" src="images/cart.png"></a>
	</c:if>
		&nbsp;&nbsp;
	<a href="userSearchProduct.jk" id="search">
		<img src="images/red_magnifier.png" style="width:25px;">
		<span class="tooltiptext" id="search">${str_searchGood}</span>
	</a>

<!-- ############################## ### 2 To here ################################## -->

</nav>