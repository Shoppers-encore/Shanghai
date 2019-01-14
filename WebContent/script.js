
/*Message*/
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도해 주세요.";
var delCheck = "삭제하시겠습니까?";
var cannotdelete = "삭제 권한이 없습니다.";
var cannotmodify = "수정 권한이 없습니다.";
var taginputerror = "태그를 추가하지 못했습니다.\n잠시 후 다시 시도해 주세요.";
var tagdeleteerror = "태그를 삭제하지 못했습니다.\n잠시 후 다시 시도해 주세요.";
var notagchecked = "삭제할 태그를 선택해 주세요.";
var commenterror = "댓글을 입력해 주세요.";
var modifyerror = "수정에 실패했습니다.\n잠시 후 다시 시도해 주세요.";
var nopasswderror = "비밀번호는 필수 입력사항입니다.";
var nonameerror = "이름은 필수 입력사항입니다.";
var notelerror = "전화번호는 필수 입력사항입니다.";
var telerror = "전화번호 형식에 맞지 않습니다.";
var noemailerror = "이메일은 필수 입력사항입니다.";
var emailfmterror = "이메일 형식에 맞지 않습니다.";
var onlynum = "숫자만 입력이 가능합니다.";
var modcompleted = "수정이 완료되었습니다.";
var inputcompleted = "상품등록이 완료되었습니다.";
var adminonly = "관리자만 접근할 수 있습니다.";
var addresserror="주소는 필수 입력사항입니다.";

//Message-userLoginPro-User Login
var loginiderror = "입력하신 아이디가 없습니다.\n아이디를 다시 확인해 주세요.";
var loginpasswderror = "입력하신 비밀번호가 틀렸습니다.\n비밀번호를 다시 확인해 주세요.";
var rejoinmsg = "탈퇴된 계정입니다.\n다시 회원가입을 해 주세요. ";

//Message-userInputForm-Join Member
var confirmerror = "아이디 중복확인을 해 주세요.";
var error = "아이디 중복확인 실패";
var emailcheckerror1 = "이메일 인증을 해 주세요.";
var emailcheckerror2 = "인증번호가 일치하지 않습니다."
var emailconfirmerror = "이메일 인증 후 다시 시도해 주세요.";
var iderror = "아이디 중복 확인 후 다시 시도해 주세요.";
var passwderror = "비밀번호 일치 여부를 확인해 주세요.";

	
// Message-BasketList
var emptyBasket='장바구니에 담긴 상품이 없습니다.';
var emptyBasketCount='전체 상품: 총 0개';

// Message-productInputForm
var noSizeChecked = "사이즈를 선택해 주세요.";
var noCategorySelected = "카테고리를 선택해 주세요";
var noTagChecked = "태그를 선택해 주세요.";
var noColorChecked = "색상을 선택해 주세요.";
var noProductName = "상품명을 입력해 주세요.";
var noProductPrice = "상품 가격을 입력해 주세요.";
var noProductQuantity = "상품 초기 수량을 입력해 주세요.";
var noProductContent = "상품 소개를 입력해 주세요.";

////// <User>
function findId() {
	url='findId.jk';
	title='아이디 찾기';
	window.open(url, title, 
		'width=500, height=450, location=no, status=no, scrollbars=no');
}

function findPw() {
	url='findPassword.jk';
	title='비밀번호 찾기';
	window.open(url, title, 
		'width=500, height=515, location=no, status=no, scrollbars=no');
}


//chat

function chatting(){
	url='chatView.jk';
	title='1:1상담';
	window.open(url, title, 
		'width=310, height=500, location=no, status=no');
}

/*Function*/
/////////////////////////////<userLoginPro-User Login>///////////////////////////////////
function erroralert( msg ) {
	alert( msg );
	history.back();
}
/////////////////////////////<userInput-JoinMember>//////////////////////////////////////
//Confirm ID - check if it is possible to use the entered ID
var idCheck = 0;
function confirmId() {
	var id = $("#id").val();			//getValue from the inputform & set Variable
	if (id) {
		$.ajax({
			async : true,
			type : 'POST',
			data : id,					//Parameter value
			url : "confirmId.jk",		//Controller Mapping - UserProHandler
			dataType : "json",			//Transformed format
			success : function(data) {	//When succeeded
				if (data.countId > 0) {
					$('#id').css({
						border: '2px solid brown'
					});
					$('#confirmIdResult').css({
						color: 'brown'
					});
					$('#confirmIdResult').html("이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");						
				} else {
					$('#id').css({
						border: '1px solid #ced4da'
					});
					$('#confirmIdResult').css({
						color: 'green'
					});
					$('#confirmIdResult').html("사용가능한 아이디입니다.");
					idCheck = 1; 			//아이디 중복체크시 1이됨 -
				}
			},
			error : function(error) {		//Fail confirming id
				alert("error : " + error);
			}
		});
	}
}
//Check if password(id: password) & repassword(id: repassword) is identical AJAX or DOM
function passwordCheckFunction() {
	var password1 = $('#password1').val();
	var password2 = $('#password2').val();
	if (password1 != password2) {
		$('#password2').css({
			border: '2px solid brown'
		});
		$('#passwordCheckMessage').css({
			color: 'brown'
		});
		$('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
	} else {
		$('#password2').css({
			border: '1px solid #ced4da'
		});
		$('#passwordCheckMessage').html(" ");
	}
}
//Input Validation: block special character input - Name
function checkNumber() {
 var objEv = event.srcElement;
 var num ="{}[]()<>?_|~`!@#$%^&*-+\"'\\/ ";    //Write characters to block here
 event.returnValue = true;
 for (var i=0;i<objEv.value.length;i++) {
	 if(-1 != num.indexOf(objEv.value.charAt(i)))
		 event.returnValue = false;
	 } 
	 if (!event.returnValue) { 
		 alert("특수문자는 입력하실 수 없습니다.");
		 objEv.value="";
	 }
}

//Input Validation: block special character & accept input of only numbers
function checkHeight(){
	var num ="{}[]()<>?_|~`!@#$%^&*-+\"'\\/ ";
    if((event.keyCode<48)||(event.keyCode>57) && (event.keyCode==num))  //input only numbers
       event.returnValue=false;
}

//Check authentication-key match
function matchAuthKey() {
    if( mailCheckForm.mailnum.value != mailCheckForm.emailcode.value ){ //null 값 입력시 emailcheckerror1 메시지 뜨는처리도 추가하기
    	 alert( emailcheckerror2 );
    } else {
        alert( '인증 완료되었습니다' );
        $('#emailVerificationMsg', window.opener.document.inputform).text('이메일이 인증되었습니다.');
        $('#emailVerificationMsg', window.opener.document.inputform).css({
        	color: 'green'
		});
        self.close();
    }
}

//Find address through zip-code : http://postcode.map.daum.net/guide#sample
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        	
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = data.address;
        }
    }).open();
}

//////////////////////////////////////////////////////////////////////////
/* Validity Check for userInputForm - function for joining member */
function joincheck() {
	if( idCheck != 1 ) {					// 아이디 중복 확인 안하면 회원가입 block
		alert( iderror );
		$('#id').focus();
		return false;
	} else if( $('#password1').val() != $('#password2').val() ) {
		alert( passwderror );
		$('#password2').focus();
		return false;
	} else if(!$('#email').val()) {
		alert(noemailerror);
		$('#email').focus();
		return false;
	} else if($('#emailVerificationMsg').html()!='이메일이 인증되었습니다.') {      // 이메일 인증 안하면 block
		alert( emailconfirmerror );
		$('.emailVerificationBtn').focus();
		return false;
	} else if(!$('#address').val()) {
		alert( addresserror );
		$('.addressSearchBtn').focus();
		return false;
	}
}

/*function modifyCheck() {
	alert(document.getElementById('zipcode').value);
	return false;
}*/


///<Review>
function scoring() {
	   var slider = document.getElementById("myRange");
	   var output = document.getElementById("demo");
	   output.innerHTML = slider.value;

	   slider.oninput = function() {
	     output.innerHTML = this.value;
	   }
	}
function checkReviewWrite(){
	if($("input:text[name='title']").val()==null || $("input:text[name='title']").val().trim()==''){
		alert('제목을 입력해주세요');
		$("input:text[name='title']").focus();
		return false;
	}else if($("textarea[name='reviewContent']").val()==null || $("textarea[name='reviewContent']").val().trim()==''){
		alert('내용을 입력해주세요');
		$("textarea[name='reviewContent']").focus();
		return false;
	}
}
function reviewDelete(reviewNo, pageNum){
	var reviewdeleteconfirm = confirm('리뷰를삭제하시겠습니까?');
	if(reviewdeleteconfirm){
		location='reviewDeletePro.jk?reviewNo='+reviewNo+'&pageNum='+pageNum;
	}
}

///<Review Comment>
function commentInsert(){
	if($("[name='commentContent']").val()==null || $("[name='commentContent']").val().trim()==''){
		alert('글을 쓰고 등록해주세요');
		return false;
	}
	var insertData = $('[name=commentInsertForm]').serialize();
	CmtInsert(insertData);
}


//Comment Insert
function CmtInsert(insertData){
	var reviewNo=$('input[name=reviewNo]').val();
	if(commentInsertForm.commentContent.value){
	$.ajax({
       url : 'commentInsert.jk',
       type : 'post',
       data : insertData,
       success : function(data){
       	if(data == 1) {
       		/*error message*/
          }else{
       	   commentList(reviewNo);
       	   $('[name=commentContent]').val('');
          }
       },
   	error : function(error) {
       alert("error : " + error);
   		}
   });
	}else{
		alert(commenterror);
	}
}

//Comment List
function commentList(reviewNo){
	var sessionId=$('input[name=session]').val();
	$.ajax({
       url : 'commentSelect.jk',
       type : 'get',
       data : {reviewNo : reviewNo},
       success : function(data){
           var commentView ='';
           $.each(data, function(key, comment){ 
           	commentView += '<div class="commentArea row">';
           	commentView += '<div class="commentInfo'+comment.commentNo+'" style="width:20%;"><b>'+comment.id+'</b>';
           	if(sessionId == comment.id){
           	commentView += '&nbsp;<button class="btn btn-outline-primary btn-sm" onclick="commentUpdate('+comment.commentNo+',\''+comment.commentContent+'\');">수정</button>';
           	commentView += '<button class="btn btn-outline-primary btn-sm" onclick="commentDelete('+comment.commentNo+');">삭제</button>';
           	}
           	commentView += '</div><div class="commentContent'+comment.commentNo+'" style="width:80%;"><p>'+comment.commentContent +'</p>';
           	commentView += '</div></div>'
           });
           $(".commentList").html(commentView);
       },
       error : function(error) {
           alert(commenterror);
       }
   });
}

//Comment Modify change to inputform 
function commentUpdate(commentNo, commentContent){
   var commentModify ='';
   
   commentModify += '<div class="input-group" style="width:80%;">';
   commentModify += '<input type="text" class="form-control" name="commentContent_'+commentNo+'" value="'+commentContent+'"/>';
   commentModify += '&nbsp;<button class="btn btn-outline-primary btn-sm" onclick="commentUpdateProc('+commentNo+');">수정</button>';
   commentModify += '</div>';
   
   $('.commentContent'+commentNo).html(commentModify);
   
}

//Comment Modify
function commentUpdateProc(commentNo){
   var updateContent = $('input[name=commentContent_'+commentNo+']').val();
   var reviewNo=$('input[name=reviewNo]').val();
   $.ajax({
       url : 'commentUpdate.jk',
       type : 'post',
       data : {
    	   'commentContent' : updateContent, 
    	   'commentNo' : commentNo
    	   },
       success : function(data){
           commentList(reviewNo); 
       }
   });
}

//Comment Delete
function commentDelete(commentNo){
	var reviewNo=$('input[name=reviewNo]').val();
   $.ajax({
       url : 'commentDelete.jk',
       type : 'post',
       data : {
       	commentNo : commentNo
       },
       success : function(data){
           commentList(reviewNo); 
       },
       error : function(error) {
           alert("error : " + error);
       }
   });
}




// BasketList
function returnToList() {
	window.location.href='main.jk';
}


//////<Admin>
//<tag>
function tagPopup() {
	var url = "tagInputForm.jk";
	open( url, "add Tag", "toolbar=no, scrollbar=no, status=no, menubar=no, width=400px, height=300px" );
}
function inputTag() {
	opener.location.reload(true);
	window.location.href='tagInputPro.jk';
}
function isTagChecked() {
    var tags = document.getElementsByName("tag");
    var length = tags.length;
    var checkedNum = 0; 
    for (i=0; i <length; i++) {
        if (tags[i].checked == true) { 
            checkedNum += 1;
            alert(tags[i].value);  
        }
    }
    if (checkedNum == 0 ) {
		alert( notagchecked );
        return false;
    } else {
        return;
    }
}

// <mypage>
function admModcheck() {
	if( ! admModForm.passwd.value ) {
		alert( nopasswderror );
		admModForm.passwd.focus();
		return false;
	} else if( admModForm.passwd.value != admModForm.repasswd.value ) {
		alert( loginpasswderror );
		admModForm.repasswd.focus();
		return false;
	} 
	/*   if( admModForm.passwd.value != admModForm.realpasswd.value ) {
		   alert( passwderror );
		   return false;
   }*/
	if( ! admModForm.name.value ) {
		alert( nonameerror );
		admModForm.name.focus;
		return false;
	}
	if( ! admModForm.tel.value ) {
		alert( notelerror );
		admModForm.tel.focus;
		return false;
	} else if( admModForm.tel.value.length < 10 || admModForm.tel.value.length > 11 ) {
		alert( telerror );
		admModForm.tel.focus();
		return false;
	}

	if( ! admModForm.email.value ) {
		alert( noemailerror );
		admModForm.email.focus();
		return false;
	} else if( admModForm.email.value.indexOf("@") == -1 || admModForm.email.value.indexOf(".") == -1) {
		alert( emailfmterror );
		admModForm.email.focus();
		return false;
	}
}

var editingKeycodes = [8, 46, 37, 39];   // keys for editing : backspace(8), delete(46), L/R arrows(37,39) 
function numberonly( event, form ) {      // function for typing only numbers
   var kc = event.keyCode;
   if( ( kc >= 48 && kc <= 57) || ( kc >= 96 && kc <= 105) || editingKeycodes.indexOf(kc) != -1 ) {
      // upper side number keycodes 48~57 // right side number keycodes 96~105 // is the key one of the editing keys?
      return;
   } else {
      alert( onlynum );
      form.tel.value = form.tel.value.substr(0, form.tel.value.length-1);
      return false;
   }
}


// <product>
function productInputCheck() {		
    var sizes = document.getElementsByName("size");
    var sizeCheck = 0;
    var tags = document.getElementsByName("tag");
    var tagLength = tags.length;
    var tagCheck = 0;
    var productName = document.getElementById("product_name").value;
    var colors = document.getElementsByName("color");
    var colorCheck = 0;
    var price = document.getElementById("price").value;
    var quantity = document.getElementById("quantity").value;
    var content = document.getElementById("productContent").value;
    for (i=0; i <5; i++) {
        if (sizes[i].checked == true) { 
            sizeCheck = 1;
        }
    }
    for (i=0; i<tagLength; i++) {
    	if(tags[i].checked == true) {
    		tagCheck = 1;
    	}
    }
    for (i=0; i <14; i++) {
        if (colors[i].checked == true) { 
            colorCheck = 1;
        }
    }
    
    if(sizeCheck != 1) {
    	alert( noSizeChecked );
    	return false;
    } else if( document.getElementById("catCheck").selected == true ) {
    	alert( noCategorySelected );
    	return false;
    } else if( tagCheck != 1 ) {
    	alert( noTagChecked );
    	return false;
    } else if( productName == "" || productName == null ) {
    	alert( noProductName );
    	return false;
    } else if(colorCheck != 1) {
    	alert( noColorChecked );
    	return false;
    } else if( price == "" || price == null ) {
    	alert( noProductPrice );
    	return false;
    } else if( content == "" || content == null ) {
    	alert( noProductContent );
    	return false;
    }
    
    /////////// PHOTO!!! /////////
}

function productDelete(ref){
	var productdeleteconfirm = confirm(ref + '번 상품을 삭제하시겠습니까?');
	if(productdeleteconfirm){
		location='productDeletePro.jk?ref='+ref;
	}
}
function admReviewDelete(reviewNo, pageNum){
	var reviewdeleteconfirm = confirm('리뷰를삭제하시겠습니까?');
	if(reviewdeleteconfirm){
		location='admReviewDelete.jk?reviewNo='+reviewNo+'&pageNum='+pageNum;
	}
}