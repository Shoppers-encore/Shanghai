<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>

<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<title>${str_modifyReview}</title>
  
</head>
<body>
	<article class="centered">
	<br><br>
	    <div id="writeform">
			<form method="get" encType="multipart/form-data" action="reviewModidfyPro.jk" name="writeform" onsubmit="return Rvwritecheck()" >
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
							<input class="input" type="text" name="productName"
										value="${productName}" disabled>
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
						<td colspan="3"> <input class="input" type="text" name="subject" value="${reviewDto.title}" maxlength="50" style="width:500px;"></td>
					</tr>			
					<tr>
						<th> ${str_content} </th>
						<td colspan="3">
							<textarea name="reviewContent" rows="10" cols="60">${reviewDto.reviewContent}</textarea>
						</td>
					</tr>	
					<tr>
					<th> ${str_uploading} </th>
					</tr>	
					<tr>
						<th colspan="4">
							<input class="btn btn-primary" type="submit" value="${btn_write}">
							<input class="btn btn-secondary" type="button" value="${btn_list}"
								onclick="location='reviewList.jk'">
						</th>
					</tr>			
				</table>		
			</form>
		 </div>
	</article>
</body>

</html>