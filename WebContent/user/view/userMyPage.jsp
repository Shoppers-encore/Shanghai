<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp"%>

<html>
	<%@include file="../view/userHead.jsp"%>
	<body>
		<%@ include file="../../user/view/userTopNavbar.jsp" %>
		<%@ include file="../../user/view/userSideNavbar.jsp" %>

		<div class="container">
			<h4 class="text-center pt-3 pb-4"><strong>${str_myPage}</strong></h4>
			<div>		
				<div class="row"><!-- Id -->
					<div class="myPageLabel">${str_id}</div>
					<div class="myPageInfo">${userDto.id}</div>								
				</div>
				<div class="row"><!-- name -->
					<div class="myPageLabel">${str_name}</div>
					<div class="myPageInfo">${userDto.name}</div>	
				</div>
				<div class="row"><!-- birthday -->
					<div class="myPageLabel">${str_bday}</div>
					<div class="myPageInfo">${userDto.birthday}</div>
				</div>
				<div class="row"><!-- tel -->
					<div class="myPageLabel">${str_tel}</div>
					<div class="myPageInfo">${userDto.tel}</div>			
				</div>
				<div class="row"><!-- email -->
					<div class="myPageLabel">${str_email}</div>
					<div class="myPageInfo">${userDto.email}</div>			
				</div>
				<div class="row"><!--zip code -->
					<div class="myPageLabel">${str_zipcode}</div>
					<div class="myPageInfo">${userDto.zipcode}</div>
				</div>
				<div class="row"><!--address -->
					<div class="myPageLabel">${str_address}</div>
					<div class="myPageInfo">${userDto.address}</div>
				</div>
				<div class="row"><!--addressDetail -->
					<div class="myPageLabel"></div>
					<div class="myPageInfo">${userDto.addressDetail}</div>
				</div>
				<div class="row"><!-- gender -->
					<div class="myPageLabel">${str_gender}</div>
					<div class="myPageInfo">
						<c:if test="${userDto.gender eq 0}">
							${str_gender_m}
						</c:if>
						<c:if test="${userDto.gender eq 1}">
							${str_gender_f}
						</c:if>														
					</div>				
				</div>
				<div class="row"><!--height / weight-->
					<div class="myPageLabel">${str_height} / ${str_weight}</div>
					<div class="myPageInfo">
						${userDto.height} cm &ensp;/&ensp; ${userDto.weight} kg
					</div>					
				</div>
				<div class="col-12 text-center mt-3"><!-- button -->
		            <button class="btn" type="button" onclick="location='userModifyForm.jk'">${btn_modify}</button>
		            <button class="btn" type="button" onclick="userDelete()">${btn_userDelete}</button>
		            <button class="btn" type="button" onclick="location='logout.jk'">${btn_logout}</button>
	      	    </div>			
			</div>
		</div> <!-- container -->
		<script type="text/javascript">
		//<!--
			function userDelete(){
				var userDel = confirm('${msg_userDelete}');
				if(userDel){
					location='userDeletePro.jk'
				}
			}
		//-->
		</script> 
		<%@include file="../view/userFooter.jsp"%>
	</body>
</html>