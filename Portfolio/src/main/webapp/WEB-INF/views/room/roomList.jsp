<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
.form-control1 {
  display: inline-block;
  width: 50%;
  height: calc(1.5em + 0.75rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
</style>
<h1>작업실 목록</h1>
 <div id="roomList">
 
        <c:forEach items="${roomList}"  var="room">
          <div id="item">
           <a href="room_detail?roomNum=${room.roomNum}" id="detail">
             <img src="room_images/${room.image}" />
           <h4> ${room.roomNum}</h4>    
           <p>${room.person}인실<br><fmt:formatNumber value="${room.price}" />원/일</p>
        </a>  
      </div>
    </c:forEach>      
  </div>


<%@ include file="../footer.jsp" %>
