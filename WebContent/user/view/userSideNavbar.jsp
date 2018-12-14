<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar border">
	<ul class="nav flex-column">
		<li class="nav-item">
			<c:if test="${sessionScope.id eq null}">
				<a class="nav-link ml-1 mr-1 border loginIconPanel" href="userLoginForm.jk">
					<img class="loginImg row" src="/urPresent/images/login.png">
					<small class="row">${btn_login}</small>
				</a>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<a class="nav-link ml-1 mr-1 border logoutIconPanel" href="logout.jk">
					<img class="logoutImg row justify-content-center" src="/urPresent/images/logout.png">
					<small class="row">${btn_logout}</small>
				</a>
			</c:if>
		</li>
		<li class="nav-item">
			<c:if test="${sessionScope.id eq null}">
				<a class="nav-link ml-1 mr-1 border sidebarIconPanel" href="userLoginForm.jk">
					<img class="myPageImg sidebarImg row" src="/urPresent/images/myPage.png">
					<small class="row">${btn_myPage}</small>
				</a>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<a class="nav-link ml-1 mr-1 border sidebarIconPanel" href="userMyPage.jk">
					<img class="myPageImg sidebarImg row" src="/urPresent/images/myPage.png">
					<small class="row">${btn_myPage}</small>
				</a>
			</c:if>
		</li>
		<li class="nav-item">
			<c:if test="${sessionScope.id eq null}">
				<a class="nav-link ml-1 mr-1 border sidebarIconPanel" href="userLoginForm.jk">
					<img class="chatImg sidebarImg row" src="/urPresent/images/chat.png">
					<small class="row">${str_chat}</small>
				</a>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
				<a class="nav-link ml-1 mr-1 border sidebarIconPanel" href="chatView.jk">
					<img class="chatImg sidebarImg row" src="/urPresent/images/chat.png">
					<small class="row">${str_chat}</small>
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
			$('.sidebarIconPanel').css({
				'background-color': 'black'		
			});
			$('.sidebarImg').css({
				'filter': 'invert(100%)'		
			});	
		},
		function(event) {
			$('.sidebarIconPanel').css({
				'background-color': 'white'		
			});
			$('.sidebarImg').css({
				'filter': 'invert(0%)'		
			});	
		}
	);
</script>