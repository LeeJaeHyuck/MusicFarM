<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../header.jsp" %>
<script type="text/javascript">
	function admin_order_save() {
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
			alert("주문처리할 항목을 선택해 주세요.");
		} else {
			if(confirm("주문처리 하시겠습니까?") == true){
			document.order.action = "admin_order_save";
			document.order.submit();
			return true;
			} else {
				return false;
			}
		}
	}
	
	function admin_order_del() {
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
			if(confirm("주문취소 처리 하시겠습니까?") == true){
			document.order.action = "admin_order_del";
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
<form name="order" method="post" action="admin_order_list">
<div>
  	<h3 style="float:left;" >주문 목록</h3>
  	<div style="float: right;">
    <input class="form-control1" type="search" placeholder="ID를 입력하세요." aria-label="Search" name="key">
    <button type="submit" class="btn btn-outline-success">검색</button>
    </div>
 </div>
<table class="table" style="text-align:center;">
  <thead class="thead-dark">
    <tr>
      <th scope="col"><input type="checkbox" name="checkAll" onclick="check_all()"/>주문번호<br>(처리여부)</th>
      <th scope="col">주문자</th>
      <th scope="col">상품명</th>
      <th scope="col">수량</th>
      <th scope="col">우편번호</th>
      <th scope="col">배송지</th>
      <th scope="col">전화</th>
      <th scope="col">주문일</th>
    </tr>
  </thead>
  <tbody style="font-size:0.8em;">
  <c:if test="${orderList == null}">
  	<tr><td colspan="4" style="color:red;"><h4>주문내역이 없습니다.</h4></td></tr>
  </c:if>
  
    <c:forEach var="order" items="${orderList}">
    	<tr>
    	<td>
    		<c:choose>
        		<c:when test='${order.result=="1"}'>
        		<input type="checkbox" name="result" value="${order.odseq}" onclick="result_check()">
        		<span style="font-weight: bold; color: blue">${order.oseq}</span><br>
        		(미처리)
        		</c:when>
        		<c:otherwise>
        		<input type="checkbox" checked="checked" disabled="disabled">
          		<span style="font-weight: bold; color: red">${order.oseq}</span><br>
          		(처리완료)
        		</c:otherwise>
      		</c:choose>
      	</td>
    	<td><a href="member_detail?id=${order.id}">${order.id}</a></td>
    	<td><a href="product_detail?pseq=${order.pseq}">${order.pname}</a></td>
    	<td>${order.quantity}</td>
    	<td>${order.postNum}</td>
    	<td>${order.addr1} ${order.addr2}</td>
    	<td>${order.phone}</td>
    	<td><fmt:formatDate value="${order.regdate}" pattern="yyyy-MM-dd"/> </td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<hr>
<div align="right">
<button type="submit" class="btn btn-outline-secondary" onclick="return admin_order_del()">주문취소</button>
<button type="button" class="btn btn-outline-secondary" onclick="return admin_order_save()">주문처리</button>
</div>
</form>
<%@ include file="../../footer.jsp" %>