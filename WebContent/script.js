
//Message
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var delCheck = "삭제하시겠습니까?";
var cannotdelete = "삭제 권한이 없습니다.";
var cannotmodify = "수정 권한이 없습니다.";

var taginputerror = "태그를 추가하지 못했습니다.\n잠시 후 다시 시도하세요.";






//Function

////// <User>
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

////// <Admin>
// <tag>
function addTag() {
    var url = "tagInputForm.jk";
    open( url, "add Tag", "toolbar=no, scrollbar=no, status=no, menubar=no, width=300px, height=300px" );
 }
