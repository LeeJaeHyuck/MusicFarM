<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>SIGN UP</title>
<script type="text/javascript">
function onlyNumber(event){
    event = event || window.event;
    var length1 = document.sign.regNum1.value.length;
    var length2 = document.sign.regNum2.value.length;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9){
    	return true;
	}else{
        return false;
	}
}

function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>
<%@ include file="../header.jsp" %>
<div id="sign">
<h1>회원가입</h1>
<form action="sign_up" method="post" name="sign">

    <div class="form-group">
      <label for="inputEmail4">아이디</label><br>
      <table style="width:100%">
      <tr>
      <th style="width:80%">
      <input type="text" class="form-input" id="inputEmail4" name="id">
      <input type="hidden" name="reid">
      </th>
      <th style="text-align:center">
      <button type="button" class="btn btn-primary" onclick="idCheck()">중복확인</button>
      </th>
      </tr>
      </table>
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">비밀번호</label>
      <input type="password" class="form-control" id="inputPassword4" name="pwd">
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">비밀번호 확인</label>
      <input type="password" class="form-control" id="inputPassword4" name="pwdCheck">
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">이름</label>
      <input type="text" class="form-control" id="inputPassword4" name="name">
    </div>  
    
    <div class="form-group">
      <label for="inputPassword4">주민번호</label><br>
      <input type="text" class="form-control" id="regNum" name="regNum1" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'> - 
      <input type="password" class="form-control" id="regNum" name="regNum2" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
    </div>  
    
  <div class="form-group">
      <label for="inputEmail4">이메일</label>
      <input type="email" class="form-control" id="inputEmail4" name="email">
    </div>
   
  <div class="form-group">
      <label for="inputEmail4">우편번호</label><br>
      <table>
      <tr>
      <th style="width:75%">
      <input type="text" class="form-input" id="inputEmail4" name="postNum" value="${post}" readonly>
      </th>
      <th style="text-align:center">
      <button type="button" class="btn btn-primary" onclick="find_addr()">주소찾기</button>
      </th>
      </tr>
      </table>
    </div>
    
  <div class="form-group">
    <label>주소</label>
    <input type="text" class="form-control" name="addr1" readonly>
    <label>상세 주소</label><br>
    <input type="text" class="form-control" id="regNum" name="addr2">
  </div> 
  
  <div class="form-group">
      <label for="inputPassword4">전화번호</label>
      <input type="text" class="form-control" id="inputPassword4" name="phone">
    </div>  
  
  <div align="center">
  <button type="submit" class="btn btn-primary" onclick="return join_member()">회원가입</button>
  <button type="reset" class="btn btn-primary">취소</button>
  </div>
</form></div>
<%@ include file="../footer.jsp" %>