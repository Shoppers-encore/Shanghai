
//Error
var inserterror = "글쓰기에 실패했습니다.\n잠시 후 다시 시도하세요.";
var iderror = "아이디를 입력하세요";
var passwderror = "비밀번호를 입력하세요";







//Function
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

