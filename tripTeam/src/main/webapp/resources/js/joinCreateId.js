
    function joinform_check(){
        
        var uid = document.getElementById('id');
        var error_id =  document.getElementById('idError');

        var pwd = document.getElementById('pw');
        var error_pwd =  document.getElementById('pwError');

        var repwd = document.getElementById('pwCheck');
        var error_repwd =  document.getElementById
        ('pwCheckError');

        var name = document.getElementById('nameCheck');
        var error_name = document.getElementById('nameCheckError');

        var gender_id = document.getElementById('gender_sel');
        var error_gender = document.getElementById('genderError');

        var birth = document.getElementById('birth');
        var error_birth =  document.getElementById('birthError');

        var phoneNo = document.getElementById('phoneNo');
        var error_phoneNo = document.getElementById('phoneNoError');

        var email_id = document.getElementById("email_id");
        var email_add = document.getElementById("email_add");
        var userEmail = document.getElementById("userEmail");

        /* 이메일 앞뒤 입력란 값을 하나의 변수에 담아서 url로보내준거임 */
        var error_eamail =  document.getElementById('emailError');

        var userEmailValue = email_id.value + "@" + email_add.value;

        // 조합된 값을 hidden input 요소에 할당
        userEmail.value = userEmailValue.trim();


       if (uid.value == "") {
            error_id.innerHTML = '아이디를 입력하세요.'
            uid.style.boxShadow = "0px 0px 7px 0px red";

            return false;
        }
       else if(uid.value !=""){

           uid.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
           error_id.innerHTML = ''
       }

        var idCheck = /^[A-Za-z]{1}[A-Za-z0-9]{3,15}$/g;
        if (!idCheck.test(uid.value)) {
            error_id.innerHTML = '영문자로 시작하는 4~15글자 영문자-숫자 입력해야 합니다.'

            uid.style.boxShadow = "0px 0px 7px 0px red";
            error_id.style.color = "red";
            error_pwd.innerHTML = ''
            return false;
        }
        else if(idCheck.test(uid.value)){
            uid.blur();
            error_pwd.innerHTML = ''
        }


        if (pwd.value == "") {;
            error_pwd.innerHTML = '비밀번호를 입력하세요.'
            pwd.style.boxShadow = "0px 0px 7px 0px red";

            return false;
        }
        else if(pwd.value !=""){

            pwd.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
            error_pwd.innerHTML = ''

        }

        //비밀번호 영문자+숫자+특수조합(8~25자리 입력)
        var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

        if (!pwdCheck.test(pwd.value)) {
            error_pwd.innerHTML = '영문자+숫자+특수문자 조합으로 8~25자리 입력해야 합니다.'
            pwd.style.boxShadow = "0px 0px 7px 0px red";

            return false;
        }
        else if(pwdCheck.test(pwd.value)){
            pwd.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
            error_pwd.innerHTML = ''
        }


        if (repwd.value !== pwd.value) {
            error_repwd.innerHTML = '비밀번호가 일치하지 않습니다.'
            repwd.style.boxShadow = "0px 0px 7px 0px red";

            return false;
        }
        else if(repwd.value == pwd.value){
            repwd.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
            error_repwd.innerHTML = ''
        }

        if(name.value == ""){
            error_name.innerHTML = '이름을 입력하세요.'
            name.style.boxShadow = "0px 0px 7px 0px red";

            return false;
            
        }
        else if(name.value != ""){
            name.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
            error_name.innerHTML = ''
        }

            if (gender_id.value == "") {
                gender_id.style.boxShadow = "0px 0px 7px 0px red";
                error_gender.innerHTML = '성별을 선택하세요.';

                return false;
            } else if (gender_id.value != "") {
                gender_id.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
                error_gender.innerHTML = '';

            }

        if (birth.value == "") {
            error_birth.innerHTML = '생년월일을 입력하세요'
            birth.style.boxShadow = "0px 0px 7px 0px red";


            return false;
        }
        else if(birth.value !=""){
            birth.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
            error_birth.innerHTML = ''
        }

        if (phoneNo.value == "") {
            phoneNo.style.boxShadow = "0px 0px 7px 0px red";
            error_phoneNo.innerHTML = '핸드폰 번호를 입력하세요.'

            return false;
        }
        else if(phoneNo.value !=""){
            phoneNo.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
            error_phoneNo.innerHTML = ''
        }

        if (email_id.value == "") {
            email_id.style.boxShadow = "0px 0px 7px 0px red";
            error_eamail.innerHTML = '이메일을 입력하세요.'
            return false;
        }
        else if(email_id.value != ""){
            email_id.style.boxShadow = "0px 0px 0px 0px #dbdbdb";
            error_eamail.innerHTML = ''
        }

        if (email_add.value === "") {
            error_eamail.innerHTML = '이메일을 입력하세요'
            email_add.style.boxShadow = "0px 0px 7px 0px red";
            return false;
        } else if(email_add.value != ""){
            error_eamail.innerHTML = ''
            email_add.style.boxShadow = "0px 0px 0px 0px #dbdbdb";


        }

        return true;
    }

        //이메일 옵션 선택후 주소 자동 완성
        function change_email() {
        var email_add = document.getElementById("email_add");
        var email_sel = document.getElementById("email_sel");

        //지금 골라진 옵션의 순서와 값 구하기
        var idx = email_sel.options.selectedIndex;
        var val = email_sel.options[idx].value;

        email_add.value = val;
        }


    /* 여러가지 해볼 ajax 코드*/
    var isIdAvailable = false;

    function checkUseId() {
        let member_id = $("#id").val();
        $.ajax({
            type: 'post',
            url: "/app/checkId",
            data: { "member_id": member_id },
            success: function (data) {
                if (data == "N") {
                    result = "사용 가능한 아이디입니다.";
                    $("#idError").html(result).css("color", "green");
                    // $("#pw").trigger("focus");

                    // 중복 검사 결과를 저
                    isIdAvailable = true;
                } else {
                    result = "이미 사용중인 아이디입니다.";
                    $("#idError").html(result).css("color", "red");
                    $("#id").trigger("focus");

                    // 중복 검사 결과를 저장
                    isIdAvailable = false;
                }
            },
            error: function (error) { alert(error); }
        });
    }

    // 중복 검사 버튼 클릭하면 발생하는 이벤트 핸들러
    $("#checkDuplicateBtn").click(function () {
        checkUseId();
    });

    /* 이렇게 1개씩 확인해서 alert창 띄워줘도됨*/
    $("#ioin").submit(function (event) {
        var userId = $("#id").val();

        // 중복 검사 결과를 확인하고, 중복이 아닌 경우에만 폼 제출
        if (isIdAvailable) {
            // 여기에서 필요한 추가적인 처리를 수행할 수 있습니다.

            // 비밀번호, 이메일 입력 여부 확인
            var isValid = true;
            // var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
            if ($("#pw").val() === "") {
                isValid = false;
                alert("비밀번호를 입력하세요.");
                return;
            }
            if ($("#pw").val() !== "" && !isPwdValid($("#pw").val())) {
                alert("영문자+숫자+특수문자 조합으로 8~25자리 입력해야 합니다.");
                isValid =false;
                $("#pw").focus();
                return;
            }
            function isPwdValid(pw) {
                return /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw);
            }
            /**/
            if ($("#pwCheck").val() !== $("#pw").val()) {
                alert('비밀번호가 일치하지 않습니다.');
                isValid =false;
                $("#pwCheck").focus();
                return;
            }
            /**/
            if ($("#nameCheck").val() === "") {
                isValid = false;
                alert("이름을 입력하세요.");
                return;
            }
            if ($("#gender_sel").val() === null) {
                isValid = false;
                alert("성별을 입력하세요.");
                return;
            }
            if ($("#birth").val() === "") {
                isValid = false;
                alert("생년월일을 입력하세요.");
                return;
            }
            if ($("#phoneNo").val() === "") {
                isValid = false;
                alert("핸드폰번호를 입력하세요.");
                return;
            }
            if ($("#email_id").val() === "") {
                isValid = false;
                alert("이메일을 입력하세요.");
                return;
            }
            if ($("#email_add").val() === "") {
                isValid = false;
                alert("이메일을 입력하세요.");
                return;
            }

            if (!isValid) {
                event.preventDefault();
            } else {
                alert("회원가입이 완료되었습니다.");
                window.location.href ="app/";
            }
        } else {
            event.preventDefault();
            alert("아이디 중복 검사를 수행하세요.");
        }
    });


    // 각 입력 필드의 엔터키 이벤트 핸들러 등록
    $(".Check").on("keydown", function (event) {
        if (event.keyCode === 13) {
            // 엔터키를 눌렀을 경우, 이벤트를 무시합니다.
            event.preventDefault();
        }
    });


    // 회원가입 폼 제출 시
    /*$("#ioin").submit(function (event) {
        var userId = $("#id").val();

        // 중복 검사 결과를 확인하고, 중복이 아닌 경우에만 폼 제출
        if (isIdAvailable) {
            // 모든 입력 필드의 value 값 확인 1
            // var isValid = true;
            // $(".Check").each(function () {
            //     if ($(this).val() === "") {
            //         isValid = false;
            //         $(this).focus();
            //     }
            // });

            // 모든 입력 필드의 value 값 확인 2
            var isValid = true;
            for (var i = 0; i < $(".Check").length; i++) {
                if ($(".Check")[i].value === "") {
                    isValid = false;
                    $(".Check")[i].focus();
                }
            }

            if (!isValid) {
                alert("모든 입력 필드를 입력하세요.");
                /!* 아래는 위에 조건충족시 폼submit이벤트를 막는다는뜻이다. *!/
                event.preventDefault();

            } else {
                alert("회원가입이 완료되었습니다.");
                window.location.href ="app/joinCreatedId/save";
            }
        } else {
            event.preventDefault();
            alert("아이디 중복 검사를 수행하세요.");
        }
    });*/





    

