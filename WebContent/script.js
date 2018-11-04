
//Message
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var delCheck = "삭제하시겠습니까?";
var cannotdelete = "삭제 권한이 없습니다.";
var cannotmodify = "수정 권한이 없습니다.";
var commenterror = "댓글을 입력해 주세요.";





//Function

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
       data : {'commentContent' : updateContent, 'commentNo' : commentNo},
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