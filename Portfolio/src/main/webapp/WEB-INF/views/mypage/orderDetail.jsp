<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>
<h1>주문 상세 정보</h1>
<form name="order" method="post" action="all_pay_form">
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
      <th scope="col">주문일자</th>
      <th scope="col">주문자</th>
      <th scope="col">주문총액</th>
      <th scope="col">배송지</th>
    </tr>
  </thead>
  <tbody>
  	<tr>
  		<td><fmt:formatDate value="${orderDetail.regdate}" pattern="yyyy년 MM월 dd일"/> </td>
  		<td>${orderDetail.mname}</td>
  		<td><fmt:formatNumber value="${totalPrice}"></fmt:formatNumber>원</td>
  		<td>${orderDetail.addr1} ${orderDetail.addr2}</td>
  	</tr>
  </tbody>
</table>
<hr>
<table class="table" style="text-align:center">
  <thead class="thead-dark">
    <tr>
    <th scope="col">상품번호</th>
      <th scope="col">상품명</th>
      <th scope="col">수량</th>
      <th scope="col">가격</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="order" items="${orderList}">
    	<tr>
    	<td>${order.pseq}</td>
    	<td><a href="product_detail?pseq=${order.pseq}">${order.pname}</a></td>
    	<td>${order.quantity}개</td>
    	<td><fmt:formatNumber value="${order.price2}" />원</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<div align="right">
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">쇼핑하러 가기</button>
</div>
</form>
<%@ include file="../footer.jsp" %>