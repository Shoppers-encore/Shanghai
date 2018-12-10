<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
${result}
<c:if test="${sessionScope.id ne null}">
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			//<!--
				alert('삭제에 실패했습니다. 나중에 다시 시도해 주세요.');
			//-->
		</script>
		<meta http-equiv="refresh" content="0; url=reviewList.jk?pageNum=${pageNum}">
	</c:if>
	<c:if test="${result ne 0}">
		<script type="text/javascript">
			//<!--
				alert('리뷰가 삭제 됐습니다.');
			//-->
		</script>	
		<meta http-equiv="refresh" content="0; url=reviewList.jk?pageNum=${pageNum}">	
	</c:if>
</c:if>