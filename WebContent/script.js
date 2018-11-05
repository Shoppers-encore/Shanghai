
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

//Message-userLoginPro-User Login
var loginiderror = "입력하신 아이디가 없습니다.\n아이디를 다시 확인하세요.";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인하세요.";

//Message-userInputForm-Join Member
var confirmerror = "아이디 중복확인 해 주세요";
var error = "아이디 중복확인 실패";


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
 var num ="{}[]()<>?_|~`!@#$%^&*-+\"'\\/ ";    //Write characters to block
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



///<Review>
/*function reviewDelcheck() {
	   var writer = document.detailForm.id.value;
	   var sessionId = document.detailForm.sessionId.value;

	  if( sessionId == writer ) {
		   if ( confirm( delCheck ) ) {
			   document.location.href = "reviewDeletePro.jk";
		   } else {
			   alert( cannotdelete );
			   return false;
		   }
	   }
	}

function reviewModable() {
	   var writer = document.detailForm.id.value;
	   var sessionId = document.detailForm.sessionId.value;
	   if( sessionId == writer ){
	      document.location.href = "reviewModifyForm.jk";
	   } else {
	      alert( cannotmodify );
	      return false;
	   }
	}*/

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
	alert( photoNo);
	/*var photoModify ='';
	
	photoModify += '<div class="input-group" style="width:80%;">';
	photoModify += '<input type="text" class="form-control" name="commentContent_'+commentNo+'" value="'+commentContent+'"/>';
	photoModify += '&nbsp;<button class="btn btn-outline-primary btn-sm" onclick="commentUpdateProc('+commentNo+');">수정</button>';
	photoModify += '</div>';
	   
	$('.photo'+photoNo).html(photoModify);*/
	   
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

