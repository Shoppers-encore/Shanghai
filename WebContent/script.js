
//Message
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var delCheck = "삭제하시겠습니까?";
var cannotdelete = "삭제 권한이 없습니다.";
var cannotmodify = "수정 권한이 없습니다.";






//Function

//<Review>
function reviewDelcheck() {
	   var writer = '${document.ReviewDto.id}';
	   if( sessionScope.id == writer ) {
		   if ( confirm( delCheck ) ) {
			   document.location.href = "reviewDeletePro.jk";
		   } else {
			   alert( cannotdelete );
			   return false;
		   }
	   }
	}

function reviewModable() {
	   var writer = '${document.ReviewDto.id}';      // 작성자 변수 이렇게 쓰는게 맞는지 여전히 모르겟음
	   if( sessionScope.id == writer ){
	      document.location.href = "ReviewModifyForm.jk";
	   } else {
	      alert( cannotmodify );
	      return false;
	   }
	}
