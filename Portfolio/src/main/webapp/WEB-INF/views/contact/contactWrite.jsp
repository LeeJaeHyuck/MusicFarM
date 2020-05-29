<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<h1>Contact</h1>
<hr>
<form name="cont" action="send_contact" method="post">
<div id="sign">
  <div class="form-group">
    <label for="exampleFormControlInput1">제목</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="title">
  </div>
  
  <div class="form-group">
   	<label for="exampleFormControlInput1">아이디</label>
   	<input type="text" class="form-control" id="exampleFormControlInput1" value="${user.id}" name="id" readonly>
  </div>

  <div class="form-group">
    <label for="exampleFormControlTextarea1">내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name="content"></textarea>
  </div>
  
  <div align="right">
  <input type="reset" class="btn btn-outline-secondary" value="취소">
  <input type="submit" class="btn btn-primary" value="보내기">
  </div>
</div>
</form>
<%@ include file="../footer.jsp"%>