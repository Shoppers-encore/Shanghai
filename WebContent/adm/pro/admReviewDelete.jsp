<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../setting.jsp" %>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		// <!--
		erroralert( inputerror );
		//-->
	</script>		
</c:if>
<c:if test="${result ne 0}">
	<script type="text/javascript">
			//<!--
				alert('리뷰가 삭제 됐습니다.');
			//-->
		</script>	
	<meta http-equiv="refresh" content="0; url=admReviewList.jk?pageNum=${pageNum}">	
</c:if>
