<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<c:forEach var="result" items="${results}">
	<c:if test="${result ne 1}">
		<script type="text/javascript">
			alert('${msg_systemFailure}');
			history.back();
		</script>
	</c:if>
	<c:if test="${result eq 1}">
		<c:set var="checkedItems" value="${checkedItems}" scope="session"/>
		<c:redirect url="orderInputForm.jk?identifier=1"/>
	</c:if>
</c:forEach>