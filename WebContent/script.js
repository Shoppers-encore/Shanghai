
/*Message*/
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var delCheck = "삭제하시겠습니까?";
var cannotdelete = "삭제 권한이 없습니다.";
var cannotmodify = "수정 권한이 없습니다.";
var taginputerror = "태그를 추가하지 못했습니다.\n잠시 후 다시 시도하세요.";
var tagdeleteerror = "태그를 삭제하지 못했습니다.\n잠시 후 다시 시도하세요.";
var notagchecked = "삭제할 태그를 선택해주세요.";
var commenterror = "댓글을 입력해 주세요.";
var modifyerror = "수정에 실패했습니다.\n잠시 후 다시 시도하세요.";
var nopasswderror = "비밀번호는 필수 입력사항입니다.";
var nonameerror = "이름은 필수 입력사항입니다.";
var notelerror = "전화번호는 필수 입력사항입니다.";
var telerror = "전화번호 형식에 맞지 않습니다.";
var noemailerror = "이메일은 필수 입력사항입니다.";
var emailfmterror = "이메일 형식에 맞지 않습니다.";
var onlynum = "숫자만 입력이 가능합니다.";
var modcompleted = "수정이 완료되었습니다.";
var adminonly = "관리자만 접근할 수 있습니다.";

//Message-userLoginPro-User Login
var loginiderror = "입력하신 아이디가 없습니다.\n아이디를 다시 확인하세요.";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인하세요.";
var rejoinmsg = "탈퇴된 계정입니다.\n회원가입 해주세요. ";

//Message-userInputForm-Join Member
var confirmerror = "아이디 중복확인 해 주세요";
var error = "아이디 중복확인 실패";
var emailfmterror = "이메일 형식에 맞지 않습니다.";
var emailcheckerror1 = "이메일 인증 해 주세요.";
var emailcheckerror2 = "인증번호가 일치하지 않습니다."
var emailconfirmerror = "이메일 인증 후 다시 시도해주세요.";
var iderror = "아이디 중복 확인 후 다시 시도해주세요.";
var passwderror = "비밀번호 일치 여부 확인 해주세요.";

	
// Message-BasketList
var emptyBasket='장바구니에 담긴 상품이 없습니다.';
var emptyBasketCount='전체 상품: 총 0개';


	
	
////// <User>

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
					$('#confirmIdResult').html("아이디가 존재합니다. 다른 아이디를 입력해주세요.");						
				} else {
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
		$('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
	} else {
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


//SMTP - Simple Mail Transfer Protocol
function mailTransfer() {
	if(inputform.email.value.indexOf("@") == -1 || inputform.email.value.indexOf(".") == -1){ //check proper email format
	      alert(emailfmterror);
	      return false;
	 }
	var url = "userMailCheck.jk?email="+inputform.email.value;	//direct to UserProHandler.java with email value
	//open(URL, name, specs, replace)
	open(url,"name", "status=no, scrollbars=no, menubar=no, resizable=no, width=500, height=250, top=180, left=630" );
}
//Check authentication-key match
function matchAuthKey() {
    if( mailCheckForm.mailnum.value != mailCheckForm.emailcode.value ){ //null 값 입력시 emailcheckerror1 메시지 뜨는처리도 추가하기
    	 alert( emailcheckerror2 );
    } else {
        alert( "인증 완료되었습니다" );
        self.close();
    }
}
//Validity Check for userInputForm - function for joining member
function inputCheck() {
	   if( inputform.email.value == 0 ) {      // 이메일 인증 안하면 block
	      alert( emailconfirmerror );
	      inputform.email.focus();
	      return false;
	   } else if( idCheck != 1 ) {					// 아이디 중복 확인 안하면 회원가입 block
	      alert( iderror );
	      inputform.id.focus();
	      return false;
	   } else if( inputform.password.value != inputform.repassword.value ) {
	      alert( passwderror );
	      inputform.repassword.focus();
	      return false;
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

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}

//////////////////////////////////////////////////////////////////////////


///<Review>
function scoring() {
	   var slider = document.getElementById("myRange");
	   var output = document.getElementById("demo");
	   output.innerHTML = slider.value;

	   slider.oninput = function() {
	     output.innerHTML = this.value;
	   }
	}

///<Review Comment>
function commentInsert(){
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

//Delete Photo
function photoModify(photoNo){
	var photoModify ='';
	photoModify += '<div><input class="btn btn-outline-danger" type="file" name="photo'+photoNo+'"></div>';
	   
	$('.photo'+photoNo).html(photoModify);
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
	if( ! tagForm.getAttribute("checked") ) {
		alert( notagchecked );
		return false;
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
      // upper side number keycodes 48~57 // rihgt side number keycodes 96~105 // is the key one of the editing keys?
      return;
   } else {
      alert( onlynum );
      form.tel.value = form.tel.value.substr(0, form.tel.value.length-1);
      return false;
   }
}

