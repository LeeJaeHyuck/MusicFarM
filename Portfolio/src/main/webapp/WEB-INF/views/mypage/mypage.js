
function hover(){
	var elem = document.getElementById("v-pills-home-tab");
	elem.classList.add('active');
}

function deleteCart() {
	
	if (confirm("정말 삭제하시겠습니까??") == true) {
		document.cart.action = "delete_cart";
		document.cart.submit();
		return true;
	} else {
		return false;

	}

}
function alldeleteCart(){
	if (confirm("정말 삭제하시겠습니까??") == true) {
		document.cart.action = "all_delete_cart";
		document.cart.submit();
		return true;
	} else {
		return false;

	}
}

function go_pay_form(){
	document.cart.action="pay_form";
	document.cart.submit();
}

function change_address() {
	var url = "change_addr";
	window.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=550, height=500");
}

function member_update() {
//	if (document.sign.pwd.value == "") {
//		alert("비밀번호를 입력해주세요.");
//		document.sign.pwd.focus();
//		return false;
//	} else if (document.sign.pwdCheck.value == "") {
//		alert("비밀번호체크를 입력해주세요.");
//		document.sign.pwdCheck.focus();
//		return false;
//	} else 
	if (document.sign.pwd.value != document.sign.pwdCheck.value) {
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
		if(prompt("비밀번호를 입력해주세요.") == document.sign.pass.value){
			alert("수정되었습니다.");
		} else {
			alert("비밀번호가 틀립니다.");
			return false;
		}
	}
}