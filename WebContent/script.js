
var iderror = "아이디를 입력하세요";
var passwderror = "비밀번호를 입력하세요";


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