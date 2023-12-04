function loginform_check(){
    var uid = document.getElementById('id');
    var error_id =  document.getElementById('idError');

    var pwd = document.getElementById('pw');
    var error_pwd =  document.getElementById('pwError');

    var login_keep =document.getElementById('login_keep');

    if (uid.value == "") {
        error_id.innerHTML = '아이디를 입력하세요.'
        uid.style.boxShadow = "0px 0px 7px 0px red";
        // uid.focus();
        return false;

    }
    else if(uid.value !=""){
        uid.style.boxShadow = "0px 0px 0px 0px  #dbdbdb";
        error_id.innerHTML = ''
    }

    if (pwd.value == "") {
        error_pwd.innerHTML = '비밀번호를 입력하세요.'
        pwd.style.boxShadow = "0px 0px 7px 0px red";
        // pwd.focus();
        return false;
    }

    else if(pwd.value !=""){
        pwd.style.boxShadow = "0px 0px 7px 0px  #dbdbdb";
        error_pwd.innerHTML = ''
    }
return true;
}


/*ajax 이용한 로그인 기능 구현하려고했는데 보드게시판에서 로그인갈시 다시 보드게시판 돌아가는 걸 구현하는거에서 오류가발생함
 그리고 쿠키를 생성하려면 서버에서도 선언하고 그걸 ajax 선언한곳 브라우저에서도 한번더 선언해야지 브라우저에서 알아들어서 이것대로 불편한것같음.*/
// var uid = document.getElementById('id');
// var error_id =  document.getElementById('idError');
//
// var pwd = document.getElementById('pw');
// var error_pwd =  document.getElementById('pwError');
//
// var login_keep =document.getElementById('login_keep');
//
// // 'id' 입력 필드에 대한 blur 이벤트 리스너 추가
// uid.addEventListener("focus",function (){
//     if (uid.value === "") {
//         error_id.innerHTML = '아이디를 입력하세요.';
//         uid.style.boxShadow = "0px 0px 7px 0px red";
//     }
// });
// uid.addEventListener('blur', function() {
//     if(uid.value != "") {
//         uid.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
//         error_id.innerHTML = '';
//         pwd.focus();
//     }
// });
// pwd.addEventListener("focus",function (){
//     if (pwd.value === "") {
//         error_pwd.innerHTML = '비밀번호를 입력하세요.';
//         pwd.style.boxShadow = "0px 0px 7px 0px red";
//         // return false;
//     }
// });
// pwd.addEventListener('blur', function() {
//     if(pwd.value != "") {
//         pwd.style.boxShadow = "0px 0px 7px 0px #dbdbdb";
//         error_pwd.innerHTML = '';
//     }
// });
//
//
// function loginform_check() {
//
//     var id = $("#id").val();
//     var pwd = $("#pw").val();
//     $.ajax({
//         type: "POST",
//         url: "/app/login/login",
//         data: {id:id, pwd:pwd},
//         success: function (data) {
//             // 성공 시
//             if(data == 'false') {
//             alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.') ;
//             window.location.href = "/app/login/login"
//             }
//             else if(data == 'true'){
//             alert('로그인 되었습니다.') ;
//             window.location.href = "/app/";
//             }
//
//             // 서버로부터 받은 응답을 기반으로 쿠키 저장
//             document.cookie = "id=" + id + "; path=/";
//             document.cookie = "pwd=" + pwd + "; path=/";
//
//             // 'login_keep' checkbox 체크 여부 확인
//             if (!login_keep) {
//                 // checkbox가 체크되지 않았을 때, 쿠키 삭제
//                 document.cookie = "id=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
//                 document.cookie = "pwd=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
//             }
//         },
//         error: function (error)
//             // 실패 시
//             { alert("로그인 요청에 실패하였습니다."); }
//             // 여기에서 로그인 페이지에 머무를 수 있습니다.
//     });
//
//     // 폼이 서버로 전송되지 않도록 false를 반환합니다.
//     return false;
// }



/* url msg 를 띄워준게 창을 새롭게 띄워주면서 alert 창에 메세지가 나오면서 띄워주게 할수있다. <- 이 코드는 js파일 따로 만들어서 이동되는 페이지 마다 외부스트립트 파일로 선언해주고있음 왜냐면 이동하는 페이지마다 해당 url에 찍힌 msg를 읽어와서 alert창을 띄워주는거라 아래코드가 이동된 페이지마다 각각 선언되어야한다.  */

// document.addEventListener('DOMContentLoaded', function() {
//     // URL에서 'msg' 파라미터 값 가져오기
//     var urlParams = new URLSearchParams(window.location.search);
//     var msgParam = urlParams.get('msg');
//
//     // 'msg' 파라미터 값이 있다면 alert 창 띄우기
//     if (msgParam !== null) {
//         alert(decodeURIComponent(msgParam));

// 'msg' 파라미터를 삭제하여 새로고침시에 더 이상 띄우지 않도록 함
// var newUrl = window.location.pathname + '?' + urlParams.toString();
// window.history.replaceState({}, document.title, newUrl);
//     }
// });






