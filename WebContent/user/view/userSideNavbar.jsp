<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar flex-column border bg-white pt-1 pb-1 pl-1 pr-1 d-none d-md-block">
	<div class="sidebarItem">
		<a class="btn btn-outline-dark btn-block btn-sm border topAnchorPanel anchorPanel text-secondary" href="#topAnchor">
			<small class="topAnchorText anchorText align-top">TOP</small>
		</a>
	</div>
	<div class="sidebarItem pt-1">
		<c:if test="${sessionScope.id eq null}">
			<button class="btn btn-outline-dark btn-block border loginIconPanel text-secondary" onclick="location='userLoginForm.jk'">
				<img class="loginIcon sidebarIcon" src="/urPresent/images/login.png">
				<br>
				<small class="loginIconText iconText">${btn_login}</small>
			</button>
		</c:if>
		<c:if test="${sessionScope.id ne null}">
			<button class="btn btn-outline-dark btn-block border logoutIconPanel text-secondary" onclick="location='logout.jk'">
				<img class="logoutIcon sidebarIcon" src="/urPresent/images/logout.png">
				<br>
				<small class="logoutIconText iconText">${btn_logout}</small>
			</button>
		</c:if>
	</div>
	<div class="sidebarItem pt-1">
		<c:if test="${sessionScope.id eq null}">
			<button class="btn btn-outline-dark btn-block border myPageLoginIconPanel text-secondary" onclick="location='userLoginForm.jk'">
				<img class="myPageLoginIcon sidebarIcon" src="/urPresent/images/myPage.png">
				<br>
				<small class="myPageLoginIconText iconText">${btn_myPage}</small>
			</button>
		</c:if>
		<c:if test="${sessionScope.id ne null}">
			<button class="btn btn-outline-dark btn-block border myPageIconPanel text-secondary" onclick="location='userMyPage.jk'">
				<img class="myPageIcon sidebarIcon" src="/urPresent/images/myPage.png">
				<br>
				<small class="myPageIconText iconText">${btn_myPage}</small>
			</button>
		</c:if>
	</div>
	<div class="sidebarItem pt-1">
		<c:if test="${sessionScope.id eq null}">
			<button class="btn btn-outline-dark btn-block border basketLoginIconPanel text-secondary" onclick="location='userLoginForm.jk'">
				<img class="basketLoginIcon sidebarIcon" src="/urPresent/images/basket.png">
				<br>
				<small class="basketLoginIconText iconText">${btn_inputCart}</small>
			</button>
		</c:if>
		<c:if test="${sessionScope.id ne null}">
			<button class="btn btn-outline-dark btn-block border basketIconPanel text-secondary" onclick="location='basketList.jk'">
				<img class="basketIcon sidebarIcon" src="/urPresent/images/basket.png">
				<br>
				<small class="basketIconText iconText">${btn_inputCart}</small>
			</button>
		</c:if>
	</div>
	<div class="sidebarItem pt-1">
		<c:if test="${sessionScope.id eq null}">
			<button class="btn btn-outline-dark btn-block border orderLoginIconPanel text-secondary" onclick="location='userLoginForm.jk'">
				<img class="orderLoginIcon sidebarIcon" src="/urPresent/images/order.png">
				<br>
				<small class="orderLoginIconText iconText">${str_orderList}</small>
			</button>
		</c:if>
		<c:if test="${sessionScope.id ne null}">
			<button class="btn btn-outline-dark btn-block border orderIconPanel text-secondary" onclick="location='userOrderList.jk'">
				<img class="orderIcon sidebarIcon" src="/urPresent/images/order.png">
				<br>
				<small class="orderIconText iconText">${str_orderList}</small>
			</button>
		</c:if>
	</div>
	<div class="sidebarItem pt-1">
		<button class="btn btn-outline-dark btn-block border reviewIconPanel text-secondary" onclick="location='reviewList.jk'">
			<img class="reviewIcon sidebarIcon" src="/urPresent/images/review.png">
			<br>
			<small class="reviewIconText iconText">${str_reviewIcon}</small>
		</button>
	</div>
	<div class="sidebarItem pt-1">
		<button class="btn btn-outline-dark btn-block border searchIconPanel text-secondary" onclick="location='userSearchProduct.jk'">
			<img class="searchIcon sidebarIcon" src="/urPresent/images/search.png">
			<br>
			<small class="searchIconText iconText">${str_searchIcon}</small>
		</button>
	</div>
	<div class="sidebarItem pt-1">
		<c:if test="${sessionScope.id eq null}">
			<button class="btn btn-outline-dark btn-block border chatLoginIconPanel text-secondary" onclick="location='userLoginForm.jk'">
				<img class="chatLoginIcon sidebarIcon" src="/urPresent/images/chat.png">
				<br>
				<small class="chatLoginIconText chatText">${str_chat}</small>
			</button>
		</c:if>
		<c:if test="${sessionScope.id ne null}">
			<button class="btn btn-outline-dark btn-block border chatIconPanel text-secondary" onclick="chatting()">
				<img class="chatIcon sidebarIcon" src="/urPresent/images/chat.png">
				<br>
				<small class="chatIconText chatText">${str_chat}</small>
			</button>
		</c:if>
	</div>
	<div class="sidebarItem pt-1">
		<a class="btn btn-outline-dark btn-block btn-sm border bottomAnchorPanel anchorPanel text-secondary" href="#bottomAnchor">
			<small class="bottomAnchorText anchorText align-top">BOTTOM</small>
		</a>
	</div>
</div>

<script type="text/javascript">
	var hoverItems=['.loginIcon', '.logoutIcon', '.myPageLoginIcon', '.myPageIcon', '.basketLoginIcon', '.basketIcon',
		'.orderLoginIcon', '.orderIcon', '.reviewIcon', '.searchIcon', '.chatLoginIcon', '.chatIcon']
	
	var topBottom=['.topAnchor', '.bottomAnchor'];
	
	$(document).ready(
		function() {
			$.each(topBottom, function(index, item){
				$(item+'Panel').hover(
					function(event) {
						$(item+'Panel').css({
							'background-color': '#c1c1c1'
						});
						$(item+'Text').css({
							'color': 'white'
						});
					}, 
					function(event) {
						$(item+'Panel').css({
							'background-color': 'white'
						});
						$(item+'Text').css({
							'color': '#6c757d'
						});
					}
				);
			});
			
			$.each(hoverItems, function(index, hoverItem){
				$(hoverItem+'Panel').hover(
					function(event) {
						$(hoverItem+'Panel').css({
							'background-color': '#c1c1c1'
						});
						$(hoverItem+'Text').css({
							'color': 'white'
						});
						$(hoverItem).css({
							'filter': 'invert(100%)'		
						});	
					},
					function(event) {
						$(hoverItem+'Panel').css({
							'background-color': 'white'
						});
						$(hoverItem+'Text').css({
							'color': '#6c757d'
						});
						$(hoverItem).css({
							'filter': 'invert(0%)'		
						});	
					}
				);
			});			
		}	
	);
</script>