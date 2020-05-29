<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>
<h1>장바구니</h1>

<form name="cart" method="post" action="all_pay_form">
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">방번호</th>
      <th scope="col">예약자명</th>
      <th scope="col">사용날짜</th>
      <th scope="col">가격</th>
      <th scope="col">인원</th>
      <th scope="col">예약한날짜</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="book" items="${bookList}">
    	<tr>
    	<td><a href="room_detail?roomNum=${book.roomNum}">${book.roomNum}호</a></td>
    	<td>${book.name}</td>
    	<td><fmt:formatDate value="${book.reserveDate}" pattern="yyyy년 MM월  dd일"/></td>
    	<td><fmt:formatNumber value="${book.price}"></fmt:formatNumber></td>
    	<td>${book.person} 명</td>
    	<td><fmt:formatDate value="${book.regDate}" pattern="yyyy년 MM월  dd일"/></td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<div align="right">
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">쇼핑하러 가기</button>
</div>
</form>

<%@ include file="../footer.jsp" %>