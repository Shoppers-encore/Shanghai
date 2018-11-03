 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <style>
   @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
 * {
   font-family: 'Nanum Gothic';
 }
   body {
      position: relative;
  }
  ul.nav-pills {
      top: 20px;
      position: fixed;
  }
  div.card {
    text-align: center;
  }
  .buttons {
     float: right;
  }
  </style>
</head>
<body class="container-fluid row" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<!-- Admin Menu Bar -->
<%@ include file="../view/admMenubar.jsp"%> 
       <!-- Admin Good List View Page -->
	<article class="col-sm-10 col-8" ><br><br>
		<h4>${str_admProductList}</h4>
		<div class="buttons">
			<a href="productInputForm.jk" class="btn btn-primary">${btn_goodInput}</a><br><br>
		</div>
	<form method="post" action="changeVar.jk">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th><input type="checkbox" name="all" id="all" onclick="checkAll();"></th>
					<th>${str_productCode}</th>
					<th>${str_productName}</th>
					<th>${str_salePercent}</th>
					<th>${str_price}</th>
					<th>${str_var}</th>
					<!-- <th>${str_varPlus}</th> -->
   				</tr>
			</thead>
			<tbody>
   				<c:if test="${count eq null or count eq 0}">  
				<tr>
					<td colspan="7" align="center">
					${msg_list_x}
					</td>
				</tr>
				</c:if>
				<c:if test="${count ne 0}">
					<c:forEach var="product" items="${products}">   
						<tr>
							<td><input type="checkbox" class="form-check-input" id="check" name="check"></td>
							<td>${product.productCode}</td>
							<td>${product.productName}</td>
							<td>${product.discount}</td>
							<td>${product.productPrice}</td>
							<td>${product.productQuantity}</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="6" align="right">
							<input type="submit" class="btn btn-danger" value="${btn_save}">
							<input type="reset" class="btn btn-secondary" value="${btn_cancel}">
							</td>
						</tr>
				</c:if>
			</tbody>
		</table>
	</form>
         <div align="center">
               <c:if test="${count gt 0}">
               <c:if test="${currentPage ne 1}">
                  <a href="admProductList.jk">[◀◀]</a>
               <c:if test="${startPage gt pageBlock}">
                  <a href="admProductList.jk?pageNum=${startPage-pageBlock}">[◀]</a>
                  </c:if>
               </c:if>
               <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <c:if test="${i eq currentPage}">
                  <span>[${i}]</span>
                  </c:if>
                  <c:if test="${i ne currentPage}">
                  <a href="admProductList.jk?pageNum=${i}">[${i}]</a>
                  </c:if>
               </c:forEach>
               <c:if test="${currentPage ne pageCount}">
                  <c:if test="${pageCount>endPage}">
                  <a href="admProductList.jk?pageNum=${startPage+pageBlock}">[▶]</a>
                  </c:if>
                  <a href="admProductList.jk?pageNum=${pageCount}">[▶▶]</a>
               </c:if>
            </c:if>
		</div>
	</article>
</body>
</html>