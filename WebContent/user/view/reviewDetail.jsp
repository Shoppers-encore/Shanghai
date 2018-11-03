<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${str_review}</title>
</head>
<c:set var="id" value="aaa" scope="session"/>
<body class="container">
	<article class="centered">
	<br><br>
		    <div id="view">
		    <form name="detailForm">
					<table class="table" >
						<tr>
							<th colspan="4">${str_review}</th>	
						</tr>		
						<tr>
							<th>${str_writer}</th>
							<td>${reviewDto.id}
								<input type="hidden" name="id" value="${reviewDto.id}">
								<input type="hidden" name="sessionId" value="${sessionScope.id}"/>
							</td>
							<th> ${str_writeDate} </th>
							<td><fmt:formatDate value="${reviewDto.reviewDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						</tr>	
						<tr>
							<th style="width:20%">${str_productName}</th>
							<td style="width:30%"><input class="input" type="text" name="productName" value=" ${reviewDto.productName}" disabled></td>		
							<th style="width:20%">${str_rating}</th>
							<td style="width:30%"><input type="range" min="0" step="0.5" max="5" value="${reviewDto.rating}" class="slider" id="myRange" disabled>
								<span id="demo">${reviewDto.rating}</span></td>
						</tr>
						<tr>
							<th>${str_title}</th>
							<td colspan="3">${reviewDto.title}</td>
						</tr>	
						<tr>
							<th>${str_content}</th>
							<td colspan="3"><pre>${reviewDto.reviewContent}</pre></td>	
						</tr>
						</table>
							<img src="/Shanghai/save/${reviewDto.photo1}" name="photo1">	
							<img src="/Shanghai/save/${reviewDto.photo2}" name="photo2">
						<table class="table">
						<tr>
							<th colspan="4">
								${reviewDto.reviewScoreSum} ${msg_like}
								<c:if test="${sessionScope.id ne null}">
									<c:if test="${reviewDto.checkedme eq false}">
										<input class="btn btn-outline-danger" type="button" value="${btn_like}" onclick="location='like.jk?reviewNo=${reviewDto.reviewNo}&pageNum=${pageNum}'">
									</c:if>
									<c:if test="${reviewDto.checkedme eq true}">
										<input class="btn btn-outline-danger" type="button" value="${btn_likecancel}" onclick="location='cancelLike.jk?reviewNo=${reviewDto.reviewNo}&pageNum=${pageNum}'">
									</c:if>
								</c:if>
							</th>
						</tr>
						<tr>
							<th colspan="4">
								<c:if test="${sessionScope.id.length() le 5 or reviewDto.id eq sessionScope.memid}">
									<input class="btn btn-primary" type="button" value="${btn_modify}" onclick="location='reviewModifyForm.jk?reviewNo=${reviewDto.reviewNo}&pageNum=${pageNum}'">
									<input class="btn btn-danger" type="button" value="${btn_delete}" onclick ="location='reviewDeletePro.jk?reviewNo=${reviewDto.reviewNo}&pageNum=${pageNum}'">
								</c:if>
									<input class="btn btn-secondary" type="button" value="${btn_list}" onclick="location='reviewList.jk?pageNum=${pageNum}'">
							</th>
						</tr>		
					</table>
			 </form>
			 </div>
		</article>
</body>
<script type="text/javascript">
 alert(${pageNum});
</script>
</html>