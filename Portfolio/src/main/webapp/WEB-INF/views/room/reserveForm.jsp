<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>
<script>
function opendate(){
var url = "calendar?roomNum=" + document.form.roomNum.value;

window
		.open(url, "_blank_1",
				"toolbar=no, menubar=no, scrollbar=yes, resizable=no, width=750, height=730");
}
</script>
<h1>예약하기</h1>
<form name="form" method="post" action="reserve_room">
<input type="hidden" name="date" value="${book.date}">
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">방번호</th>
      <th scope="col">날짜</th>
      <th scope="col">인원</th>
      <th scope="col">가격</th>
    </tr>
  </thead>
  <tbody>
    	<tr>
    	<td><a href="room_detail?roomNum=${room.roomNum}">${room.roomNum}</a></td>
    	<td><fmt:parseDate var="redate" value="${book.date}" pattern="yyyyMMdd" ></fmt:parseDate>
    		<output name="format"><fmt:formatDate value="${redate}" pattern="yyyy년 MM월 dd일" /></output><br>
    		<input type="button" value="날짜 선택" onclick="opendate()"></td>
    	<td>
    		<select name="person">
    			<c:forEach var="i" begin="1" end="${room.person}" step="1" varStatus="status">
    				<option value="${status.count}">${status.count}</option>
    			</c:forEach>
    		</select>
    	</td>
    	<td>
    	<input type="hidden" value="${room.roomNum}" name="roomNum">
    	<input type="hidden" value="${room.price }" name="price">
		<fmt:formatNumber value="${room.price}"></fmt:formatNumber>원</td>
    	</tr>
  </tbody>
</table>

<h3>예약자 정보</h3>

예약자ID : ${user.id}<br>
예약자명 : ${user.name}<br>
전화번호 : ${user.phone}<br>
결제 방식 :
<label><input type="radio" name="pay" value="1">신용카드</label> 
<label><input type="radio" name="pay" value="2">계좌이체</label>
<label><input type="radio" name="pay" value="3">휴대폰  </label>
<div align="right">
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">취소</button>
<button type="submit" class="btn btn-primary">예약</button>
</div>
</form>
<%@ include file="../footer.jsp" %>