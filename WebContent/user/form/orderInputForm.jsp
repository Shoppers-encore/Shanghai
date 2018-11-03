<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPEhtml>
<html>
	<head>
		<style>
		</style>
	</head>
	<body class="container" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
		<%@include file="../form/userHeader.jsp"%>
		<form name="orderinsertform" action="orderInsertPro.jk" method="post" onsubmit="returnpaycheck()">
			<div>
				<hr>
			</div>
			<div class="centeredcol-md-12">
				<!--OrderListViewPage-->
				<article class="col-sm-12col-12"><br><br>
					<h4>${str_orderPay}</h4>
					<hr>
					<div style="text-align:right">${msg_changeProd}</div><br><br>
					<table class="tabletable-hover">
						<thead>
							<tr>
							<th>${str_product_info}</th>
							<th>${str_var}</th>
							<th>${str_price}</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${countne0}">
								<c:forEach var="basket" items="${baskets}"><!--변수명상의-->
									<tr>
										<td>${basket.good_code}<input type="hidden" name="goodcode" value="${basket.good_code}"></td>
										<td>${basket.var}${str_gae}<input type="hidden" name="var"value="${basket.var}"></td>
										<td>${basket.price}${str_won}<input type="hidden" name="price" value="${basket.price}"></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				
				<hr>
				
				<!--<divstyle="font-size:15px">
				${str_insertAddress}
				</div>-->
				
				<table class="tabletable-hover">
					<thead>
						<tr>
							<th style="width:180px">${str_selectAdr}</th>
							<td>
								<input type="radio" value="1" name="selectaddress" onclick="onoff(this.value,'first');" checked>${str_defaultAdr}
								<input type="radio" value="2" name="selectaddress" style="margin:0px0px0px20px" onclick="onoff(this.value,'second');">${str_insertAdr}
							</td>
						</tr>
					</thead>
					
					<tbody id="first">
						<tr>
							<th style="width:180px">${str_receiver}</th>
							<td>
								<input type="text" class="form-control" value="${member.name}" name="name" style="width:100px">
							</td>
							</tr>
							
							<tr>
								<th style="width:180px">${str_adr}</th>
								<td>
									<div class="input-groupcol-md-12">
										<div>
											<input type="text" class="form-control" value="${member.zipcode}" name="zipcode" style="width:100px;">
										</div>
										<div>
											<button type="button" class="btnbtn-default" name="checkadr">${btn_searchZip}</button>
										</div>
									</div>
									<input type="text" class="form-control" value="${member.address}" name="address" style="width:530px">
								</td>
							</tr>
							<tr>
								<th style="width:180px">${str_tel}</th>
								<td>
									<div class="input-groupcol-md-8" style="margin:0px0px-20px-15px">
										<div class="col-md-2">
											<input type="text" class="form-control" value="${member.tel}" name="tel" style="width:90px;text-align:left">
										</div>
									</div>
							</td>
						</tr>
					</tbody>
					
					<tbody id="second"style="display:none">
						<tr>
							<th style="width:180px">${str_receiver}</th>
							<td>
								<input type="text" class="form-control" name="name" style="width:100px">
							</td>
							</tr>
							<tr>
							<th style="width:180px">${str_address}</th>
							<td>
							<div class="input-groupcol-md-12"style="margin:0px0px10px-20px">
							<div>
							<input type="text"class="form-controlcol-md-3" name="zipcode" style="width:100px;margin:0px20px">
							</div>
							<div>
							<button type="button" class="btnbtn-defaultcol-md-1" name="ncheckadr" style="margin:0px0px0px30px">${btn_searchZip}</button>
							</div>
							</div>
							<input type="text" class="form-control" name="address" style="width:530px">
							</td>
							</tr>
							<tr>
							<th style="width:180px">${str_tel}</th>
							<td>
							<div class="input-groupcol-md-8" style="margin:0px0px-20px-15px">
							<div class="col-md-2">
							<input type="text" class="form-control" name="tel" style="width:90px;text-align:left">
							</div>
							</div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<hr>
				
				<table class="tabletable-hover">
				<thead>
				<tr>
				<th style="width:180px">${str_paymentMtd}</th>
				<td>
				<input type="radio" name="payment" checked>${btn_deposit}
				</td>
				</tr>
				</thead>
				<tbody>
				<tr>
				<th>${str_kmbank}</th>
				<td>
				11111-222222
				</td>
				</tr>
				<tr>
				<th>${str_shbank}</th>
				<td>
				222-33-333333
				</td>
				</tr>
				</tbody>
				</table>
				
				<hr>
				
				<div style="text-align:center">
				<input type="submit" class="btnbtn-default" value="${btn_pay}" name="pay">
				</div>
				</article>
			</div>
		</form>
	</body>
</html>