function findSubmitId(){
    var find_name = document.getElementById('name');
    var name_Error =  document.getElementById('name_Error');

    var find_email = document.getElementById('email');
    var email_Error =  document.getElementById('email_Error');

    if (find_name.value == "") {
        name_Error.innerHTML = '이름을 입력하세요.'
        find_name.style.boxShadow = "0px 0px 7px 0px red";
        // uid.focus();
        return false;

    }
    else if(find_name.value !=""){
        find_name.style.boxShadow = "0px 0px 0px 0px  #dbdbdb";
        name_Error.innerHTML = ''
    }

    if (find_email.value == "") {
        email_Error.innerHTML = '이메일을 입력하세요.'
        find_email.style.boxShadow = "0px 0px 7px 0px red";
        // pwd.focus();
        return false;
    }

    else if(find_email.value !=""){
        find_email.style.boxShadow = "0px 0px 7px 0px  #dbdbdb";
        email_Error.innerHTML = ''
    }
return true;
}


function findSubmitPw(){
    var find_id = document.getElementById('id');
    var id_Error =  document.getElementById('id_Error');

    var find_name = document.getElementById('name');
    var name_Error =  document.getElementById('name_Error');

    var find_email = document.getElementById('email');
    var email_Error =  document.getElementById('email_Error');

    if (find_id.value == "") {
        id_Error.innerHTML = '아이디를 입력하세요.'

        find_id.style.boxShadow = "0px 0px 7px 0px red";
        return false;

    }
    else if(find_id.value !=""){
        find_id.style.boxShadow = "0px 0px 0px 0px  #dbdbdb";
        id_Error.innerHTML = ''
    }

    if (find_name.value == "") {
        name_Error.innerHTML = '이름을 입력하세요.'
        find_name.style.boxShadow = "0px 0px 7px 0px red";
        // uid.focus();
        return false;

    }
    else if(find_name.value !=""){
        find_name.style.boxShadow = "0px 0px 0px 0px  #dbdbdb";
        name_Error.innerHTML = ''
    }

    if (find_email.value == "") {
        email_Error.innerHTML = '이메일을 입력하세요.'
        find_email.style.boxShadow = "0px 0px 7px 0px red";
        // pwd.focus();
        return false;
    }

    else if(find_email.value !=""){
        find_email.style.boxShadow = "0px 0px 7px 0px  #dbdbdb";
        email_Error.innerHTML = ''
    }
    return true;
}

