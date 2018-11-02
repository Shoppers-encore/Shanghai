<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
  * {
   font-family: 'Nanum Gothic';
	}
	ul.nav-pills {
	      top: 20px;
	      position: fixed;
	}
	div.card {
		text-align : center;
	}

	#view {
		margin : 0 auto;
		padding : 10px;
	    top: 20px;
		float : none;
		width : 700px;
	}
	th, td {
		text-align : center;
	}
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
    background: url('images/star.png');
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
  
</head>
<body>
<div class="container-fluid">
	<article class="centered">
	<br><br>
		    <div id="view">
					<table class="table table-striped" >
						<tr>
							<th colspan="4">
								${str_viewRv}	
							</th>	
						</tr>		
						<tr>			
							<th> ${str_num} </th>		
							<td> ${reviewDto.reviewNo} </td>
						</tr>	
						<tr>
							<th> ${str_writer} <input type="hidden" name="ref" value="${reviewDto.ref}">
							</th>
							<td>
								${reviewDto.id}
							</td>
							<th> ${str_reviewDate} </th>
							<td>
								<fmt:formatDate value="${reviewDto.reviewDate}" pattern="yyyy-MM-dd HH:mm"/>			
							</td>
						</tr>	
						<tr>
							<th style="width:20%"> ${str_productName} </th>
							<td style="width:30%">
								<input class="input" type="text" name="productName"
											value=" ${reviewDto.productName}" disabled> 
							</td>		
							<th style="width:20%"> ${str_score} </th>
							<td style="width:30%">
							  <input type="range" min="0" step="0.5" max="5" value="${reviewDto.rating}" class="slider" id="myRange" disabled>
								<span id="demo"> ${reviewDto.rating} </span>
							</td>
						</tr>
						<tr>
							<th> ${str_title} </th>
							<td colspan="3"> ${reviewDto.title} </td>
						</tr>	
						<tr>
							<th> ${str_content} </th>
							<td colspan="3"> <pre>${reviewDto.reviewContent}</pre> </td>	
						</tr>
						</table>
						<img src="/WebProject/save/${reviewDto.photo1}" id="thumb" class="table table-striped">	
						<table class="table table-striped">
						<tr>
							<th colspan="4">
								${reviewDto.reviewScore} ${msg_reviewScore}
							</th>
						</tr>
						<tr>
							<th colspan="4">
								<input class="btn btn-danger" type="button" value="${btn_delete}"
									onclick="ReviewDelcheck()">
								<input class="btn btn-secondary" type="button" value="${btn_back}"
									onclick="location='reviewList.jk?pageNum=${pageNum}'">
							</th>
						</tr>		
					</table>
			 </div>
		</article>
	</div>
</body>

</html>