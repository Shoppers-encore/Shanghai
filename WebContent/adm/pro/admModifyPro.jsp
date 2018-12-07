<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<c:if test="${result eq 0}">
	<script type = "text/javascript">
			//<!--
				alert(modifyerror);
			//-->
	</script>
	<meta http-equiv="refresh" content="0; url=admModifyView.jk">
</c:if>
<c:if test="${result eq 1}">
	<script type = "text/javascript">
			//<!--
				alert(modcompleted);
			//-->
	</script>
	<c:redirect url="admModifyPro.jk"/>		<!-- ONGOING BY JH -->
</c:if>