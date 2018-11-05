
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>

<c:if test="${result eq 0}">
   <script type="text/javascript">
      // <!--
     // erroralert( taginputerror );
      //-->
   </script>      
</c:if>
<c:if test="${result ne 0}">
	<script type="text/javascript">
		opener.location.reload(true);
	</script>
   <c:redirect url="tagInputForm.jk"/>
</c:if>