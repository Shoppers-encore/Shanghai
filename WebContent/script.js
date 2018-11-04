
//Message
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var delCheck = "삭제하시겠습니까?";
var cannotdelete = "삭제 권한이 없습니다.";
var cannotmodify = "수정 권한이 없습니다.";
var commenterror = "댓글을 입력해 주세요.";





//Function

///<Review>
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
	var sessionId=$("input[name=session]").val();
	$.ajax({
       url : 'commentSelect.jk',
       type : 'get',
       data : {reviewNo : reviewNo},
       success : function(data){
           var commentView ='';
           $.each(data, function(key, comment){ 
           	commentView += '<th  colspan="2"><div class="commentArea">';
           	commentView += '</div class="commentInfo'+comment.commentNo+'"><b>'+comment.id+'</b>';
           	if(SessionID == comment.userId){
           	commentView += '<a onclick="commentUpdate('+comment.commentNo+',\''+comment.commentContent+'\');"> 수정 </a>';
           	commentView += '<a onclick="commentDelete('+comment.commentNo+');"> 삭제 </a>';
           	}
           	commentView += '<div class="commentContent"> <p>'+comment.commentContent +'</p>';
           	commentView += '</div></div></th>'
           });
           $(".commentList").html(commentView);
       },
       error : function(error) {
           alert(commenterror);
       }
   });
}

/*
//Comment Modify-change to inputform 
function commentUpdate(c_id, c_content){
   var commentModify ='';
   
   commentModify += '<div class="input-group">';
   commentModify += '<input type="text" class="form-control" name="c_content_'+c_id+'" value="'+c_content+'"/>';
   commentModify += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+c_id+');">수정</button> </span>';
   commentModify += '</div>';
   
   $('.commentContent'+c_id).html(commentModify);
   
}

//Comment Modify
function commentUpdateProc(c_id){
   var updateContent = $('input[name=c_content_'+c_id+']').val();
   var tb_no=$("input[name=tb_no").val();
   $.ajax({
       url : 'commentUpdate.go',
       type : 'post',
       data : {'c_content' : updateContent, 'c_id' : c_id},
       success : function(data){
           commentList(tb_no); 
       }
   });
}

//Comment Delete
function commentDelete(c_id){
	var tb_no=$("input[name=tb_no]").val();
   $.ajax({
       url : 'commentDelete.go',
       type : 'post',
       data : {
       	c_id : c_id
       },
       success : function(data){
           commentList(tb_no); 
       },
       error : function(error) {
           alert("error : " + error);
       }
   });
}*/

