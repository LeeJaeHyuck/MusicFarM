<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<h1>Contact</h1>
<hr>
<form name="cont" action="send_contact" method="post">
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
</form>
<br>
<c:if test="${contact.rep != 1}">
<h1>답변</h1>
<hr>
<div id="sign">
<textarea class="form-control" id="exampleFormControlTextarea1" rows="8" readonly>
${contact.reply}
</textarea>
</div>
</c:if>
<%@ include file="../footer.jsp"%>