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
<c:if test="${result ne 0}">
	<script type = "text/javascript">
			//<!--
				alert(modcompleted);
				// window.location.href="admModifyView.jk";
				// location.replace("admMain.jk");
			//-->
	</script>
	<!-- <c:redirect url="admModifyView.jk"/>		<!-- ONGOING BY JH -->
	<meta http-equiv="refresh" content="0; url=admMain.jk">
</c:if>