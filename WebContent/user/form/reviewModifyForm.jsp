<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<title>${str_modifyReview}</title>
<script type="text/javascript">
	//<!--
	//Delete Photo
	function photoModify(photoNo){
		var photoModify ='';
		photoModify += '<div><input class="btn btn-outline-danger" type="file" name="photo'+photoNo+'"></div>';
		   
		$('.photo'+photoNo).html(photoModify);
	}
	//-->
</script>
</head>
<body>
	<article class="centered">
	<br><br>
	    <div id="writeform">
			<form method="post" encType="multipart/form-data" action="reviewModifyPro.jk" name="writeform" onsubmit="return checkReviewWrite()">
				<table class="table" >
					<tr>
						<th colspan="4">
							${str_modifyReview}
						</th>
					</tr>			
					<tr>
						<th> ${str_writer} </th>
						<td colspan="3">  ${sessionScope.id}</td>
					</tr>			
					<tr>
						<th style="width:20%"> ${str_productName} </th>
						<td style="width:30%">
							<input class="input" type="text" name="productName" value="${productName}" disabled>
							<input type="hidden" name="productCode" value="${reviewDto.productCode}">
							<input type="hidden" name="reviewNo" value="${reviewDto.reviewNo}">
						</td>		
						<th style="width:20%"> ${str_rating} </th>
						<td style="width:30%">
						  <input type="range" name="rating" min="0" step="0.5" max="5" value="${reviewDto.rating}" class="slider" id="myRange" onmouseover="scoring()">
							<span id="demo"> </span>
						</td>
					</tr>
					<tr>
						<th > ${str_title} </th>
						<td colspan="3"> <input class="input" type="text" name="title" value="${reviewDto.title}" maxlength="50" style="width:500px;"></td>
					</tr>			
					<tr>
						<th> ${str_content} </th>
						<td colspan="3">
							<textarea name="reviewContent" rows="10" cols="60">${reviewDto.reviewContent}</textarea>
						</td>
					</tr>	
					<tr>
						<th> ${str_uploading} </th>
						<td colspan="3">
							<c:if test="${reviewDto.photo1 ne null && reviewDto.photo2 ne null}"> 
								<div class="input-group photo1">
									<img src="/Shanghai/save/${reviewDto.photo1}">
									<input type="hidden" name="p1" value="${reviewDto.photo1}">
									<button class="btn btn-outline-primary btn-sm" onclick="photoModify(1)">${btn_delete}</button> 
								</div>
								<div class="input-group photo2">	
									<img src="/Shanghai/save/${reviewDto.photo2}">
									<input type="hidden" name="p2" value="${reviewDto.photo2}">
									<button class="btn btn-outline-primary btn-sm" onclick="photoModify(2)">${btn_delete}</button>
								</div>
							</c:if>
							<c:if test="${reviewDto.photo1 ne null && reviewDto.photo2 eq null}">
								<div class="input-group photo1">
									<img src="/Shanghai/save/${reviewDto.photo1}">
									<input type="hidden" name="p1" value="${reviewDto.photo1}">
									<button class="btn btn-outline-primary btn-sm" onclick="photoModify(1)">${btn_delete}</button> 
								</div>
								<input class="btn btn-outline-danger" type="file" name="photo2">
							</c:if>
							<c:if test="${reviewDto.photo1 eq null && reviewDto.photo2 ne null}">
								<div class="input-group photo2">	
									<img src="/Shanghai/save/${reviewDto.photo2}">
									<input type="hidden" name="p2" value="${reviewDto.photo2}">
									<button class="btn btn-outline-primary btn-sm" onclick="photoModify(2)">${btn_delete}</button>
								</div>
								<input class="btn btn-outline-danger" type="file" name="photo1">
							</c:if>
							<c:if test="${reviewDto.photo1 eq null && reviewDto.photo2 eq null}">
								<input class="btn btn-outline-danger" type="file" name="photo1">
		              			<input class="btn btn-outline-danger" type="file" name="photo2">
							</c:if>
						</td>
					</tr>	
					<tr>
						<th colspan="4">
							<input class="btn btn-primary" type="submit" value="${btn_write}">
							<input class="btn btn-secondary" type="button" value="${btn_list}" onclick="location='reviewList.jk'">
						</th>
					</tr>			
				</table>		
			</form>
		 </div>
	</article>
</body>

</html>