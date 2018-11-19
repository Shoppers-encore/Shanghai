<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<c:if test="${orderListInsertResult eq 1 && productQuantityUpdateResult eq 1}">
	<c:redirect url="userOrderList.jk"/>
</c:if>
<c:if test="${orderListInsertResult eq 1 && basketDeleteResult eq 1 && productQuantityUpdateResult eq 1}">
	<c:remove var="checkedItems"/>
	<c:redirect url="userOrderList.jk"/>
</c:if>
<c:if test="${orderListInsertResult ne 1 || basketDeleteResult ne 1 || productQuantityUpdateResult ne 1}">
	<script type="text/javascript">
		alert('${msg_systemFailure}');
		history.back();
	</script>
</c:if>
