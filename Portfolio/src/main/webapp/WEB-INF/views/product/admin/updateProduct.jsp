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

function go_ab() // 판매가-원가=순매출을 replace해서 계산해 준다.
{
	var theForm = document.update;
	var a = theForm.price2.value.replace(/,/g, '');		// 판매가
	var b = theForm.price1.value.replace(/,/g, '');		// 원가
	var ab = parseInt(a) - parseInt(b);					// 순매출
	theForm.price3.value = ab;
}

function go_update(){
	var theForm = document.update;
	var a = theForm.price1.value;
	var b = theForm.price2.value;
	
	if(theForm.name.value == ""){
		alert("상품명을 입력해주세요.");
		theForm.name.focus();
		return false;
	} else if(theForm.price1.value == ""){
		alert("원가를 입력해주세요.");
		theForm.price1.focus();
		return false;
	} else if(theForm.price2.value == ""){
		alert("판매가를 입력해주세요.");
		theForm.price2.focus();
		return false;
	} else if(theForm.content.value == ""){
		alert("설명을 입력해주세요.");
		theForm.content.focus();
		return false;
	} else if(theForm.images.value == "" && theForm.image.value == ""){
		alert("이미지를 삽입해주세요.");
		return false;
	} else if(theForm.price1.value != "" && theForm.price2.value != ""){
		a = a.replace(/,/g, '');
		b = b.replace(/,/g, '');
		if(parseInt(a) > parseInt(b)){
		alert("판매가보다 원가가 더 비쌉니다.");
		theForm.price2.focus();
		return false;
		} else {
			theForm.price1.value = parseInt(a);
			theForm.price2.value = parseInt(b);
			return true;
		}
	}
}
</script>
<h1>상품수정</h1>
<hr>
<form action="update_product" method="post" enctype="multipart/form-data" name="update">
<input type="hidden" name="pseq" value="${product.pseq}">
<table>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="name" value="${product.name}"></td>
	</tr>
	<tr>
		<th>종류</th>
		<td>
		<select name="kind">
			<option value="1">피아노</option>
			<option value="2">기타</option>
			<option value="3">베이스</option>
			<option value="4">드럼</option>
			<option value="5">미디</option>
			<option value="6">악세사리</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>신상품여부</th>
		<td><c:if test="${product.useyn == 'y'}">
			<label><input type="radio" name="useyn" value="y" checked>Y</label>
			<label><input type="radio" name="useyn" value="n">N</label>
			</c:if>
			<c:if test="${product.useyn == 'n'}">
			<label><input type="radio" name="useyn" value="y">Y</label>
			<label><input type="radio" name="useyn" value="n" checked>N</label>
			</c:if>
		</td>
	</tr>
	<tr>
		<th>베스트상품여부</th>
		<td><c:if test="${product.bestyn == 'y'}">
			<label><input type="radio" name="bestyn" value="y" checked>Y</label>
			<label><input type="radio" name="bestyn" value="n">N</label>
			</c:if>
			<c:if test="${product.bestyn == 'n'}">
			<label><input type="radio" name="bestyn" value="y">Y</label>
			<label><input type="radio" name="bestyn" value="n" checked>N</label>
			</c:if>
		</td>
	</tr>
	<tr>
		<th>가격</th>
		<td>
		원가: <input type="text" name="price1" onKeyUp='NumFormat(this)' value="${product.price1}">
		판매가: <input type="text" name="price2" onBlur="go_ab()" onKeyUp='NumFormat(this)' value="${product.price2}">
		마진: <input type="text" name="price3" onKeyUp='NumFormat(this)' value="${product.price3}">
		</td>
	</tr>
	<tr>
		<th>설명</th>
		<td><textarea name="content">${product.content}</textarea></td>
	</tr>
	<tr>
		<th>사진</th>
		<td><input type="file" name="images">
			<input type="hidden" name="image" value="${product.image}">
		</td>
	</tr>
</table>
<input type="reset" value="취소">
<input type="submit" value="등록" onclick="return go_update()">
</form>


<%@ include file="../../footer.jsp" %>