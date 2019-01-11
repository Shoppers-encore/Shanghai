<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ include file="../../setting.jsp"%>

<c:if test="${result eq 0}">
	<script>
		//<!--
			alert('탈퇴가 진행되지 않았습니다. 나중에 다시 시도해 주세요.');
			location.href="main.jk";
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<script>
		//<!--
			alert('그동안 이용해주셔서 감사합니다.');
			location.href="main.jk";
		//-->
	</script>
</c:if>