<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
	function update_reply() {
		if (confirm("답변을 등록하시겠습니까?") == true) {
			document.cont.action = "update_reply";
			documemt.cont.submit();
		}
	}
</script>

<h1>Contact</h1>
<hr>
<form name="cont" action="contact_update_form" method="post">
	<input type="hidden" value="${contact.cseq}" name="cseq">
	<div id="sign">
		<div class="form-group">
			<label for="exampleFormControlInput1">제목</label> 
			<input type="text" class="form-control" id="exampleFormControlInput1" name="title" value="${contact.title}" readonly>
		</div>

		<div class="form-group">
			<label for="exampleFormControlInput1">아이디</label> 
			<input type="text" class="form-control" id="exampleFormControlInput1" value="${contact.id}" name="id" readonly>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="content" readonly>${contact.content}</textarea>
		</div>

	</div>
	<c:choose>
		<c:when test="${loginUser.authority == 2}">
			<c:if test="${contact.rep == 1}">
				<div id="sign">
				<h1>답변</h1>
				<hr>
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="reply"></textarea>
					<input type="submit" value="답변" onclick="update_reply()"> 
					<input type="button" value="삭제" onclick="location='delete_contact?cseq=${contact.cseq}'">
				</div>
			</c:if>
			<c:if test="${contact.rep == 2}">
				<h1>답변</h1>
				<hr>
				<div id="sign">
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="reply">${contact.reply}</textarea>
					<input type="button" value="답변수정" onclick="update_reply()">
				</div>
			</c:if>
		</c:when>
		<c:otherwise>
			<c:if test="${contact.rep == 1}">
				<div align="center">
					<input type="submit" value="수정"> 
					<input type="button" value="삭제" onclick="location='delete_contact?cseq=${contact.cseq}'">
				</div>
			</c:if>

			<c:if test="${contact.rep == 2}">
				<h1>답변</h1>
				<hr>
				<div id="sign">
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="8" readonly>${contact.reply}</textarea>
				</div>
			</c:if>
		</c:otherwise>
	</c:choose>


</form>
<br>
<%@ include file="../footer.jsp"%>