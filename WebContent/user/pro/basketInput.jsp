<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ include file="../../setting.jsp"%>

<c:if test="${result eq 0}">
	<script>
		//<!--
			alert('장바구니에 담기지 않았습니다. 잠시후 시도 부탁드립니다.');
			location.replace("main.jk");
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<input type="hidden" name="ref" value="${ref}">
	<script>
		//<!--
			var i = confirm('장바구니에 상품이 들어갔습니다. 장바구니로 이동하시겠습니까?');
			if(i){
				location.replace("basketList.jk");
			}else{
				location.replace("userProductDetail.jk?ref="+$("input[name='ref']").val());
			}
		//-->
	</script>
</c:if>