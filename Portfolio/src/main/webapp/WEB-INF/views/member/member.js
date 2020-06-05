function loginCheck() {
	var form = document.log;

	if (form.id.value == "") {
		alert("아이디를 입력해주세요.");
		form.id.focus();
		return false;
	} else if (form.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		form.pwd.focus();
		return false;
	} else {
		return true;
	}
}

function idCheck() {

	if (document.sign.id.value == "") {
		alert("아이디를 입력해주세요.");
		form.id.focus();
		return;
	}

	// 중복된 아이디를 확인하는 윈도우를 띄운다.
	var url = "id_check_form?id=" + document.sign.id.value;

	window
			.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=500, height=200");
}

function join_member() {
	if (document.sign.id.value == "") {
		alert("아이디를 입력하세요.");
		document.sign.id.focus();
		return false;
	} else if (document.sign.reid.value != document.sign.id.value) {
		alert("아이디체크를 해주세요.");
		document.sign.id.focus();
		return false;
	} else if (document.sign.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.sign.pwd.focus();
		return false;
	} else if (document.sign.pwdCheck.value == "") {
		alert("비밀번호체크를 입력해주세요.");
		document.sign.pwdCheck.focus();
		return false;
	} else if (document.sign.pwd.value != document.sign.pwdCheck.value) {
		alert("비밀번호가 다릅니다.");
		document.sign.pwdCheck.focus();
		return false;
	} else if (document.sign.name.value == "") {
		alert("이름을 입력해주세요.");
		document.sign.name.focus();
		return false;
	} else if (document.sign.regNum1.value == ""
			|| document.sign.regNum2.value == "") {
		alert("주민번호를 입력해주세요.");
		document.sign.regNum1.focus();
		return false;
	} else if (document.sign.email.value == "") {
		alert("이메일을 입력해주세요.");
		document.sign.email.focus();
		return false;
	} else if (document.sign.postNum.value == "") {
		alert("우편번호를 입력해주세요.");
		document.sign.postNum.focus();
		return false;
	} else if (document.sign.addr1.value == ""
			|| document.sign.addr2.value == "") {
		alert("주소 입력해주세요.");
		document.sign.addr1.focus();
		return false;
	} else if (document.sign.phone.value == "") {
		alert("전화번호를 입력해주세요.");
		document.sign.phone.focus();
		return false;
	} else {
		alert("회원가입이 완료되었습니다.");
		return true;
	}
}

function idok() {
	var form = document.check;
	form.action = "id_check_confirm";
	form.submit();
}

function find_addr() {
	var url = "find_addr";
	window.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=550, height=500");
}

function find_id() {
	var url = "find_id";
	window.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=500, height=350");
}

function find_pwd() {
	var url = "find_pwd";
	window.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=500, height=400");
}