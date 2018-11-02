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
<body class="container">
	<article class="centered">
	<br><br>
		    <div id="view">
					<table class="table" >
						<tr>
							<th colspan="4">${str_review}</th>	
						</tr>		
						<tr>
							<th>${str_writer}</th>
							<td>${reviewDto.id}</td>
							<th> ${str_writeDate} </th>
							<td><fmt:formatDate value="${reviewDto.reviewDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						</tr>	
						<tr>
							<th style="width:20%">${str_productName}</th>
							<td style="width:30%"><input class="input" type="text" name="productName" value=" ${reviewDto.productName}" disabled></td>		
							<th style="width:20%">${str_score}</th>
							<td style="width:30%"><input type="range" min="0" step="0.5" max="5" value="${reviewDto.score}" class="slider" id="myRange" disabled>
								<span id="demo"> ${reviewDto.score} </span></td>
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
								<c:if test="${sessionScope.memid ne null}">
									<c:if test="${reviewDto.checkedme eq null || reviewDto.checkedme ne sessionScope.memid}">
										<input class="btn btn-outline-danger" type="button" value="${btn_like}" onclick="location='good.jk?reviewNo=${reviewDto.reviewNo}&number=${number}'">
									</c:if>
									<c:if test="${reviewDto.checkedme eq sessionScope.memid}">
										<input class="btn btn-outline-danger" type="button" value="${btn_likecancel}" onclick="location='cancelGood.jk?reviewNo=${reviewDto.reviewNo}&number=${number}'">
									</c:if>
								</c:if>
							</th>
						</tr>
						<tr>
							<th colspan="4">
								<c:if test="${sessionScope.memid.length() le 5 or reviewDto.id eq sessionScope.memid}">
									<input class="btn btn-primary" type="button" value="${btn_modify}" onclick="ReviewModable()">
									<input class="btn btn-danger" type="button" value="${btn_delete}" onclick="ReviewDelcheck()">
								</c:if>
									<input class="btn btn-secondary" type="button" value="${btn_list}" onclick="location='reviewList.jk?pageNum=${pageNum}'">
							</th>
						</tr>		
					</table>
			 </div>
		</article>
</body>
</html>