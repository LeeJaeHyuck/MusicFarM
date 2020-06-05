<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<h1>Contact</h1>
<hr>
<form name="cont" action="contact_update" method="post">
<input type="hidden" value="${contact.cseq }" name="cseq">
<div id="sign">
  <div class="form-group">
    <label for="exampleFormControlInput1">제목</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="title" value="${contact.title }">
  </div>
  
  <div class="form-group">
   	<label for="exampleFormControlInput1">아이디</label>
   	<input type="text" class="form-control" id="exampleFormControlInput1" value="${contact.id}" name="id" readonly>
  </div>

  <div class="form-group">
    <label for="exampleFormControlTextarea1">내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="content">${contact.content}</textarea>
  </div>
  
  <div align="right">
  <input type="button" class="btn btn-outline-secondary" value="취소" onclick="location='contact_list'">
  <input type="submit" class="btn btn-primary" value="수정">
  </div>
</div>
</form>
<%@ include file="../footer.jsp"%>