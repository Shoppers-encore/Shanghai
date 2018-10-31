<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<head>
<style>
<!-- ########################### ### 1 From here ############################ -->
.tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: #ff0000;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: absolute;
    z-index: 1;
    top: 11px;
    right : 5%;
    margin-left: -60px;
    opacity: 0;
    transition: opacity 0.3s;
}
a#search:hover .tooltiptext {
    visibility: visible;
    opacity: 0.7;
}
<!-- ########################### ### 1 To here ############################ -->
</style>
</head>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
		  <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
			  <a class="navbar-brand" href="main.jk">
			    <img src="images/logo.png" alt="Logo">
			  </a>
			  <div class="dropdown">
			  	<a class="navbar-brand" href="#" data-toggle="dropdown">PRODUCT</a>
			  <div class="dropdown-menu">
			    <a class="dropdown-item" href="userGoodList.jk?category=TOP">TOP</a>
			    <a class="dropdown-item" href="userGoodList.jk?category=BOTTOM">BOTTOM</a>
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
		    	<a class="nav-link" href="userReviewList.jk">Review</a>
		    </li>
		    <c:if test="${sessionScope.memid eq null or sessionScope.memid eq 0}">
			    <li class="nav-item">
			      <a class="nav-link" href="userLoginForm.jk">LOGIN</a>
			    </li>
			</c:if>
			<c:if test="${sessionScope.memid ne null}">
				<li class="nav-item">
			      <a class="nav-link" href="logout.jk">LOGOUT</a>
			    </li>
			</c:if>
		  </ul>
		  </div>
		  
		  <!-- ############################## ### 2 From here ################################## -->
		  
	        	<a href="searchGood.jk" id="search">
	        	<img src="images/red_magnifier.png" style="width:25px;">
				<span class="tooltiptext" id="search">${str_searchGood}</span>
	        	</a>
	        	
		  <!-- ############################## ### 2 To here ################################## -->
		
		</nav>