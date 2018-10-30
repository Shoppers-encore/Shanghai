
var iderror = "아이디를 입력하세요";
var idlongerror = "아이디가 너무 깁니다. 5자 이하로 해주세요";
var inputerror = "회원가입에 실패했습니다.\n잠시 후 다시 시도하세요.";
var passwderror = "비밀번호를 입력하세요";
var confirmerror = "아이디 중복확인 해 주세요";
var admdepterror = "소속부서가 배치 되지 않았습니다. \n총괄팀에 연락해보세요";
var repasswderror = "비밀번호가 다릅니다";
var nameerror = "이름을 입력하세요";
var telerror = "전화번호를 입력하세요";
var emailfmterror = "이메일 형식에 맞지 않습니다";
var emailconfirmerror = "이메일 인증을 해 주세요";
var onlynum = "숫자만 입력 가능합니다.";
var email1='naver.com';
var email2='daum.net';
var email3='gmail.com';
var email4='nate.com';
var passwderror = "비밀번호를 입력해 주세요";
var repasswderror = "비밀번호가 다릅니다";
var telerror = "전화번호를 입력해 주세요";
var confirmdelete = "정말 탈퇴하시겠습니까?";
var addresserror ="주소를 입력해 주세요";
var emailerror = "이메일을 입력해 주세요";
var confirmexchange = "교환 신청하시겠습니까?";
var confirmrefund = "반품 신청하시겠습니까?";
var quantityerror = "반품 수량을 입력해 주세요";
var refunderror = "반품 사유를 입력해 주세요";
var nameerror = "이름을 입력해 주세요";

function mailconfirmu(){
   opener.document.inputform.emailconfirm.value=1;
   self.close();
}
/*admMypage*/
function admModcheck() {
   if( ! admModform.passwd.value ) {
      alert( passwderror );
      admModform.passwd.focus();
      return false;
   } else if( admModform.passwd.value != admModform.repasswd.value ) {
      alert( repasswderror );
      admModform.repasswd.focus();
      return false;
   } else if( ! admModform.name.value ) {
      alert( nameerror );
      admModform.name.focus();
      return false;
   } else if( ! admModform.tel.value ) {
      alert( telerror );
      admModform.tel.focus();
      return false;
   } else if( ! admModform.email.value ) {
      alert( emailerror );
      return false;
   } else if( admModform.email.value.indexOf( "@" ) == -1 ) {
      alert( emailfmterror );
      return false;
   }
}
   // 위쪽에 정의된 numberonly(event, form) 메소드도 씀

//searchBuyer
function searchBuyer(){
   var url = "searchBuyer.jk";
   var popOption = "width=370, height=250, resizable=no, scrollbars=no, status=no;";
      open(url,"",popOption);
}
//selectBuyer
function selectBuyer(name, code){
   opener.document.goodInputform.buyer_name.value = name;
   opener.document.goodInputform.buyer_code.value = code;
   self.close();
}
//goodcode
function mergeGoodcode(){
   var colorselect = document.getElementById("cl");
   var color = colorselect.options[colorselect.selectedIndex].value;
  
   var ref = document.gooddetailform.reff.value;
  
   var sizeselect = document.getElementById("sz");
   var size = sizeselect.options[sizeselect.selectedIndex].value;
  
   var goodcode = color + + ref + size;
   document.gooddetailform.goodcode.value = goodcode;
  
}
var writeerror = "작성자를 입력해주세요";
var titleerror = "글제목을 입력해주세요";
var contenterror = "글내용을 입력해주세요";
var passwderror = "비밀번호를 입력해주세요";
var iderror = "아이디를 입력하세요";
var inputerror = "회원가입에 실패했습니다.\n잠시 후 다시 시도하세요.";
var confirmerror = "아이디 중복확인 해 주세요";
var repasswderror = "비밀번호가 다릅니다";
var nameerror = "이름을 입력하세요";
var telerror = "전화번호를 입력하세요";
var emailerror = "전화번호를 입력하세요";
var emailfmterror = "이메일 형식에 맞지 않습니다";
var emailconfirmerror = "이메일 인증을 해 주세요";
var onlynum = "숫자만 입력 가능합니다.";
var loginiderror = "입력하신 아이디가 없습니다.\n아이디를 다시 확인하세요.";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인하세요.";
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var deleteerror = "글삭제에 실패했습니다.\n잠시 후 다시 시도하세요.";
var modifyerror = "글수정에 실패했습니다.\n잠시 후 다시 시도하세요.";
var cannotmodify = "수정 권한이 없습니다.";
var cannotdelete = "삭제 권한이 없습니다.";


function admInputcheck() {      
/*   if( admInputform.confirm.value == 0 ) {
      alert( confirmerror );
      admInputform.confirm.focus();
      return false;
   }*/
   if( admInputform.emailconfirm.value == 0 ) {      // 이메일 인증 안하면 못 넘어가게
      alert( emailconfirmerror );
      admInputform.emailconfirm.focus();
      return false;
   }
   if( ! admInputform.id.value ) {
      alert( iderror );
      admInputform.id.focus();
      return false;
   } else if( ! admInputform.passwd.value ) {
      alert( passwderror );
      admInputform.passwd.focus();
      return false;
   } else if( admInputform.passwd.value != admInputform.repasswd.value ) {
      alert( repasswderror );
      admInputform.repasswd.focus();
      return false;
   } else if( ! admInputform.name.value ) {
      alert( nameerror );
      admInputform.name.focus();
      return false;
   } else if( ! admInputform.tel.value ) {
      alert( telerror );
      admInputform.tel.focus();
      return false;
   } else if( ! admInputform.email.value ) {
      alert( emailerror );
      return false;
   } else if( admInputform.email.value.indexOf( "@" ) == -1 ) {
      alert( emailfmterror );
      return false;
   }
}
var editingKeycodes = [8, 46, 37, 39];   // 숫자키 외에 수정시에 필요한 백스페이스(8), 딜리트(46), 왼오른 화살표(37,39)
function numberonly( event, form ) {      // 숫자만 입력이 가능하게 하는 메소드
   var kc = event.keyCode;
   if( ( kc >= 48 && kc <= 57) || ( kc >= 96 && kc <= 105) || editingKeycodes.indexOf(kc) != -1 ) {
      // 일반숫자키코드 48~57         // 숫자키패드키코드 96~105      // 수정시에 필요한 키코드에 포함되었는가?
      return;
   } else {
      alert( onlynum );
      form.tel.value = form.tel.value.substr(0, form.tel.value.length-1);
      return false;
   }
}
/*confirmId*/
function confirmcheck() {
   if( ! confirmform.id.value ) {
      alert( iderror );
      confirmform.id.focus();
      return false;
   }
}

   // 위쪽에 정의된 numberonly(event, form) 메소드도 씀
/*noticeWriteForm*/
function writecheck() {
   if( ! writeform.writer.value ) {
      alert( writeerror );      
      writeform.writer.focus();
      return false;
   } else if( ! writeform.title.value ) {
      alert( titleerror );  
      writeform.title.focus();  
      return false;
   } else if( ! writeform.content.value ) {
      alert( contenterror );
      writeform.content.focus();
      return false;
   }
}
/*noticeContent*/
function noticeDelconfirm() {
   var url = "noticeDelConfirm.jsp";
   var popOption = "width=370, height=250, resizable=no, scrollbars=no, status=no;";
      open(url,"",popOption);  
}
/*noticeModView*/
function QAModcheck() {
   if( ! modform.title.value ) {
      alert( titleerror );
      modform.title.focus();
      return false;
   } else if( ! modform.content.value ) {
      alert( contenterror );
      modform.content.focus();
      return false;
   }
}
/*noticeDelConfirm*/
function noticeDelprocess() {
   opener.document.location.href = "noticeDelPro.jk";
   self.close();
}
/*QAContent*/
function QAModable() {
   var writer = '${document.QADto.id}';      // 작성자 변수 이렇게 쓰는게 맞는지 모르겟음
   if( sessionScope.id == writer ){
      document.location.href = "QAModView.jsp";
   } else {
      alert( cannotmodify );
      return false;
   }
}
function QADelcheck() {
   var writer = '${document.QADto.id}';
   if( sessionScope.id == writer || sessionScope.id.length <= 5) {
      var url = "QADelConfirm.jsp";
      var popOption = "width=370, height=250, resizable=no, scrollbars=no, status=no;";
         open(url,"",popOption);  
   } else {
      alert( cannotdelete );
      return false;
   }
}
/*QADelConfirm*/
function QADelProcess() {
   opener.document.location.href = "QADelPro.jk";
   self.close();
   }
/*ReviewWriteForm*/
function scoring() {
   var slider = document.getElementById("myRange");
   var output = document.getElementById("demo");
   output.innerHTML = slider.value;
   slider.oninput = function() {
     output.innerHTML = this.value;
   }
}
/*ReviewContent*/
function ReviewModable() {
   var writer = '${document.ReviewDto.id}';      // 작성자 변수 이렇게 쓰는게 맞는지 여전히 모르겟음
   if( sessionScope.id == writer ){
      document.location.href = "ReviewModView.jsp";
   } else {
      alert( cannotmodify );
      return false;
   }
}
function ReviewDelcheck() {
   var writer = '${document.ReviewDto.id}';
   if( sessionScope.id == writer ) {
      var url = "ReviewDelConfirm.jsp";
      var popOption = "width=370, height=250, resizable=no, scrollbars=no, status=no;";
         open(url,"",popOption);  
   } else {
      alert( cannotdelete );
      return false;
   }
}
/*ReviewDelConfirm*/
function ReviewDelprocess() {
   opener.document.location.href = "ReviewDelPro.jk";
   self.close();
}

var iderror = "아이디를 입력하세요";
var idlongerror = "아이디가 너무 깁니다. 5자 이하로 해주세요";
var inputerror = "회원가입에 실패했습니다.\n잠시 후 다시 시도하세요.";
var passwderror = "비밀번호를 입력하세요";
var confirmerror = "아이디 중복확인 해 주세요";
var admdepterror = "소속부서가 배치 되지 않았습니다. \n총괄팀에 연락해보세요";
var repasswderror = "비밀번호가 다릅니다";
var nameerror = "이름을 입력하세요";
var telerror = "전화번호를 입력하세요";
var emailerror = "전화번호를 입력하세요";
var emailfmterror = "이메일 형식에 맞지 않습니다";
var emailconfirmerror = "이메일 인증을 해 주세요";
var onlynum = "숫자만 입력 가능합니다.";
var idshorterror = "아이디는 6자 이상만 가능합니다.";
var email1='naver.com';
var email2='daum.net';
var email3='gmail.com';
var email4='nate.com';
var passwderror = "비밀번호를 입력해 주세요";
var repasswderror = "비밀번호가 다릅니다";
var telerror = "전화번호를 입력해 주세요";
var confirmdelete = "정말 탈퇴하시겠습니까?";
var addresserror ="주소를 입력해 주세요";
var emailerror = "이메일을 입력해 주세요";
var confirmexchange = "교환 신청하시겠습니까?";
var confirmrefund = "반품 신청하시겠습니까?";
var quantityerror = "반품 수량을 입력해 주세요";
var refunderror = "반품 사유를 입력해 주세요";
var nameerror = "이름을 입력해 주세요";
var emailcheckerror = "인증코드가 틀립니다";
var selecterror = "색상과 사이즈를 선택해 주세요";

function modifyfocus() {
   modifyform.passwd.focus();
}

function modifycheck() {
    if( ! modifyform.passwd.value ) {
          alert( passwderror );
          modifyform.passwd.focus();
          return false;
       } else if( modifyform.newpasswd.value != modifyform.repasswd.value ) {
          alert( repasswderror );
          modifyform.repasswd.focus();
          return false;
       } 
           /*if( modifyform.passwd.value != modifyform.realpasswd.value ) {
               alert( passwderror );
               return false;
          
       }*/

       
       if( ! modifyform.tel.value ) {
           alert( telerror );
       } else {
       if( modifyform.tel.value.length < 10 || modifyform.tel.value.length > 11 ) {
           alert( telerror );
           modifyform.tel.focus();
           return false;         
       }
     } 

       if( ! modifyform.zipcode.value || ! modifyform.address.value ) {
          alert( addresserror );
      modifyform.address.focus();
          return false;
       }
       
       if( ! modifyform.email.value ) {
           alert( emailerror );
       } else {        
   if( modifyform.email.value.indexOf("@") == -1 || 
modifyform.email.value.indexOf(".") == -1 ){
               alert( emailfmterror );
           } 
       }
    }



function checkaddress() {
   open( "findZip.jsp", "search window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=500px, height=500px" );
  
}
function confirmDeal(dealcode){
  
}
function selectval( refundform ) {
    var value = refundform.refundReason.selectedIndex;
    switch( value ) {
       case 0:
          refundform.reason.value = '';
         break;
       case 1:
         refundform.reason.value = '색상 및 사이즈 변경';
         refundform.reasonbcs.value = '구매자';
          break;
      case 2:
         refundform.reason.value = '서비스 및 상품 불만족';
         refundform.reasonbcs.value = '구매자';
          break;
      case 3:
         refundform.reason.value = '상품 하자';
         refundform.reasonbcs.value = '판매자';
          break;
      case 4:
         refundform.reason.value = '오배송';
         refundform.reasonbcs.value = '판매자';
          break;
   }
    return true;
    }
function check(){
    cbox = orderdetailform.chk;
    if(cbox.length) {  // 여러 개일 경우
        for(var i = 0; i<cbox.length;i++) {
            cbox[i].checked=orderdetailform.all.checked;
        }
    } else { // 한 개일 경우
        cbox.checked=orderdetailform.all.checked;
    }
}
function checkbasket(){
    cbox = basketform.chk;
    if(cbox.length) {  // 여러 개일 경우
        for(var i = 0; i<cbox.length;i++) {
            cbox[i].checked=basketform.all.checked;
        }
    } else { // 한 개일 경우
        cbox.checked=basketform.all.checked;
    }
    var sizes = document.getElementById("sz");
    var size = sizes.options[sizes.selectedIndex].value;
    
    var colors = document.getElementById("cl");
    var color = colors.options[colors.selectedIndex].value;
    
    if( size == -1 || color == -1 ) {
        alert( selecterror );
        return false;
    }

}
   function goodInputCheck(){
      if(!document.goodInputform.size.value){
         alert("사이즈를 입력해주세요");
         return false;
      }
      if(!document.goodInputform.style.value){
         alert("스타일을 체크해주세요");
         return false;
      }
      if(!document.goodInputform.product_name.value){
         alert("제품명을 입력해주세요");
         return false;
      }
      if(!document.goodInputform.buyer_code.value){
         alert("구매처를 추가해주세요");
         return false;
      }
      if(!document.goodInputform.color.value){
         alert("색상을 선택해주세요");
         return false;
      }
      if(!document.goodInputform.price.value){
         alert("가격을 입력해주세요");
         return false;
      }
      if(!document.goodInputform.sale.value){
         alert("할인율을 입력하세요");
         return false;
      }
      if(!document.goodInputform.category.value){
         alert("카테고리를 선택하세요");
         return false;
      }
   }
   function refunddetail(good_code) {
      
      open( "orderRefundDetail.jk?good_code="+good_code, "search window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=1000px, height=500px" );
   }
  
  
  
   function refund() {
      
      if( confirm( confirmrefund ) ) {
         if( ! refundform.quantity.value ) {
            alert( quantityerror );
            return false;
         } else {
            if( ( refundform.quantity.value >  refundform.same.value )
                  || ( refundform.quantity.value == 0 ) ) {
               alert( quantityerror );
               return false;
            } else {  
               var value = refundform.refundReason.selectedIndex;
                  if( ! value ) {
                     alert( refunderror );
                  return false;
                  }
            }
         }
      window.opener.location.href="orderFind.jsp";
      self.close();
      }
}
  
   function refundcheck() {
      refundform.quantity.focus();
   }
  
   function paycheck() {
      if( orderinsertform.tel1.value || orderinsertform.tel2.value || orderinsertform.tel3.value ) {
         if( orderinsertform.tel1.value.length < 3
               || orderinsertform.tel2.value.length < 3  
               || orderinsertform.tel3.value.length < 4 ) {
               alert( telerror );
               orderinsertform.tel1.focus();
               return false;
            } else if( ! orderinsertform.zipcode1.value || ! orderinsertform.zipcode2.value || ! orderinsertform.address.value ) {
               alert( addresserror );
               return false;
            } else if( ! orderinsertform.name.value ) {
               alert( nameerror );
               return false;
            } else {
               location.href="orderFind.jsp";
            }
         } else {
            alert( telerror );
            return false;
         }
   }
  
   function onoff( v, id ){
      if(v == "2"){
         document.getElementById("first").style.display = "none"
         document.getElementById("second").style.display = ""; // 보여줌
         //document.getElementById("first").style.display = "none"
      }else{
         //var old = $(".first").html();
         //var old = document.getElementById("first");
         document.getElementById("second").style.display = "none"// 숨김";
         //$( "#first" ).reload(window.location.href + "orderInsertForm.jsp" );
         //$('#area').load(document.URL + ' #first');
         window.location.reload();
         document.getElementById("first").style.display = ""; // 보여줌
      }
   }
   function findUserZip() {
      var url = "findZip.jk";
      open( url, "search window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=500, height=600" );
   }
   function confirmid() {
      var url = "confirmId.jk?id=" + admInputform.id.value;
      open( url, "confirm window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=500px, height=300px" );
   }
   function userConfirmid(){
      var url="userConfirmId.jk";
      open(url, "confirmwindow", "toolbar=no, scrollbar=no, status=no, menubar=no, width=500px, height=300px");
   }
   function setAddress(zipcode, area3){
      opener.document.inputform.address.value=area3;
      var zips = zipcode.split('-');
      opener.document.inputform.zipcode1.value=zips[0];
      opener.document.inputform.zipcode2.value=zips[1];
      self.close();
   }
  
  
/*admMain*/
function loginfocus() {
   loginform.id.focus();
}
function logincheck() {
   if( ! loginform.id.value ) {
      alert( iderror );
      loginform.id.focus();
      return false;
   } else if( ! loginform.passwd.value ) {
      alert( passwderror );
      loginform.passwd.focus();
      return false;
   }
}
function admFindPasswd() {
  
}

function confirmmail(){      // 메일 확인
   if( admInputform.email.value.indexOf( "@" ) == -1 ) {
      alert( emailfmterror );
      return false;
   }
   var url = "mailCheck.jk?email="+admInputform.email.value;
   var popOption = "width=370, height=250, resizable=no, scrollbars=no, status=no";
      open(url,"",popOption);
}
function confirmMail(){
   if(inputform.email.value.indexOf("@")==-1){
      alert(emailfmterror);
      return false;
   }
   var url = "userMailCheck.jk?email="+inputform.email.value;
   var popOption = "width=370, height=250, resizable=no, status=no";
   open(url,"",popOption);
}
function admInputcheck() {      
/*   if( admInputform.confirm.value == 0 ) {
      alert( confirmerror );
      admInputform.confirm.focus();
      return false;
   }*/
   if( admInputform.emailconfirm.value == 0 ) {      // 이메일 인증 안하면 못 넘어가게
      alert( emailconfirmerror );
      admInputform.emailconfirm.focus();
      return false;
   }
   if( ! admInputform.id.value ) {
      alert( iderror );
      admInputform.id.focus();
      return false;
   } else if( ! admInputform.passwd.value ) {
      alert( passwderror );
      admInputform.passwd.focus();
      return false;
   } else if( admInputform.passwd.value != admInputform.repasswd.value ) {
      alert( repasswderror );
      admInputform.repasswd.focus();
      return false;
   } else if( ! admInputform.name.value ) {
      alert( nameerror );
      admInputform.name.focus();
      return false;
   } else if( ! admInputform.tel.value ) {
      alert( telerror );
      admInputform.tel.focus();
      return false;
   } else if( ! admInputform.email.value ) {
      alert( emailerror );
      return false;
   } else if( admInputform.email.value.indexOf( "@" ) == -1 ) {
      alert( emailfmterror );
      return false;
   }
}
function emailwrite() {//email에 @누르면 이메일 자동완성 기능
   if(event.keyCode =='@'){
      
   }
}
var editingKeycodes = [8, 46, 37, 39];   // 숫자키 외에 수정시에 필요한 백스페이스(8), 딜리트(46), 왼오른 화살표(37,39)
function numberonly( event, form ) {      // 숫자만 입력이 가능하게 하는 메소드
   var kc = event.keyCode;
   if( ( kc >= 48 && kc <= 57) || ( kc >= 96 && kc <= 105) || editingKeycodes.indexOf(kc) != -1 ) {
      // 일반숫자키코드 48~57         // 숫자키패드키코드 96~105      // 수정시에 필요한 키코드에 포함되었는가?
      return;
   } else {
      alert( onlynum );
      form.tel.value = form.tel.value.substr(0, form.tel.value.length-1);
      return false;
   }
}
/*confirmId*/
function confirmcheck() {
   if( ! confirmform.id.value ) {
      alert( iderror );
      confirmfocus();
      return false;
   }else if( confirmform.id.value.length>5){
      alert(idlongerror);
      confirmfocus();
      return false;
   }
}
function confirmfocus(){
   confirmform.id.focus();
}
function setcancel() {
      self.close();
}
function setid(id){
   opener.document.admInputform.id.value = id;
   self.close();
}
function setuserid(id){
   opener.document.inputform.id.value=id;
   self.close();
}
function confirmCheck() {
   if( ! confirmform.id.value ) {
      alert( iderror );
      confirmfocus();
      return false;
   }else if( confirmform.id.value.length<6){
      alert(idshorterror);
      confirmfocus();
      return false;
   }
}
//mailcheck
function mailconfirm(){
    if( usermailform.mailnum.value != usermailform.emailcode.value ) {
        alert( emailcheckerror );
    } else{
        alert( "인증 완료되었습니다" );
        self.close();
    }
}

function mailConfirm(){
    if( admailform.mailnum.value != admailform.emailcode.value ) {
        alert( emailcheckerror );
    } else{
        alert( "인증 완료되었습니다" );
        self.close();
    }
}

/*admMypage*/
function admModcheck() {
   if( ! admModform.passwd.value ) {
      alert( passwderror );
      admModform.passwd.focus();
      return false;
   } else if( admModform.passwd.value != admModform.repasswd.value ) {
      alert( repasswderror );
      admModform.repasswd.focus();
      return false;
   } else if( ! admModform.name.value ) {
      alert( nameerror );
      admModform.name.focus();
      return false;
   } else if( ! admModform.tel.value ) {
      alert( telerror );
      admModform.tel.focus();
      return false;
   } else if( ! admModform.email.value ) {
      alert( emailerror );
      return false;
   } else if( admModform.email.value.indexOf( "@" ) == -1 ) {
      alert( emailfmterror );
      return false;
   }
}
   // 위쪽에 정의된 numberonly(event, form) 메소드도 씀

//searchBuyer
function searchBuyer(){
   var url = "searchBuyer.jk";
   var popOption = "width=370, height=250, resizable=no, scrollbars=no, status=no;";
      open(url,"",popOption);
}
//selectBuyer
function selectBuyer(name, code){
   opener.document.goodInputform.buyer_name.value = name;
   opener.document.goodInputform.buyer_code.value = code;
   self.close();
}
//goodcode
function mergeGoodcode(){
   var colorselect = document.getElementById("cl");
   var color = colorselect.options[colorselect.selectedIndex].value;
  
   var ref = document.gooddetailform.reff.value;
  
   var sizeselect = document.getElementById("sz");
   var size = sizeselect.options[sizeselect.selectedIndex].value;
  
   var goodcode = color + + ref + size;
   document.gooddetailform.goodcode.value = goodcode;
  
}
function chatting() {
   open( "user/chatting.jsp", "search window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=300px, height=340px" );
}
function inputCheck() {
   if( inputform.email.value == 0 ) {      // 이메일 인증 안하면 못 넘어가게
      alert( emailconfirmerror );
      inputform.email.focus();
      return false;
   }
   if( ! inputform.id.value ) {
      alert( iderror );
      inputform.id.focus();
      return false;
   } else if( ! inputform.passwd.value ) {
      alert( passwderror );
      inputform.passwd.focus();
      return false;
   } else if( inputform.passwd.value != inputform.repasswd.value ) {
      alert( repasswderror );
      inputform.repasswd.focus();
      return false;
   } else if( ! inputform.name.value ) {
      alert( nameerror );
      inputform.name.focus();
      return false;
   } else if( ! inputform.tel.value ) {
      alert( telerror );
      inputform.tel.focus();
      return false;
   } else if( ! inputform.email.value ) {
      alert( emailerror );
      return false;
   } else if( inputform.email.value.indexOf( "@" ) == -1 ) {
      alert( emailfmterror );
      return false;
   } else if( ! inputform.zipcode1.value || ! inputform.zipcode2.value || ! inputform.address.value ) {
      alert( addresserror );
      return false;
   }
  
   if( inputform.tel.value.length < 10 ) {
            alert( telerror );
            inputform.tel.focus();
            return false;         
      }
 
}
function chatting() {
      open( "user/chatting.jsp", "search window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=350px, height=400px" );
   }
   function admChatting( id ) {
      open( "admin/chattingAdm.jsp?receiver=" + id, "search window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=350px, height=400px" );
   }
   function messagefocus() {
      msgInputForm.message.focus();
   }
   function enterChat(id){
        if(event.keyCode == 13){
           messagefocus();
        }
   }
  

