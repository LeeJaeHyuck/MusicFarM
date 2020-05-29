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
<h1>상품 목록</h1>
  <form class="form-inline" action="product_list">
  <div align="center" style="width: 97%">
    <input class="form-control1" type="search" placeholder="Search" aria-label="Search" name="search">
    <button type="submit" class="btn btn-outline-success">검색</button>
  </div>
  </form>
 <div id="productList">
 
        <c:forEach items="${productList}"  var="productVO">
          <div id="item">
           <a href="product_detail?pseq=${productVO.pseq}" id="detail">
             <img src="product_images/${productVO.image}" />
           <h4> ${productVO.name} </h4>    
           <p><fmt:formatNumber value="${productVO.price2}" />원</p>
        </a>  
      </div>
    </c:forEach>      
  </div><br>
  
  <ul class="pagination justify-content-center">
    	<li class="page-item">
			<a class="page-link" href="product_list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;&lt;</a>
    	</li>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<li class="page-item active" aria-current="page">
     					 <a class="page-link" href="#">${p}</a>
   					 </li>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<li class="page-item"><a class="page-link" href="product_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p}</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
    	<li class="page-item">
			<a class="page-link" href="product_list?nowPage=${paging.nowPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;&gt;</a>
    	</li>
  </ul>


<%@ include file="../footer.jsp" %>
