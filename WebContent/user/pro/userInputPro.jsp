<%@page import="db.UserDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>


<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert( inputerror );
		//-->
	</script>		
</c:if>
<c:if test="${result eq 1}">
	${sessionScope.id=userDto.id}
	<c:redirect url="main.jk"/>
</c:if>	
