<%@page import="db.UserDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>

<h2>${page_login}</h2>

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
	<c:redirect url="main.jk"/>
</c:if>
