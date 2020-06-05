<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	function order_del() {
		var count = 0;
		if (document.order.result.length == undefined) {
			if (document.order.result.checked == true) {
				count++;
			}
		} else {
			for (var i = 0; i < document.order.result.length; i++) {
				if (document.order.result[i].checked == true) {
					count++;
				}
			}
		}
		if (count == 0) {
			alert("주문취소할 항목을 선택해 주세요.");
		} else {
			if (confirm("주문취소 처리 하시겠습니까?") == true) {
				document.order.action = "order_del";
				document.order.submit();
				return true;
			} else {
				return false;
			}
		}
	}

	function check_all() {
		var all = document.order.checkAll;
		var result = document.order.result;
		if (all.checked) {
			if (result.length == null) {
				result.checked = true;
			} else {
				for (var i = 0; i < result.length; i++) {
					result[i].checked = true;
				}
			}
		} else {
			if (result.length == null) {
				result.checked = false;
			} else {
				for (var i = 0; i < result.length; i++) {
					result[i].checked = false;
				}
			}
		}
		
		
	}
	
	function result_check(){
		var all = document.order.checkAll;
		var result = document.order.result;
		if(result.length == null){
			if(result.checked == false){
				all.checked = false;
			}
		} else {
			for (var i = 0; i < result.length; i++) {
				if(result[i].checked == false){
					all.checked = false;
				}
			}
		}
	}
</script>
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
    <c:if test="${orderDetail.result == 1}">
    <th style="width:3%;"><input type="checkbox" name="checkAll" onclick="check_all()"/></th>
    </c:if>
    <th scope="col">상품번호</th>
      <th scope="col">상품명</th>
      <th scope="col">수량</th>
      <th scope="col">가격</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="order" items="${orderList}">
    	<tr>
   		<c:if test="${order.result == 1}">
    	<td><input type="checkbox" name="result" value="${order.odseq}" onclick="result_check()"></td>
    	</c:if>
    	<td>${order.pseq}</td>
    	<td><a href="product_detail?pseq=${order.pseq}">${order.pname}</a></td>
    	<td>${order.quantity}개</td>
    	<td><fmt:formatNumber value="${order.price2}" />원</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<div align="right">
<c:if test="${orderDetail.result == 1}">
<button type="submit" class="btn btn-outline-secondary" onclick="return order_del()">주문취소</button>
</c:if>
<button type="button" class="btn btn-outline-secondary" onclick="location='index'">쇼핑하러 가기</button>
</div>
</form>
<%@ include file="../footer.jsp" %>