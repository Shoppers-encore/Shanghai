
/*Message*/
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var delCheck = "삭제하시겠습니까?";
var cannotdelete = "삭제 권한이 없습니다.";
var cannotmodify = "수정 권한이 없습니다.";

//Message-userInputForm-JoinMember
var confirmerror = "아이디 중복확인 해 주세요";





/*Function*/
//<userInput-JoinMember>
//Confirm ID - check if it is possible to use the entered ID
var confirmId = 0;
function confirmID() {
	var id = $("#id").val();
	if (id) {
		$.ajax({
			async : true,
			type : 'POST',
			data : id,
			url : "idCheck.go",
			dataType : "json",
			success : function(data) {
				if (data.countId > 0) {
					$('#IdCheckMessagegg').html(
							"아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				} else {
					$('#IdCheckMessagegg').html("사용가능한 아이디입니다.");
					idck = 1; //아이디 중복체크시 1이됨
				}
			},
			error : function(error) {
				alert("error : " + error);
			}
		});
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
