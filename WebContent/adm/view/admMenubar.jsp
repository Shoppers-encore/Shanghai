<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../setting.jsp"%>
    <nav class="col-sm-2 col-4" id="myScrollspy">
      <ul class="nav nav-pills flex-column">
         <li>
         	<a href="main.jk">main</a>
           <div class="card">
             <div class="card-body">
               <h4 class="card-title">${admin.name} ${str_nim}</h4>
               <p class="card-text">
	            ${msg_hello}<br>
	            ${str_id} : ${admin.id} <br>
	            ${str_dept} : ${admin.department_name}<br>
               </p>
               <a href="myPage.jk" class="btn btn-primary">${btn_myPage}</a>
               <input class="btn btn-primary" type="button" value="${btn_logout}"
                 onclick="location='logout.jk'"><br>
             </div>
           </div>        
         </li>
         <li class="nav-item">
          <a class="nav-link" href="userList.jk">${str_userList}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admproductView.jk">${str_productList}</a>
        </li>
		<li class="nav-item">
          <a class="nav-link" href="boardList.jk?type=Rv">${str_boardList}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="orderFind.jk">${str_admOrderList}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admProductList.jk">${str_admProductList}</a>
        </li>
      <li class="nav-item">
          <a class="nav-link" href="admChatting.jk">${str_chat}</a>
        </li>
      </ul>
    </nav>