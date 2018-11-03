<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<c:if test="${sessionScope.memid ne null}">
	<c:if test="${sessionScope.memid.length() le 5}">
		<c:if test="${result eq 0}">
			<script type="text/javascript">
				<!--
				erroralert(deleteerror);
				//-->
			</script>
			<meta http-equiv="refresh" content="0; url=reviewList.jk?pageNum=${pageNum}">
		</c:if>
		<c:if test="${result ne 0}">
			<c:redirect url="reviewList.jk?pageNum=${pageNum}"/>		
		</c:if>
	</c:if>
	<c:if test="${sessionScope.memid.length() gt 5}">
		<c:redirect url="reviewList.jk"/>
	</c:if>
</c:if>
<c:redirect url="reviewList.jk"/>