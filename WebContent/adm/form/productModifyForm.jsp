<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
	<title>상품수정</title>
  <style>
   @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
  * {
      font-family: 'Nanum Gothic';
   }

   #productInput {
      text-align : center;
      width : 100%;
      padding : 10px;
      margin: 10px;
   }
   th {
      text-align: -webkit-center;
   }
 
 .container#colorcontainer {
    position: relative;
    padding-left: 20px;
    cursor: pointer;
    font-size: 11px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    width : 20px;
}

/* Hiding default (ugly) checkbox */
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Customizing each color checkbox */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 20px;
    width: 20px;
    background-color: #eee;
}
.checkmark#white {
    height: 19px;
    width: 19px;
   background-color : #FFFFFF;
   border : 1px solid;
}
.checkmark#black {
   background-color : #000000;
}
.checkmark#red {
   background-color : #FF0000;
}
.checkmark#blue {
   background-color : #0000DC;
}
.checkmark#green {
   background-color : #008000;
}
.checkmark#yellow {
   background-color : #FFE400;
}
.checkmark#brown {
   background-color : #5D4200;
}
.checkmark#navy {
   background-color : #030066;
}
.checkmark#gray {
   background-color : #BDBDBD;
}
.checkmark#beige {
   background-color : #F2CB61;
}
.checkmark#skyblue {
   background-color : #6EE3F7;
}
.checkmark#etc {
   background: url('../../images/rainbow.jpg') center/32px no-repeat; 
}
.checkmark#orange {
   background-color : #FF7012;
}
.checkmark#purple {
   background-color : #BD32A9;
}
.checkmark#pink {
   background-color : #FF96AA;
}

/* marking image pops up when checked */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

.container input:checked ~ .checkmark:after {
    display: block;
}

/* adjusting checkmarks */
.container .checkmark:after {
    left: 8px;
    top: 3px;
    width: 6px;
    height: 10px;
    border: solid white;
    border-width: 0 2px 2px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
/* Customizing WHITE checkbox bc it has different options */
.container .checkmark#white:after {
    left: 6px;
    top: 2px;
    width: 6px;
    height: 10px;
    border: solid black;
    border-width: 0 2px 2px 0;
}
/* adjusting tooltiptext area */
.container .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: #ff0000;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: absolute;
    z-index: 1;
    top: 23px;
    left: 50%;
    margin-left: -60px;
    opacity: 0;
    transition: opacity 0.3s;
}
.container .tooltiptext#white {
    background-color: #E1E1E1;
    color: #000;
}
.container .tooltiptext#black {
    background-color: #000000;
}
.container .tooltiptext#blue {
    background-color: #0000DC;
}
.container .tooltiptext#green {
    background-color: #008000;
}
.container .tooltiptext#yellow {
    background-color: #FFE400;
}
.container .tooltiptext#brown {
    background-color: #5D4200;
}
.container .tooltiptext#navy {
    background-color: #030066;
}
.container .tooltiptext#gray {
    background-color: #BDBDBD;
}
.container .tooltiptext#beige {
    background-color: #F2CB61;
}
.container .tooltiptext#skyblue {
    background-color: #6EE3F7;
}
.container .tooltiptext#etc {
   background: url('../images/rainbow.jpg') left/120px no-repeat; 
}
.container .tooltiptext#orange {
   background: #FF7012; 
}
.container .tooltiptext#purple {
   background: #BD32A9; 
}
.container .tooltiptext#pink {
   background: #FF96AA; 
}

.container#colorcontainer:hover .tooltiptext {
    visibility: visible;
    opacity: 0.7;
}
  </style>

</head>
<body>
   <div class="aa">
       <div class="border" id="productInput">
               <h3>${head_productModify}</h3>
               <form name="goodModifyform" encType="multipart/form-data" action="productModifyPro.jk" method="post" accept-charset="UTF-8">
               <table class="table">
                  <tr>
                     <th style="width :10%"> ${str_productCode} </th>
                     <td style="width :20%">
                        <input type="text" name="product_code" class="form-control" readonly value="${products.get(0).ref}">
                     </td>
                     <th style="width :10%"> ${str_size} </th>
                     <td style="width :30%">
                        <input type="checkbox" name="size" value="0" ${sizeMap.siz0==0?'checked':''}>${str_sizeS}
                        <input type="checkbox" name="size" value="1" ${sizeMap.siz1==1?'checked':''}>${str_sizeM}
                        <input type="checkbox" name="size" value="2" ${sizeMap.siz2==2?'checked':''}>${str_sizeL}
                        <input type="checkbox" name="size" value="3" ${sizeMap.siz3==3?'checked':''}>${str_sizeXL}
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="size" value="4" ${sizeMap.siz4==4?'checked':''}>${str_sizeF}
                     </td>
                      <th style="width :10%"> ${str_category} </th>
                      <td style="width :20%">
                      <select name="category">
                                 <option value="1" ${products.get(0).productCategory==1?'selected':''}>${str_cat_JKnJP_kor}</option>
                                 <option value="2" ${products.get(0).productCategory==2?'selected':''}>${str_cat_COAT_kor}</option>
                                 <option value="3" ${products.get(0).productCategory==3?'selected':''}>${str_cat_CARDIGAN_kor}</option>
                                 <option value="4" ${products.get(0).productCategory==4?'selected':''}>${str_cat_DRESS_kor}</option>
                                 <option value="5" ${products.get(0).productCategory==5?'selected':''}>${str_cat_BLOUSE_kor}</option>
                                 <option value="6" ${products.get(0).productCategory==6?'selected':''}>${str_cat_SHIRTS_kor}</option>
                                 <option value="7" ${products.get(0).productCategory==7?'selected':''}>${str_cat_TSHIRTS_kor}</option>
                                 <option value="8" ${products.get(0).productCategory==8?'selected':''}>${str_cat_KNIT_kor}</option>
                                 <option value="9" ${products.get(0).productCategory==9?'selected':''}>${str_cat_SKIRT_kor}</option>
                                 <option value="10" ${products.get(0).productCategory==10?'selected':''}>${str_cat_PANTS_kor}</option>
                                 <option value="11" ${products.get(0).productCategory==11?'selected':''}>${str_cat_SHOES_kor}</option>
                                 <option value="12" ${products.get(0).productCategory==12?'selected':''}>${str_cat_BAG_kor}</option>
                                 <option value="13" ${products.get(0).productCategory==13?'selected':''}>${str_cat_ACCESSORY_kor}</option>
                           </select>
                        </td>
                     
                  </tr>
                  <tr>
                  	<th> ${str_style} </th>
                  <td colspan="5">
                  		<c:forEach var="tag" items="${allTags}">   
							<label class="btn btn-info">
                  	 		 	<input type="checkbox" name="tag" value="${tag.tagId}" ${checkedTags.contains(tag.tagId)?'checked':''}>${tag.tagName}
                 		    </label>
                 		</c:forEach>
                  	</td>
                  </tr>
                  <tr>
                     <th> ${str_productName} </th>
                     <td colspan="5"> 
                        <input type="text" name="product_name" class="form-control" value="${products.get(0).productName}">
                     </td>
                               
                  </tr>
                  <tr>
                     <th> ${str_color} </th>
                     <td colspan="5">
                         <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="0" ${colorMap.col0==0?'checked':''}>
						     <span class="checkmark" id="white"></span>
						     <span class="tooltiptext" id="white">${msg_color_wht}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="1" ${colorMap.col1==1?'checked':''}>
						     <span class="checkmark" id="black"></span>
						     <span class="tooltiptext" id="black">${msg_color_blk}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="2" ${colorMap.col2==2?'checked':''}>
						     <span class="checkmark" id="red"></span>
						     <span class="tooltiptext" id="red">${msg_color_red}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="3" ${colorMap.col3==3?'checked':''}>
						     <span class="checkmark" id="orange"></span>
						     <span class="tooltiptext" id="orange">${msg_color_org}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="4" ${colorMap.col4==4?'checked':''}>
						     <span class="checkmark" id="yellow"></span>
						     <span class="tooltiptext" id="yellow">${msg_color_ylw}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="5" ${colorMap.col5==5?'checked':''}>
						     <span class="checkmark" id="green"></span>
						     <span class="tooltiptext" id="green">${msg_color_grn}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="6" ${colorMap.col6==6?'checked':''}>
						     <span class="checkmark" id="blue"></span>
						     <span class="tooltiptext" id="blue">${msg_color_blu}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="7" ${colorMap.col7==7?'checked':''}>
						     <span class="checkmark" id="skyblue"></span>
						     <span class="tooltiptext" id="skyblue">${msg_color_sky}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="8" ${colorMap.col8==8?'checked':''}>
						     <span class="checkmark" id="navy"></span>
						     <span class="tooltiptext" id="navy">${msg_color_nvy}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="9" ${colorMap.col9==9?'checked':''}>
						     <span class="checkmark" id="purple"></span>
						     <span class="tooltiptext" id="purple">${msg_color_ppl}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="10" ${colorMap.col10==10?'checked':''}>
						     <span class="checkmark" id="brown"></span>
						     <span class="tooltiptext" id="brown">${msg_color_brn}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="11" ${colorMap.col11==11?'checked':''}>
						     <span class="checkmark" id="gray"></span>
						     <span class="tooltiptext" id="gray">${msg_color_gry}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="12" ${colorMap.col12==12?'checked':''}>
						     <span class="checkmark" id="beige"></span>
						     <span class="tooltiptext" id="beige">${msg_color_beg}</span>
						   </label>
						   <label class="container" id="colorcontainer">
						     <input type="checkbox" name="color" value="13" ${colorMap.col13==13?'checked':''}>
						     <span class="checkmark" id="pink"></span>
						     <span class="tooltiptext" id="pink">${msg_color_pnk}</span>
						   </label>
                     </td>
                  </tr>
                  <tr>
                        <th> ${str_price} </th>
                        <td>
                           <input type="text" name="price" class="form-control" value="${products.get(0).productPrice}">
                        </td>
                        <th> ${str_salePercent} </th>
                        <td>
                           <input type="text" name="sale" class="form-control" value="${products.get(0).discount}">
                        </td>
                       	<th> ${str_productQuantity} </th>
                    	<td> 
                        <input type="text" name="quantity" class="form-control" readonly value="${products.get(0).productQuantity}"
                        data-toggle="tooltip" data-placement="bottom" title="${msg_gotoProductList}">
                    	</td> 
                  </tr>
                  <tr>
                     <th colspan="6" id="thimg">
                     	<c:forEach var="img" items="${imageList}">
							<img src="/urPresent/save/${img.imageAddress}" name="${img.imageNo}" id="image" onclick="deleteImage(${img.imageNo})"><br>
						</c:forEach>
						<input type="button" name="addImage" value="${btn_addImage}" onclick="addImages()">
                     </th>
                  </tr>

                  <tr>
                        <th> ${str_content} </th>
                        <td colspan="5">
                           <textarea id="productContent" name="productContent" class="form-control" rows="15"> ${products.get(0).productContent}</textarea>
                        </td>
                  </tr>
                  <tr>
                        <th colspan="6" align="center">
                           <input class="btn btn-primary" type="submit" value="${btn_productModify}">
                           <input class="btn btn-secondary" type="button" value="${btn_back}" onclick="history.back()">
                        </th>
                  </tr>
               </table>
           </form>
       </div>
   </div>
</body>
<script type="text/javascript">
		var cnt = 0;
		function deleteImage(imageNo){
			$("img[name='"+imageNo+"']").remove();
			$("th[id='thimg']").append("<input type='hidden' name='delImg' value='"+imageNo+"'>");
		}
		function addImages(){
			$("th[id='thimg']").append("<input type='file' name='upload"+cnt+"' id='"+cnt+"'>");
			$("th[id='thimg']").append("<input type='button' value='-' id='"+cnt+"'onclick='delImg("+cnt+")'>");
			cnt++;
		}
		function delImg(imgId){
			$("input[id='"+imgId+"']").remove();
		}
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip();   
		});
</script>  

</html>
