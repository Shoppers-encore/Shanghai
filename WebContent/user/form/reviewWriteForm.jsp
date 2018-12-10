<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${str_writeReview}</title>
</head>
<body class="container">
	<!-- User Header -->
	<%@ include file="../../user/view/userTopNavbar.jsp" %>
	<!-- Review Write Form -->
	<article><br><br>
	    <div id="writeForm">
			<form method="post" encType="multipart/form-data" action="reviewWritePro.jk" name="writeform">
				<table class="table" >
					<tr>
						<th colspan="4">${str_writeReview}</th>
					</tr>			
					<tr>
						<th> ${str_writer} </th>
						<td colspan="3">  ${sessionScope.id}</td>
					</tr>			
					<tr>
						<th style="width:20%"> ${str_productName} </th>
						<td style="width:30%">
							<input class="input" type="text" name="productName" value="${productName}" disabled>
							<input type="text" name="productCode" value="${productCode}">
						</td>		
						<th style="width:20%">${str_rating}</th>
						<td style="width:30%">
							<input type="range" name="rating" min="0" step="0.5" max="5" value="2.5" class="slider" id="myRange" onclick="scoring()">
							<span id="demo"> </span>
						</td>
					</tr>
					<tr>
						<th>${str_title}</th>
						<td colspan="3"><input class="input" type="text" name="title" maxlength="50" style="width:500px;"></td>
					</tr>			
					<tr>
						<th> ${str_content} </th>
						<td colspan="3">
							<textarea name="reviewContent" rows="10" cols="60"></textarea>
						</td>
					</tr>	
					<tr>
						<th>${str_uploading}</th>
					<td colspan="3">
		               <input class="btn btn-outline-danger" type="file" name="photo1">
		               <input class="btn btn-outline-danger" type="file" name="photo2">
             	 	</td>
					</tr>	
					<tr>
						<th colspan="4">
							<input class="btn btn-primary" type="submit" value="${btn_write}">
							<input class="btn btn-secondary" type="reset" value="${btn_cancel}">
							<input class="btn btn-secondary" type="button" value="${btn_list}" onclick="location='reviewList.jk'">
						</th>
					</tr>			
				</table>		
			</form>
		 </div>
	</article>
</body>

</html>