<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../setting.jsp"%>
    <nav class="col-sm-2 col-4" id="myScrollspy">
      <ul class="nav nav-pills flex-column">
         <li>
            <a href="admMain.jk">main</a>
           <div class="card">
             <div class="card-body">
               <h4 class="card-title">${userDto.name} ${str_nim}</h4>
               <p class="card-text">
               ${msg_hello}<br>
               ${str_id} : ${userDto.id} <br>
               </p>
               <a href="admModifyView.jk" class="btn btn-primary">${btn_myPage}</a>
               <input class="btn btn-primary" type="button" value="${btn_logout}"
                 onclick="location='admLogoutPro.jk'"><br>
             </div>
           </div>        
         </li>
         <li class="nav-item">
          <a class="nav-link" href="userList.jk">${str_userList}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admProductView.jk">${str_productList}</a>
        </li>
      <li class="nav-item">
          <a class="nav-link" href="admReviewList.jk">${str_reviewList}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admOrderList.jk">${str_admOrderList}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admProductList.jk">${str_admProductList}</a>
        </li>
      <li class="nav-item">
          <a class="nav-link" href="admChatView.jk">${str_chat}</a>
        </li>
      </ul>
    </nav>