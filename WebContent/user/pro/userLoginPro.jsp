<%@page import="db.UserDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>


<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert( loginiderror );
		//-->
	</script>
</c:if>
<c:if test="${result eq -1}">
	<script type="text/javascript">
		<!--
		erroralert( loginpasswderror );
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	${sessionScope.id = id}
	<c:if test="${userLevel eq 9}">
		${sessionScope.userLevel = userLevel}
		<c:redirect url="admMain.jk"/>
	</c:if>
	<c:if test="${userLevel eq 0}">
		${sessionScope.userLevel = userLevel}
		<script type="text/javascript">
			<!--
			erroralert( rejoinmsg );
			//-->
		</script>
		<c:redirect url="userInputForm.jk"/>
	</c:if>
	<c:redirect url="main.jk"/>
</c:if>
