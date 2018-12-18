<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>

<html>
<head>
	<title>${productList.get(0).productName} 상세페이지</title>
	
</head>
	<body class="container">
	<!-- User Menu Bar -->
	<%@ include file="../../user/view/userTopNavbar.jsp" %>
	<script type="text/javascript">
		//<!--
		$(document).ready(function(){
			$("select").change(function(){
				$("input[name='productCode']").val($("select[name='cl']").val()+$("input[name='reff']").val()+$("select[name='sz']").val());
				 $.ajax({
						type : 'POST',
						url : 'howManyQuantity.jk',
						data : $("input[name='productCode']").serialize(),
						dataType : "json",
						success: function(data){
							if(data.count>0){
								if(data.quantity == 0){
									alert("재고가 없습니다.");
									$("input[name='quantity']").val(data.quantity);
								}
								$("input[name='remainQuantity']").val(data.quantity);
								$("input[name='quantity']").attr("max",data.quantity);
								
							}
						}
					});
			});
			$("input:button[name='inputCart']").on("click",function(){
				if($("input[name='productCode']").val()==$("input[name='reff']").val()){
					checkSizeColor();
				}else if($("input[name='quantity']").val()==0 || $("input[name='remainQuantity']").val()==0){
					alert('0개를 구매할수 없습니다!');
				}else{
					location.href="basketInput.jk?productCode="+$("input[name='productCode']").val()+"&quantity="+$("input[name='quantity']").val()+"&ref="+$("input[name='reff']").val();
				}
			});
		});
		function checkSizeColor(){
			if($("select[name='cl']").val()==" " || $("select[name='sz']").val()==" "){
				alert('상품 세부사항을 선택해주세요');
				return false;
			}
			if($("input[name='quantity']").val()==0){
				alert('품절상품입니다.');
				return false;
			}
		}
		//-->
	</script>
	<!-- Good Detail View Page -->
	
		<article class="row">
			<!-- Good Picture -->
			<div class="col-sm-6" >
				<img src="/urPresent/save/${productList.get(0).thumbnail}" style="width: 100%; height: 600px; padding: 10%;">
			</div>
			<!-- Good Detail -->
			<div class="col-sm-6" align="center" style="padding:10%;">
				<form method="post" name="productDetailForm" action="orderInputForm.jk" onsubmit="return checkSizeColor()">
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
									<select name="cl">
										<option value=" " selected>${btn_select}</option>
										<c:forEach var="productColor" items="${colors}">
											<option value="${productColor}">${productColor}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>${str_size}</td>
								<td>
									<select name="sz">
										<option value=" " selected>${btn_select}</option>
										<c:forEach var="productSize" items="${sizes}">
											<option value="${productSize}">${productSize}</option>
										</c:forEach>
									</select>
								</td>
								<td><input type="hidden" id="reff" name="reff" value="${productList.get(0).ref}"></td>
								<td><input type="hidden" id="productCode" name="productCode" value="${productList.get(0).ref}"></td>                   
							</tr>
							<tr>
							<td>${str_var}</td>
								<td><input type="number" name="quantity" value="1" style="width:30px;" min="0"><input type="hidden" name="remainQuantity" value="0"></td>
							</tr>
							<tr>
								<th colspan="2"><input type="submit" class="btn-block" value="${btn_buy}"></th>
							</tr>
							<tr>
								<th colspan="2"><input type="button" id="basket" name="inputCart" class="btn-block" value="${btn_inputCart}"></th>
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
				<img src="/urPresent/save/${img.imageAddress}">
			</c:forEach>
		</div>
	<hr><br><br><br>
	<!-- Redirect to Board -->
		<div align="right">
			Leave your Comment! &nbsp;
			<input type="button" value="${str_review}" onclick="location='reviewList.jk?productName='"/><br><br><br><hr>
		</div>
	
	<!-- Banking Account -->
	
		<footer style="color: gray">
			<div class="col-sm-12" style="text-align: center;">
				<p>Copyright &copy; 2018 삼김일정(3Kim1Jeong)</p>
			</div>
		</footer>
	</body>
</html>
