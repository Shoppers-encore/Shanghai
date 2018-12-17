<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar border pt-1 pb-1">
	<ul class="nav flex-column sidebarItems">
		<li class="nav-item sidebarItem">
			<c:if test="${sessionScope.id eq null}">
				<a class="nav-link ml-1 mr-1 border loginIconPanel text-secondary text-center" href="userLoginForm.jk">
					<img class="loginIcon sidebarIcon row" src="/urPresent/images/login.png">
					<small class="row loginIconText">${btn_login}</small>
				</a>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<a class="nav-link ml-1 mr-1 border logoutIconPanel text-secondary" href="logout.jk">
					<img class="logoutIcon sidebarIcon row" src="/urPresent/images/logout.png">
					<small class="row logoutIconText">${btn_logout}</small>
				</a>
			</c:if>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<c:if test="${sessionScope.id eq null}">
				<a class="nav-link ml-1 mr-1 border myPageLoginIconPanel text-secondary" href="userLoginForm.jk">
					<img class="myPageLoginIcon sidebarIcon row" src="/urPresent/images/myPage.png">
					<small class="row myPageLoginIconText">${btn_myPage}</small>
				</a>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<a class="nav-link ml-1 mr-1 border myPageIconPanel text-secondary" href="userMyPage.jk">
					<img class="myPageIcon sidebarIcon row" src="/urPresent/images/myPage.png">
					<small class="row myPageIconText">${btn_myPage}</small>
				</a>
			</c:if>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<c:if test="${sessionScope.id eq null}">
				<a class="nav-link ml-1 mr-1 border orderLoginIconPanel text-secondary" href="userLoginForm.jk">
					<img class="orderLoginIcon sidebarIcon row" src="/urPresent/images/order.png">
					<small class="row orderLoginIconText">${str_orderList}</small>
				</a>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<a class="nav-link ml-1 mr-1 border orderIconPanel text-secondary" href="userOrderList.jk">
					<img class="orderIcon sidebarIcon row" src="/urPresent/images/order.png">
					<small class="row orderIconText">${str_orderList}</small>
				</a>
			</c:if>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<a class="nav-link ml-1 mr-1 border reviewIconPanel text-secondary" href="reviewList.jk">
				<img class="reviewIcon sidebarIcon row" src="/urPresent/images/review.png">
				<small class="row reviewIconText">${str_reviewIcon}</small>
			</a>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<a class="nav-link ml-1 mr-1 border searchIconPanel text-secondary" href="userSearchProduct.jk">
				<img class="searchIcon sidebarIcon row" src="/urPresent/images/search.png">
				<small class="row searchIconText">${str_searchIcon}</small>
			</a>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<c:if test="${sessionScope.id eq null}">
				<a class="nav-link ml-1 mr-1 border chatLoginIconPanel text-secondary" href="userLoginForm.jk">
					<img class="chatLoginIcon sidebarIcon row" src="/urPresent/images/chat.png">
					<small class="row chatLoginIconText">${str_chat}</small>
				</a>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<a class="nav-link ml-1 mr-1 border chatIconPanel text-secondary" href="chatView.jk">
					<img class="chatIcon sidebarIcon row" src="/urPresent/images/chat.png">
					<small class="row chatIconText">${str_chat}</small>
				</a>
			</c:if>
		</li>
	</ul>
</div>
<script type="text/javascript">
	var hoverItems=['.loginIcon', '.logoutIcon', '.myPageLoginIcon', '.myPageIcon', 
		'.orderLoginIcon', '.orderIcon', '.reviewIcon', '.searchIcon', '.chatLoginIcon', '.chatIcon']
	
	$(document).ready(
		function(event) {
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