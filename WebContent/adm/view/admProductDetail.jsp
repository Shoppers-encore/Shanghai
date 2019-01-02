<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${productList.get(0).productName}</title>
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
<body class="container-fluid row">
   <!-- User Menu Bar -->
   <%@ include file="../view/admMenubar.jsp" %>
   <!-- Good Detail View Page -->
   <article class="col-sm-10 col-8 row">
   <!-- Good Picture -->
      <div class="col-sm-6" >
         <img src="/urPresent/save/${productList.get(0).thumbnail}" style="width: 595px; height: 836px; padding: 10%;">
      </div>
      <!-- Good Detail -->
      <div class="col-sm-6" align="left" style="padding:10%;">
         <table style="height:50%;">
            <thead>
               <tr>
                  <th colspan="2" style="width:400px;"><h4>${productList.get(0).productName}</h4><br><br></th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>${str_price}</td>
                  <td><fmt:formatNumber value="${productList.get(0).productPrice}"/></td>
               </tr>
               
               <tr>
                  <th colspan="2" style="width:400px;"><h4>${productList.get(0).productContent}</h4><br><br></th>
               </tr>
               <tr>
                  <td>${str_color}</td>
                  <td>
                     <select name="cl">
                        <option value=" ">${btn_select}</option>
                        <c:forEach var="productColor" items="${colors}" varStatus="code">
                            <option value="${productColor}">${productColor}</option>
                        </c:forEach>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>${str_size}</td>
                  <td>
                     <select name="sz">
                        <option value=" ">${btn_select}</option>
                        <c:forEach var="productSize" items="${sizes}">
                            <option value="${productSize}">${productSize}</option>
                        </c:forEach>
                     </select>
                  </td>
               </tr>
               <tr>
                  <th colspan="2"><input type="button" class="btn-block" value="${btn_modify}" onclick="location='productModifyForm.jk?ref=${productList.get(0).ref}'"></th>
               </tr>
               <tr>
                  <th colspan="2"><input type="button" class="btn-block" value="${btn_productDel}" onclick ="productDelete('${productList.get(0).ref}')"></th>
               </tr>
            </tbody>
         </table>
      </div>
  
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   
   <!-- Good Contents -->
   <div align="center" style="width:100%;">

      <c:forEach var="img" items="${imageList}">
      		<img src="/urPresent/save/${img.imageAddress}"><br>
      </c:forEach>
   </div>
   <hr><br><br><br>
   <!-- Banking Account -->
   <footer style="color: gray">
       <div class="col-sm-12" style="text-align: center;">
       <p>${msg_copyright}</p></div>
   </footer>
</article>
</body>
</html>