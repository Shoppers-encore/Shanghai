<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="text-center">
	<a href="main.jk">
		<img src="/urPresent/images/brandLogo.png" class="brandLogo mt-1" alt="UrPresent Brand Logo">
	</a>
</div>

<nav class="navbar navbar-expand-lg navbar-light sticky-top border bg-white">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleMenuNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleSideNavbar">
		<img class="myPageIcon sidebarIcon" src="/urPresent/images/myPage.png">
	</button>

	<div class="navbar-collapse collapse w-100" id="collapsibleMenuNavbar">
		<ul class="navbar-nav" id="topNavbar">
			<li class="nav-item">
				<a class="nav-link" href="userBestProductList.jk">BEST</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductOuterList.jk">${str_cat_OUTER}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductList.jk?category=DRESS">${str_cat_DRESS}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductShirtsList.jk">${str_cat_BLnSHIRTS}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductTopList.jk">${str_cat_TnTOP}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductList.jk?category=SKIRT">${str_cat_SKIRT}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductList.jk?category=PANTS">${str_cat_PANTS}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductList.jk?category=SHOES">${str_cat_SHOES}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductList.jk?category=BAG">${str_cat_BAG}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userProductList.jk?category=ACCESSORY">${str_cat_ACCESSORY}</a>
			</li>
		</ul>
	</div>
	
	<div class="navbar-collapse collapse w-100" id="collapsibleSideNavbar">
		<ul class="navbar-nav" id="topNavbar">
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<a class="nav-link" href="userLoginForm.jk">${btn_login}</a>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<a class="nav-link" href="logout.jk">${btn_logout}</a>
				</c:if>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<a class="nav-link" href="userLoginForm.jk">${btn_myPage}</a>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<a class="nav-link" href="userMyPage.jk">${btn_myPage}</a>
				</c:if>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<a class="nav-link" href="userLoginForm.jk">${btn_inputCart}</a>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<a class="nav-link" href="basketList.jk">${btn_inputCart}</a>
				</c:if>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<a class="nav-link" href="userLoginForm.jk">${str_orderList}</a>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<a class="nav-link" href="userOrderList.jk">${str_orderList}</a>
				</c:if>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="reviewList.jk">${str_reviewIcon}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="userSearchProduct.jk">${str_searchIcon}</a>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<a class="nav-link" href="userLoginForm.jk">${str_chat}</a>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<a class="nav-link" href="chatView.jk">${str_chat}</a>
				</c:if>
			</li>
		</ul>
	</div>
</nav>