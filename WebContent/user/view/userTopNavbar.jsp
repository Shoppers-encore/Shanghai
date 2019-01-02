<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="text-center" id="topAnchor">
	<a href="main.jk">
		<img src="/urPresent/images/brandLogo.png" class="brandLogo mt-1" alt="UrPresent Brand Logo">
	</a>
</div>

<nav class="navbar navbar-expand-md navbar-light sticky-top border bg-white topNav">
	<button class="navbar-toggler menuToggler" type="button" data-toggle="collapse" data-target="#collapsibleMenuNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<button class="navbar-toggler sideToggler d-md-none" type="button" data-toggle="collapse" data-target="#collapsibleSideNavbar">
		<img class="topNavIcon" src="/urPresent/images/basket.png">
	</button>

	<div class="navbar-collapse collapse" id="collapsibleMenuNavbar">
		<ul class="navbar-nav mr-auto" id="topNavbar">
			<li class="nav-item">
				<small><a class="nav-link" href="userBestProductList.jk">BEST</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductOuterList.jk">${str_cat_OUTER}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductList.jk?category=DRESS">${str_cat_DRESS}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductShirtsList.jk">${str_cat_BLnSHIRTS}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductTopList.jk">${str_cat_TnTOP}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductList.jk?category=SKIRT">${str_cat_SKIRT}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductList.jk?category=PANTS">${str_cat_PANTS}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductList.jk?category=SHOES">${str_cat_SHOES}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductList.jk?category=BAG">${str_cat_BAG}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userProductList.jk?category=ACCESSORY">${str_cat_ACCESSORY}</a></small>
			</li>
		</ul>
	</div>
	
	<div class="navbar-collapse collapse" id="collapsibleSideNavbar">
		<ul class="navbar-nav ml-auto text-right d-md-none" id="sideNavbarOnTop">
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<small><a class="nav-link" href="userLoginForm.jk">${btn_login}</a></small>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<small><a class="nav-link" href="logout.jk">${btn_logout}</a></small>
				</c:if>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<small><a class="nav-link" href="userLoginForm.jk">${btn_myPage}</a></small>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<small><a class="nav-link" href="userMyPage.jk">${btn_myPage}</a></small>
				</c:if>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<small><a class="nav-link" href="userLoginForm.jk">${btn_inputCart}</a></small>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<small><a class="nav-link" href="basketList.jk">${btn_inputCart}</a></small>
				</c:if>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<small><a class="nav-link" href="userLoginForm.jk">${str_orderList}</a></small>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<small><a class="nav-link" href="userOrderList.jk">${str_orderList}</a></small>
				</c:if>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="reviewList.jk">${str_reviewIcon}</a></small>
			</li>
			<li class="nav-item">
				<small><a class="nav-link" href="userSearchProduct.jk">${str_searchIcon}</a></small>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.id eq null}">
					<small><a class="nav-link" href="userLoginForm.jk">${str_chat}</a></small>
				</c:if>
				<c:if test="${sessionScope.id ne null}">
					<small><a class="nav-link" href="" onclick="chatting()">${str_chat}</a></small>
				</c:if>
			</li>
		</ul>
	</div>
</nav>
<script type="text/javascript">
	$('.menuToggler').on(
		'click',
		function() {
			$('#collapsibleSideNavbar').collapse('hide')
		}
	);
	
	$('.topNavIcon').on(
		'click',
		function() {
			$('#collapsibleMenuNavbar').collapse('hide')
		}
	);
</script>