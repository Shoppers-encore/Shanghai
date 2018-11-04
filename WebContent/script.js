
/*Message*/
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var delCheck = "삭제하시겠습니까?";
var cannotdelete = "삭제 권한이 없습니다.";
var cannotmodify = "수정 권한이 없습니다.";

//Message-userLoginPro-User Login
var loginiderror = "입력하신 아이디가 없습니다.\n아이디를 다시 확인하세요.";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인하세요.";

//Message-userInputForm-Join Member
var confirmerror = "아이디 중복확인 해 주세요";
var error = "아이디 중복확인 실패";




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


//<Review>
function reviewDelcheck() {
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
	}
