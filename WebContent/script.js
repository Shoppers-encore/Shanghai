
//Error
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var cannotdelete = "삭제 권한이 없습니다.";
var delCheck = "삭제하시겠습니까?";





//Function
function reviewDelcheck() {
	   var writer = '${document.ReviewDto.id}';
	   if( sessionScope.id == writer ) {
		   if (confirm( delCheck )) {
		       //forward to delete page
		   } else {
			   alert( cannotdelete );
			   return false;
		   }
	   }
	}
