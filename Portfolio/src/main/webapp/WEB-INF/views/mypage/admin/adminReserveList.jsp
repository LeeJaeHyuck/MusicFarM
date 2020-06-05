<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../header.jsp" %>
<script type="text/javascript">
	function admin_reserve_save() {
		var count = 0;
		if (document.book.result.length == undefined) {
			if (document.book.result.checked == true) {
				count++;
			}
		} else {
			for (var i = 0; i < document.book.result.length; i++) {
				if (document.book.result[i].checked == true) {
					count++;
				}
			}
		}
		if (count == 0) {
			alert("예약처리할 항목을 선택해 주세요.");
		} else {
			if(confirm("예약처리 하시겠습니까?") == true){
			document.book.action = "admin_book_save";
			document.book.submit();
			return true;
			} else {
				return false;
			}
		}
	}
	
	function admin_reserve_del(){
		var count = 0;
		if (document.book.result.length == undefined) {
			if (document.book.result.checked == true) {
				count++;
			}
		} else {
			for (var i = 0; i < document.book.result.length; i++) {
				if (document.book.result[i].checked == true) {
					count++;
				}
			}
		}
		if (count == 0) {
			alert("예약취소할 항목을 선택해 주세요.");
		} else {
			if(confirm("예약취소 하시겠습니까?") == true){
			document.book.action = "admin_book_del";
			document.book.submit();
			return true;
			} else {
				return false;
			}
		}
	}
	
	function check_all() {
		var all = document.book.checkAll;
		var result = document.book.result;
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
		var all = document.book.checkAll;
		var result = document.book.result;
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
<form name="book" method="post" action="admin_reserve_list">
<div>
  	<h3 style="float:left;" >예약 목록</h3>
  	<div style="float: right;">
    <input class="form-control1" type="search" placeholder="ID를 입력하세요." aria-label="Search" name="key">
    <button type="submit" class="btn btn-outline-success">검색</button>
    </div>
 </div>
<table class="table" style="text-align:center;">
  <thead class="thead-dark">
    <tr> <!-- 방번호 예약자 예약날짜 인원 핸드폰번호 예약한날짜-->
      <th scope="col"><input type="checkbox" name="checkAll" onclick="check_all()"/>예약번호(처리여부)</th>
      <th scope="col">예약자</th>
      <th scope="col">방번호</th>
      <th scope="col">예약날짜</th>
      <th scope="col">인원</th>
      <th scope="col">전화번호</th>
    </tr>
  </thead>
  <tbody >
  <c:if test="${bookList == null}">
  	<tr><td colspan="4" style="color:red;"><h4>주문내역이 없습니다.</h4></td></tr>
  </c:if>
  
    <c:forEach var="book" items="${bookList}">
    	<input type="hidden" name="bseq" value="${book.bseq}">
    	<tr>
    	<td>
    		<c:choose>
        		<c:when test='${book.result=="1"}'>
        		<input type="checkbox" name="result" value="${book.bseq}" onclick="result_check()">
        		<span style="font-weight: bold; color: blue">${book.bseq}</span>
        		(미처리)
        		</c:when>
        		<c:otherwise>
        		<input type="checkbox" checked="checked" disabled="disabled">
          		<span style="font-weight: bold; color: red">${book.bseq}</span>
          		(처리완료)
        		</c:otherwise>
      		</c:choose>
      	</td>
    	<td><a href="member_detail?id=${book.id}">${book.id}</a></td>
    	<td><a href="room_detail?roomNum=${book.roomNum}">${book.roomNum}</a></td>
    	<td><fmt:formatDate value="${book.reserveDate}" pattern="yyyy-MM-dd"/></td>
    	<td>${book.person}명</td>
    	<td>${book.phone}</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<hr>
<div align="right">
<button type="submit" class="btn btn-outline-secondary" onclick="return admin_reserve_del()">예약취소</button>
<button type="submit" class="btn btn-outline-secondary" onclick="return admin_reserve_save()">예약처리</button>
</div>
</form>
<%@ include file="../../footer.jsp" %>