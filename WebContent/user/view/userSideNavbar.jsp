<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar border">
	<ul class="nav flex-column">
		<li class="nav-item">
			<c:if test="${sessionScope.id eq null}">
				<a class="nav-link ml-1 mr-1 border loginIconPanel text-secondary" href="userLoginForm.jk">
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
		<li class="nav-item">
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
		<li class="nav-item">
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

		<li class="nav-item">
			<a class="nav-link" href="#">Disabled</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Disabled</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Disabled</a>
		</li>
	</ul>
</div>
<script type="text/javascript">
	$('.loginIconPanel').hover(
		function(event) {
			$('.loginIconPanel').css({
				'background-color': '#c1c1c1'
			});
			$('.loginIconText').css({
				'color': 'white'
			});
			$('.loginIcon').css({
				'filter': 'invert(100%)'		
			});	
		},
		function(event) {
			$('.loginIconPanel').css({
				'background-color': 'white'
			});
			$('.loginIconText').css({
				'color': '#6c757d'
			});
			$('.loginIcon').css({
				'filter': 'invert(0%)'		
			});	
		}
	);
	$('.logoutIconPanel').hover(
		function(event) {
			$('.logoutIconPanel').css({
				'background-color': '#c1c1c1'
			});
			$('.logoutIconText').css({
				'color': 'white'
			});
			$('.logoutIcon').css({
				'filter': 'invert(100%)'		
			});	
		},
		function(event) {
			$('.logoutIconPanel').css({
				'background-color': 'white'
			});
			$('.logoutIconText').css({
				'color': '#6c757d'
			});
			$('.logoutIcon').css({
				'filter': 'invert(0%)'		
			});	
		}
	);
	$('.myPageLoginIconPanel').hover(
		function(event) {
			$('.myPageLoginIconPanel').css({
				'background-color': '#c1c1c1'
			});
			$('.myPageLoginIconText').css({
				'color': 'white'
			});
			$('.myPageLoginIcon').css({
				'filter': 'invert(100%)'		
			});	
		},
		function(event) {
			$('.myPageLoginIconPanel').css({
				'background-color': 'white'
			});
			$('.myPageLoginIconText').css({
				'color': '#6c757d'
			});
			$('.myPageLoginIcon').css({
				'filter': 'invert(0%)'		
			});	
		}
	);
	$('.myPageIconPanel').hover(
		function(event) {
			$('.myPageIconPanel').css({
				'background-color': '#c1c1c1'
			});
			$('.myPageIconText').css({
				'color': 'white'
			});
			$('.myPageIcon').css({
				'filter': 'invert(100%)'		
			});	
		},
		function(event) {
			$('.myPageIconPanel').css({
				'background-color': 'white'
			});
			$('.myPageIconText').css({
				'color': '#6c757d'
			});
			$('.myPageIcon').css({
				'filter': 'invert(0%)'		
			});	
		}
	);
	$('.chatLoginIconPanel').hover(
		function(event) {
			$('.chatLoginIconPanel').css({
				'background-color': '#c1c1c1'
			});
			$('.chatLoginIconText').css({
				'color': 'white'
			});
			$('.chatLoginIcon').css({
				'filter': 'invert(100%)'		
			});	
		},
		function(event) {
			$('.chatLoginIconPanel').css({
				'background-color': 'white'
			});
			$('.chatLoginIconText').css({
				'color': '#6c757d'
			});
			$('.chatLoginIcon').css({
				'filter': 'invert(0%)'		
			});	
		}
	);
	$('.chatIconPanel').hover(
		function(event) {
			$('.chatIconPanel').css({
				'background-color': '#c1c1c1'
			});
			$('.chatIconText').css({
				'color': 'white'
			});
			$('.chatIcon').css({
				'filter': 'invert(100%)'		
			});	
		},
		function(event) {
			$('.chatIconPanel').css({
				'background-color': 'white'
			});
			$('.chatIconText').css({
				'color': '#6c757d'
			});
			$('.chatIcon').css({
				'filter': 'invert(0%)'		
			});	
		}
	);
</script>