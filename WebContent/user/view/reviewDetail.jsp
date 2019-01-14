<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<style>
	.slidecontainer {
	   width: 100%;
	}
	
	.slider {
	    -webkit-appearance: none;
	    width: 100%;
	    height: 10px;
	    border-radius: 5px;
	    background: #d3d3d3;
	    outline: none;
	    opacity: 0.7;
	    -webkit-transition: .2s;
	    transition: opacity .2s;
	}
	
	.slider:hover {
	    opacity: 1;
	}
	
	.slider::-webkit-slider-thumb {
	    -webkit-appearance: none;
	    appearance: none;
	    width: 30px;
	    height: 30px;
	    border: 0;
	    background: url('../urPresent/images/star.png');
	    cursor: pointer;
	}
	
	.slider::-moz-range-thumb {
	    width: 15px;
	    height: 15px;
	    border: 1;
	    background: url('contrasticon.png');
	    cursor: pointer;
	}
	</style>

<body>
	<%@ include file="../../user/view/userTopNavbar.jsp" %>
	<%@ include file="../../user/view/userSideNavbar.jsp" %>
	
	<div class="container col-10 text-center" onload="commentList(${reviewDto.reviewNo})">

	<br><br>
		    <div id="view">
					<table class="table" >
						<tr>
							<th colspan="4"><h5>${str_review}</h5></th>	
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
							<div style="align:center;">
								<c:if test="${reviewDto.photo1 ne null && reviewDto.photo2 ne null}"> 
									<img src="/urPresent/save/${reviewDto.photo1}" name="photo1">	
									<img src="/urPresent/save/${reviewDto.photo2}" name="photo2">
								</c:if>
								<c:if test="${reviewDto.photo1 ne null && reviewDto.photo2 eq null}">
									<img src="/urPresent/save/${reviewDto.photo1}" name="photo1">	
								</c:if>
								<c:if test="${reviewDto.photo1 eq null && reviewDto.photo2 ne null}">
									<img src="/urPresent/save/${reviewDto.photo2}" name="photo2">
								</c:if>
								<c:if test="${reviewDto.photo1 eq null && reviewDto.photo2 eq null}">
									${msg_noPhoto}
								</c:if>
							</div>
						<table class="table">
						<tr>
							<th colspan="2">
								${reviewDto.reviewScoreSum} ${msg_like}
								<c:if test="${sessionScope.id ne null and sessionScope.id ne reviewDto.id}">
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
							<!-- comment -->
								<th>comment</th>
								<td>
									<form name="commentInsertForm" method="post">
										<div class="input-group">
											<input type="hidden" name="reviewNo" value="${reviewDto.reviewNo}"/>
											<input type="hidden" name="session" value="${sessionScope.id}"/>
											<input type="text" class="input col-10" id="commentContent" name="commentContent" placeholder="${msg_insertComment}">
											&nbsp;<button class="btn btn-default" type="button" onclick="commentInsert()">${btn_writeComment}</button>
										</div>
									</form>
								</td>
							</tr>
							<div class="commentList container"></div>
							<!-- comment -->
						<tr>
							<th colspan="2">
								<c:if test="${reviewDto.id eq sessionScope.id}">
									<input class="btn btn-primary" type="button" value="${btn_modify}" onclick="location='reviewModifyForm.jk?reviewNo=${reviewDto.reviewNo}&pageNum=${pageNum}'">
									<input class="btn btn-danger" type="button" value="${btn_delete}" onclick ="reviewDelete('${reviewDto.reviewNo}', '${pageNum}')">
								</c:if>
									<input class="btn btn-secondary" type="button" value="${btn_list}" onclick="location='reviewList.jk?pageNum=${pageNum}'">
							</th>
						</tr>
					</table>
			 </div>
		</div>
		<%@include file="../view/userCompanyInfo.jsp"%>
		<%@include file="../view/userFooter.jsp"%>
	</body>
</html>