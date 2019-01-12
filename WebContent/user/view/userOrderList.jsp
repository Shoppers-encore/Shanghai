<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>
		
		<!-- When logged in -->
		<c:if test="${id ne null}">
			<div class="container-fluid col-lg-10">
				<div class="mt-3"><h5>${str_myOrderList}${count}${str_orderUnit}</h5></div>

				<c:if test="${count eq 0}">
					<div class="row font-weight-bold text-center mt-5 mb-5 pt-5 pb-5">
						${msg_emptyOrderList}
					</div>
				</c:if>
				
				<c:if test="${count ne 0}">
					<div class="row font-weight-bold text-center pt-5">
						<div class="col-lg-2">
							${str_orderCode}
						</div>
						<div class="col-lg-3">
							${str_orderDate}
						</div>
						<div class="col-lg-2">
							${str_orderCount}
						</div>
						<div class="col-lg-3">
							${str_orderStatus}
						</div>
						<div class="col-lg-2">
							${str_orderDetail}
						</div>
					</div>
					<c:forEach var="distinctOrderList" items="${distinctOrderList}">
						<div class="row border text-center mt-1 pt-2 pb-2"> 					
							<div class="col-lg-2">
								${distinctOrderList.orderCode}
							</div>
							<div class="col-lg-3" id="date_${distinctOrderList.orderCode}">
								<script type="text/javascript">
									var key='${distinctOrderList.orderCode}';
									var orderDate=JSON.parse('${orderDate}')[key];
									$('#date_${distinctOrderList.orderCode}').text(orderDate);
								</script>
							</div>
							<div class="col-lg-2" id="count_${distinctOrderList.orderCode}">
								<script type="text/javascript">
									var orderCount=JSON.parse('${orderCount}')[key];
									$('#count_${distinctOrderList.orderCode}').text(orderCount+'${str_orderUnit}');
								</script>
							</div>
							<div class="col-lg-3">
								<c:if test="${distinctOrderList.orderStatus eq 0}">
									${str_orderStatus0}
								</c:if>								
								<c:if test="${distinctOrderList.orderStatus eq 1}">
									${str_orderStatus1}
								</c:if>								
								<c:if test="${distinctOrderList.orderStatus eq 2}">
									${str_orderStatus2}
								</c:if>								
								<c:if test="${distinctOrderList.orderStatus eq 3}">
									${str_orderStatus3}
								</c:if>								
							</div>
							<div class="col-lg-2">
								<button class="btn btn-sm orderListDetails_${distinctOrderList.orderCode}">${btn_orderDetails}</button>
								<script type="text/javascript">
									$('.orderListDetails_${distinctOrderList.orderCode}').on(
										'click',
										function(event) {
											window.location.href='userOrderDetail.jk?orderCode=${distinctOrderList.orderCode}&orderDate='+orderDate;
										}
									);
								</script>
							</div>
						</div>
					</c:forEach>
				</c:if>
				
				<div class="col-lg-12 text-center mt-3">
					<c:if test="${count ne 0}">
						<c:if test="${startPage gt pageBlock}">
							<a href="userOrderList.jk">
								<img src="/urPresent/images/rewind.png" class="rewindAndFastForward">
							</a>
							&ensp;
							<a href="userOrderList.jk?pageNum=${startPage-pageBlock}">
								<img src="/urPresent/images/return.png" class="returnAndForward">
							</a>
						</c:if>
						&ensp;
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i eq currentPage}">
								<a class="font-weight-bold" href="">${i}</a>
							</c:if>
							<c:if test="${i ne currentPage}">
								<a class="text-dark mt-1" href="userOrderList.jk?pageNum=${i}">${i}</a>
							</c:if>
						</c:forEach>
						&ensp;
						<c:if test="${pageCount gt endPage}">
							<a href="userOrderList.jk?pageNum=${startPage+pageBlock}">
								<img src="/urPresent/images/forward.png" class="returnAndForward">
							</a>
							&ensp;
							<a href="userOrderList.jk?pageNum=${pageCount}">
								<img src="/urPresent/images/fastForward.png" class="rewindAndFastForward">
							</a>
						</c:if>
					</c:if>
				</div>
			</div>
		</c:if>
		<%@include file="../view/userCompanyInfo.jsp"%>
		<%@include file="../view/userFooter.jsp"%>
	</body>

</html>