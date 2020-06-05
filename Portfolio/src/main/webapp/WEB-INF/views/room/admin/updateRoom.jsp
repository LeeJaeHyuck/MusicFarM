<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<script>
function NumFormat(t) // 원 단위, 찍어주기
{
	s = t.value;
	s = s.replace(/\D/g, '');
	l = s.length - 3;
	while (l > 0) {
		s = s.substr(0, l) + ',' + s.substr(l);
		l -= 3;
	}
	t.value = s;
	return t;
}

function goUpdate(){
	var theForm = document.write;
	var a = theForm.price.value;
	
	if(theForm.price.value == ""){
		alert("가격을 입력해주세요.");
		theForm.price.focus();
		return false;
	} else if(theForm.person.value == ""){
		alert("사용가능인원을 입력해주세요.");
		theForm.person.focus();
		return false;
	} else if(theForm.images.value == "" && theForm.image.value == ""){
		alert("이미지를 삽입해주세요.");
		return false;
	} else {
		a = a.replace(/,/g, '');
		theForm.price.value = parseInt(a);
		return true;
	}
}
</script>
<h1>상품수정</h1>
<hr>
<form action="update_room" method="post" enctype="multipart/form-data" name="write">
<table>
	<tr>
		<th>방번호</th>
		<td><input type="text" name="roomNum" value="${room.roomNum}" readonly>호</td>
	</tr>
	<tr>
		<th>사용가능인원</th>
		<td>
		<input type="text" name="person" value="${room.person}">인실
		</td>
	</tr>
	<tr>
		<th>가격</th>
		<td>
		<input type="text" name="price" onKeyUp='NumFormat(this)' value="${room.price}">원
		</td>
	</tr>
	<tr>
		<th>사진</th>
		<td><input type="file" name="images">
			<input type="hidden" name="image" value="${room.image}"></td>
	</tr>
</table>
<input type="reset" value="취소">
<input type="submit" value="등록" onclick="return goUpdate()">
</form>


<%@ include file="../../footer.jsp" %>