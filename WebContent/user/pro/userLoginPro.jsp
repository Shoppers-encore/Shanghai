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
	<c:if test="${userLevel eq 9}">
		${sessionScope.userLevel = userLevel}
		${sessionScope.id = id}
		<c:redirect url="admMain.jk"/>
	</c:if>
	<c:if test="${userLevel eq 0}">
		<script type="text/javascript">
			<!--
			erroralert( rejoinmsg );
			//-->
		</script>
	</c:if>
	<c:if test="${userLevel eq 1}">
		${sessionScope.id = id}
	<c:redirect url="main.jk"/>
	</c:if>
</c:if>
