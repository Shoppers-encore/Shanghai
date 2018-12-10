<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar border">
	<ul class="nav flex-column">
		<li class="nav-item">
			<c:if test="${sessionScope.id eq null}">
			<a class="nav-link ml-1 mr-1 border" href="userLoginForm.jk">
				<img class="loginImg row" src="/urPresent/images/login.png">
				<small class="row">${btn_login}</small>
			</a>
			</c:if>
			<c:if test="${sessionScope.id ne null}">
			<a class="nav-link ml-1 mr-1 border" href="logout.jk">
				<img class="loginImg row justify-content-center" src="/urPresent/images/logout.png">
				<small class="row justify-content-center">${btn_logout}</small>
			</a>
			</c:if>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Link</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Link</a>
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


<%-- 
		<c:if test="${sessionScope.id ne null}">
			<div id="chat">
				<img id="chatImg" src="images/chaticon.jpg" onclick="chatting()">
			</div>
		</c:if> --%>