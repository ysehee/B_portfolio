function submit_change_user_info(){
    var now_pwd = document.getElementById("now_password");
    var new_pwd = document.getElementById("new_password");
    var new_pwd_chk = document.getElementById("new_password_chk");

    var error_new_pwd =  document.getElementById('new_pwError');
    var error_new_repwd =  document.getElementById('new_pwCheckError');
    //비밀번호 영문자+숫자+특수조합(8~25자리 입력)
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

    var new_phonenum = document.getElementById("new_phonenum");
    var phoneError = document.getElementById("phoneError");

    /*이메일 userEmail 에 value값으로  하나로 모아서 보내기 시작*/
    var email_id = document.getElementById("email_id");
    var email_add = document.getElementById("email_add");
    var userEmail = document.getElementById("userEmail");
    var emailError = document.getElementById("emailError");

    /* 이메일 앞뒤 입력란 값을 하나의 변수에 담아서 url로보내준거임 */
    var error_eamail = document.getElementById('emailError');

    var userEmailValue = email_id.value + "@" + email_add.value;

    // 조합된 값을 hidden input 요소에 할당
    userEmail.value = userEmailValue.trim();
    /*이메일 userEmail 에 value값으로  하나로 모아서 보내기 끝*/

    if (new_pwd.value === "") {
        error_new_pwd.innerHTML = '비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.';
        new_pwd.style.boxShadow = "0px 0px 7px 0px red";
        return false;


    } else if (!pwdCheck.test(new_pwd.value)) {
        error_new_pwd.innerHTML = '비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.';
        new_pwd.style.boxShadow = "0px 0px 7px 0px red";
        return false;

    } else if (new_pwd.value == now_pwd.value) {
        error_new_pwd.innerHTML = '현재 비밀번호와 다르게 입력하세요.';
        new_pwd.style.boxShadow = "0px 0px 7px 0px red";
        return false;

    } else {
        error_new_pwd.innerHTML = '';
        new_pwd.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
    }

    if (new_pwd.value !== new_pwd_chk.value) {
        error_new_repwd.innerHTML = '비밀번호가 일치하지 않습니다.'
        new_pwd_chk.style.boxShadow = "0px 0px 7px 0px red";

        return false;
    }
    else {
        error_new_repwd.innerHTML = ''
        new_pwd_chk.style.boxShadow = "0px 0px 0px 0px #dbdbdb";

    }
    /* 폰번호 빈칸   */
    if (new_phonenum.value === "") {
        phoneError.innerHTML = '번호를 입력해주세요.'
        new_phonenum.style.boxShadow = "0px 0px 7px 0px red";

        return false;
    } else {
        phoneError.innerHTML = ''
        new_phonenum.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
    }

    /*이메일 빈칸*/
    if (email_id.value === "") {
        emailError.innerHTML = '이메일을 입력해주세요'
        email_id.style.boxShadow = "0px 0px 7px 0px red";
        return false;
    } else {
        emailError.innerHTML = ''
        email_id.style.boxShadow = "0px 0px 0px 0px #dbdbdb";

    }

    if (email_add.value === "") {
        emailError.innerHTML = '이메일을 입력해주세요'
        email_add.style.boxShadow = "0px 0px 7px 0px red";
        return false;
    } else {
        emailError.innerHTML = ''
        email_add.style.boxShadow = "0px 0px 0px 0px #dbdbdb";


    }

    return true;
}


/*아래 제이쿼리 사용시*/
$(document).ready(function () {
    let frm = $("#change_user_info_form");

    /* 수정하기버튼 눌렀을떄 시작*/
    $("#btn_modify").on("click", function () {

        let isReadOnly = $('input[name="userPw"]').attr('readonly');

        if (isReadOnly == "readonly") {
            $('input[name="userPw"]').attr('readonly', false);
            $('input[name="new_password_chk"]').attr('readonly', false);
            $('input[name="userPhoneNo"]').attr('readonly', false);
            // $('input[name="userEmail"]').attr('readonly', false);
            $('input[id="email_id"]').attr('readonly', false);
            $('input[id="email_add"]').attr('readonly', false);
            $('select[id="email_sel"]').attr('disabled', false);

            $('.pw_display').css("display", "block");
            $('#btn_modify').text("변경하기");
            $('#modify_out').css("display", "none");
            $('#modify_back').css("display", "block");

            $('#modify_title').text("회원정보 변경");
            $('#modify_pw').text("비밀번호 변경");
            $('#modify_phone').text("핸드폰번호 변경");
            $('#modify_email').text("이메일 변경");

            // $("#new_phonenum").val("");  // 전화번호 초기화
            // $("#new_email").val("");     // 이메일 초기화

            return;

        }

        frm.attr('action', modifyAddUrl);
        frm.attr('method', 'post');
        frm.submit();

    });
    /* 수정하기버튼 눌렀을떄 끝*/
    
    // 회원탈퇴 버튼 클릭시 모달창 보여주기
    $("#modify_out").click(function() {
        $("#delete_user_info_modal").show();
    });

    // 모달창 취소 버튼 클릭시 모달창 닫기
    $("#delete_user_info_modal .btn-secondary").click(function() {
        $("#delete_user_info_modal").hide();
    });

    // 모달창 회원탈퇴 버튼 클릭시 회원탈퇴 처리 시작
    $("#delete_user_info_modal .btn-primary").click(function() {
        // 비밀번호 확인
        var userPw = $("#userPw").val();

        $.ajax({
            url: "app/user/checkPw",
            type: "POST",
            data: {
                userPw: userPw
            },
            success: function(data) {
                if (data == "Y") {
                    // 회원탈퇴 처리
                    $.ajax({
                        url: "app/user/delete",
                        type: "POST",
                        data: {},
                        success: function(data) {
                            // 회원탈퇴 완료
                            alert("회원탈퇴 처리가 완료되었습니다.");
                            // 모달창 닫기
                            $("#delete_user_info_modal").hide();
                            // 로그인 화면으로 이동
                            window.location.href = "/app/";
                        }
                    });
                } else {
                    // 비밀번호 불일치
                    alert("비밀번호가 일치하지 않습니다.");
                }
            }
        });
    });
    // 모달창 회원탈퇴 버튼 클릭시 회원탈퇴 처리 끝
    
        /*회원정보 수정 돌아가기 버튼 눌렀을떄 시작*/
        $("#modify_back").on("click",function (){
            window.location.href ="/app/mypage";
        });
        /*회원정보 수정 돌아가기 버튼 눌렀을떄 끝*/

    /* mypage내 돌아가기 버튼 눌렀을떄 시작*/
    $("#accompany_back").on("click", function () {
        // // 이전 페이지로 이동
        // history.back();
        /* mypage 첫화면으로 이동 */
        window.location.href ="/app/mypage";
    });
    /*mypage내 돌아가기 버튼 눌렀을떄 끝*/

    /* 탭메뉴 시작*/
    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
        $('ul.tabs li').removeClass('current');
        $('ul.tabs li').removeClass('mypage_active');
        $('.tab-content').removeClass('current');
        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
        $(this).addClass("mypage_active");
    })
    /* 탭메뉴 끝 */
});
function change_email() {
    var email_add = document.getElementById("email_add");
    var email_sel = document.getElementById("email_sel");

    //지금 골라진 옵션의 순서와 값 구하기
    var idx = email_sel.options.selectedIndex;
    var val = email_sel.options[idx].value;

    email_add.value = val;
}
