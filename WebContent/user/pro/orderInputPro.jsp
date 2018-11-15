<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<c:if test="${identifier eq 0 && orderListInsertResult eq 1 && productQuantityUpdateResult eq 1}">
	<c:redirect url="userOrderList.jk"/>
</c:if>
<c:if test="${identifier eq 1}">

</c:if>
