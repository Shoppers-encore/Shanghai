<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
	<title>${productList.get(0).productName} 상세페이지</title>
	<script type="text/javascript">
		$("#sz, #cl").change(function(){
			var productCode = $("cl").val()+$("#reff").val()+$("#sz").val();
			$("#productCode").val() = productCode;
		})
		$("basket").click(function(){
			$("#goodcode").val()
		})
	</script>
</head>
	<body class="container">
	<!-- User Menu Bar -->
	<%@ include file="../form/userHeader.jsp" %>
	
	<!-- Good Detail View Page -->
		<article class="row">
			<!-- Good Picture -->
			<div class="col-sm-6" >
				<img src="/WebProject/save/${productList.get(0).thumbnail}" style="width: 100%; height: 600px; padding: 10%;">
			</div>
			<!-- Good Detail -->
			<div class="col-sm-6" align="center" style="padding:10%;">
				<form method="post" name="productDetailForm" action="orderInputForm.jk">
					<table style="height:50%;">
						<thead>
							<tr>
								<th colspan="2" style="width:400px;"><h4>${productList.get(0).productName}</h4><br><br></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${str_price}</td>
								<td>
									<c:if test="${productList.get(0).discount eq null or productList.get(0).discount eq 0}">
										<fmt:formatNumber value="${productList.get(0).productPrice}"/>
										<input type="hidden" name="price" value="${productList.get(0).productPrice}">
									</c:if>
									<c:if test="${productList.get(0).discount ne 0}">
										<fmt:formatNumber value="${productList.get(0).productPrice-(productList.get(0).productPrice*productList.get(0).discount/100)}"/>
										<input type="hidden" name="price" value="${productList.get(0).productPrice-(productList.get(0).productPrice*productList.get(0).discount/100)}">
									</c:if>
								</td>
							</tr>
							<tr>
								<td>${str_color}</td>
								<td>
									<select id="cl">
										<option value="-1">${btn_select}</option>
										<c:forEach var="productColor" items="${colors}">
											<option value="${productColor}">${productColor}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>${str_size}</td>
								<td>
									<select id="sz">
										<option value="-1">${btn_select}</option>
										<c:forEach var="productSize" items="${sizes}">
											<option value="${productSize}">${productSize}</option>
										</c:forEach>
									</select>
								</td>
								<td><input type="hidden" id="reff" name="reff" value="${productList.get(0).ref}"></td>
								<td><input type="hidden" id="productCode" name="productCode" value="0"></td>                   
							</tr>
							<tr>
							<td>${str_var}</td>
								<td><input type="number" name="var" value="1" style="width:60px;"></td>
							</tr>
							<tr>
								<th colspan="2"><input type="submit" class="btn-block" value="${btn_buy}"></th>
							</tr>
							<tr>
								<th colspan="2"><input type="button" id="basket" class="btn-block" onclick="location:'basketInput.jk?" value="${btn_inputCart}"></th>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</article>
	<br><br><br><br><hr><br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- Good Contents -->
		<div align="center" style="width:100%;">
			${productList.get(0).productContent}
			<c:forEach var="img" items="${imageList}">
			<img src="/WebProject/save/${img.image_address}">
			</c:forEach>
		</div>
	<hr><br><br><br>
	<!-- Redirect to Board -->
		<div align="right">
			Remain your Comment! &nbsp;
			<input type="button" value="${str_review}" onclick="location='userReviewList.jk'"/><br><br><br><hr>
		</div>
	
	<!-- Banking Account -->
	
		<footer style="color: gray">
			<div class="col-sm-12" style="text-align: center;">
				<p>Copyright &copy; 2018 삼김일정(3Kim1Jeong)</p>
			</div>
		</footer>
	</body>
</html>
