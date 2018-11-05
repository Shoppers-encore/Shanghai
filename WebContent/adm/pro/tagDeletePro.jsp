<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		// <!--
		erroralert( tagdeleteerror );
		//-->
	</script>		
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="tagList.jk"/>
</c:if>











