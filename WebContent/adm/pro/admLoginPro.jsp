<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../setting.jsp" %>

<h2> ${str_login} </h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		//<!-- ID does not exist
		alert( loginiderror );
		window.location="admMain.jk";
		//-->
	</script>
</c:if>
<c:if test="${result eq -9}">
	<script type="text/javascript">
		//<!-- user is not admin
		alert( adminonly );
		window.location.href="userLoginForm.jk";
		//-->
	</script>
</c:if>
<c:if test="${result eq -1}">
	<script type="text/javascript">
		//<!-- password does not match ID
		alert( loginpasswderror );
		window.location="admMain.jk";
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="admMain.jk"/>
</c:if>	