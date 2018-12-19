<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar flex-column border pt-1 pb-1 pl-1 pr-1">
	<div class="sidebarItem">
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
				<small class="chatLoginIconText iconText">${str_chat}</small>
			</button>
		</c:if>
		<c:if test="${sessionScope.id ne null}">
			<button class="btn btn-outline-dark btn-block border chatIconPanel text-secondary" onclick="location='chatView.jk'">
				<img class="chatIcon sidebarIcon" src="/urPresent/images/chat.png">
				<br>
				<small class="chatIconText iconText">${str_chat}</small>
			</button>
		</c:if>
	</div>
</div>


<%-- <div class="sidebar border pt-1 pb-1">
	<ul class="nav flex-column sidebarItems">
		<li class="nav-item sidebarItem">
			<c:if test="${sessionScope.id eq null}">
				<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border loginIconPanel text-secondary text-center" onclick="location='userLoginForm.jk'">
					<img class="loginIcon sidebarIcon row" src="/urPresent/images/login.png">
					<small class="row loginIconText">${btn_login}</small>
				</button>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border logoutIconPanel text-secondary" onclick="location='logout.jk'">
					<img class="logoutIcon sidebarIcon row" src="/urPresent/images/logout.png">
					<small class="row logoutIconText">${btn_logout}</small>
				</button>
			</c:if>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<c:if test="${sessionScope.id eq null}">
				<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border myPageLoginIconPanel text-secondary" onclick="location='userLoginForm.jk'">
					<img class="myPageLoginIcon sidebarIcon row" src="/urPresent/images/myPage.png">
					<small class="row myPageLoginIconText">${btn_myPage}</small>
				</button>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border myPageIconPanel text-secondary" onclick="location='userMyPage.jk'">
					<img class="myPageIcon sidebarIcon row" src="/urPresent/images/myPage.png">
					<small class="row myPageIconText">${btn_myPage}</small>
				</button>
			</c:if>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<c:if test="${sessionScope.id eq null}">
				<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border orderLoginIconPanel text-secondary" onclick="location='userLoginForm.jk'">
					<img class="orderLoginIcon sidebarIcon row" src="/urPresent/images/order.png">
					<small class="row orderLoginIconText">${str_orderList}</small>
				</button>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border orderIconPanel text-secondary" onclick="location='userOrderList.jk'">
					<img class="orderIcon sidebarIcon row" src="/urPresent/images/order.png">
					<small class="row orderIconText">${str_orderList}</small>
				</button>
			</c:if>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border reviewIconPanel text-secondary" onclick="location='reviewList.jk'">
				<img class="reviewIcon sidebarIcon row" src="/urPresent/images/review.png">
				<small class="row reviewIconText">${str_reviewIcon}</small>
			</button>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border searchIconPanel text-secondary" onclick="location='userSearchProduct.jk'">
				<img class="searchIcon sidebarIcon row" src="/urPresent/images/search.png">
				<small class="row searchIconText">${str_searchIcon}</small>
			</button>
		</li>
		<li class="nav-item sidebarItem pt-1">
			<c:if test="${sessionScope.id eq null}">
				<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border chatLoginIconPanel text-secondary" onclick="location='userLoginForm.jk'">
					<img class="chatLoginIcon sidebarIcon row" src="/urPresent/images/chat.png">
					<small class="row chatLoginIconText">${str_chat}</small>
				</button>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<button class="btn btn-outline-dark btn-block nav-link ml-1 mr-1 border chatIconPanel text-secondary" onclick="location='chatView.jk'">
					<img class="chatIcon sidebarIcon row" src="/urPresent/images/chat.png">
					<small class="row chatIconText">${str_chat}</small>
				</button>
			</c:if>
		</li>
	</ul>
</div> --%>
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