function signupForm_check() {
    const form = document.signup_form;
    //변수에 담아주기
    const pwd = form.pwd;
    const repwd = form.repwd;
    const uname = form.uname;
    const email_id = form.email_id;

    if (email_id.value == "" ) {
        alert("이메일 주소를 입력하세요.");
        email_id.focus();
        return;
    }

    if (pwd.value == "") {
        alert("비밀번호를 입력하세요.");
        pwd.focus();
        return;
    }

    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

    if (!pwdCheck.test(pwd.value)) {
        alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
        pwd.focus();
        return;
    }

    if (repwd.value !== pwd.value) {
        alert("비밀번호가 일치하지 않습니다.");
        repwd.focus();
        return;
    }

    if (uname.value == "") {
        alert("닉네임을 입력하세요.");
        uname.focus();
        return;
    }
    //입력 값 전송
    form.submit(); //유효성 검사의 포인트
}