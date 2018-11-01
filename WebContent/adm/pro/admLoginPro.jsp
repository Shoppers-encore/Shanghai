<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../setting.jsp" %>

<h2> ${str_login} </h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		//<!-- ID does not exist
		erroralert( loginiderror );
		//-->
	</script>
</c:if>
<c:if test="${result eq -1}">
	<script type="text/javascript">
		//<!-- password does not match ID
		erroralert( loginpasswderror );
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	${sessionScope.memid = id}
	<c:redirect url="admMain.jk"/>	
</c:if>