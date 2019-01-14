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
		
	<div class="container col-10 text-center">
	    <div id="writeForm">
			<form method="post" encType="multipart/form-data" action="reviewWritePro.jk" name="writeform" onsubmit="return checkReviewWrite()">
				<table class="table" >
					<tr>
						<th colspan="4"><h5 class="mt-3 mb-3">${str_writeReview}</h5></th>
					</tr>			
					<tr>
						<th> ${str_writer} </th>
						<td colspan="3">  ${sessionScope.id}</td>
					</tr>			
					<tr>
						<th style="width:20%"> ${str_productName} </th>
						<td style="width:30%">
							<input class="input" type="text" name="productName" value="${productName}" disabled>
							<input type="hidden" name="orderCode" value="${orderCode}">
							<input type="text" name="productCode" value="${productCode}" readonly>
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
	</div>
	<%@include file="../view/userCompanyInfo.jsp"%>
	<%@include file="../view/userFooter.jsp"%>
</body>
</html>