<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">

<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.Calendar"%>

<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">

<head>

<title>캘린더</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javaScript" language="javascript">
</script>
<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}
</style>

</head>

<body>

	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<div id="content" style="width: 712px;">
			<table width="100%" border="0" cellspacing="1" cellpadding="1">
				<tr>
					<td align="right"><input type="button" onclick="location='calendar'" value="오늘"></td>
				</tr>
			</table>

			<!--날짜 네비게이션  -->

			<table width="100%" border="0" cellspacing="1" cellpadding="1"
				id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">
				<tr>
					<td height="60">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td align="center">
								<a href="calendar?year=${year-1}&month=${month}" target="_self"> 
								<b>&lt;&lt;</b> <!-- 이전해 --> </a> 
									
									
									
								<c:choose>
									<c:when test="${month > 0}"> 	
 										<a href="calendar?year=${year}&month=${month-1}" target="_self"> 
 										<b>&lt;</b> <!-- 이전달 --> </a> 
									</c:when>
									<c:otherwise> 
										<b>&lt;</b> 
									</c:otherwise> 
								</c:choose> &nbsp;&nbsp; 
								${year}년 ${month+1}월 &nbsp;&nbsp;
								
								
								<c:choose>
									<c:when test="${month < 11}">
									<a href="calendar?year=${year}&month=${month+1}" target="_self">
									 <!-- 다음달 --> <b>&gt;</b> </a> 
									 </c:when>
									 <c:otherwise> <b>&gt;</b> </c:otherwise>
								</c:choose> 
									 <a href="calendar?year=${year+1}&month=${month}" target="_self"> 
									 <!-- 다음해 --> <b>&gt;&gt;</b>
								</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br>
			<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
				<thead>
					<tr bgcolor="#CECECE">
						<td width='100px'>
							<div align="center">
								<font color="red">일</font>
							</div>
						</td>
						<td width='100px'>
							<div align="center">월</div>
						</td>
						<td width='100px'>
							<div align="center">화</div>
						</td>
						<td width='100px'>
							<div align="center">수</div>
						</td>
						<td width='100px'>
							<div align="center">목</div>
						</td>
						<td width='100px'>
							<div align="center">금</div>
						</td>
						<td width='100px'>
							<div align="center">
								<font color="#529dbc">토</font>
							</div>
						</td>
					</tr>
				</thead>

				<tbody>
					<tr>
					
						<c:forEach var="i" begin="1" end="${start-1}" step="1">
							<td>&nbsp;</td>
							<input type="hidden" value="${newLine + i}" name="newLine">
						</c:forEach>
						
						<c:forEach var="i" begin="1" end="${endDay}" step="1">
							<c:choose>
								<c:when test="${newLine == 0}">
									<c:set var="color" value="red" />
								</c:when>
								<c:when test="${newLine == 6}">
									<c:set var="color" value="#529dbc" />
								</c:when>
								<c:otherwise>
									<c:set var="color" value="black" />
								</c:otherwise>
							</c:choose>
							
							<fmt:formatNumber value="${year}" pattern="0000" var="syear"/>
							<fmt:formatNumber value="${i}" pattern="00" var="si"/>
							<fmt:formatNumber value="${year + i}" pattern="00000000" var="date"/>${si}
							<td valign='top' align='left' height='92px' bgcolor="${color}" nowrap>
						</c:forEach>

						<%--
							//처음 빈공란 표시

							for (int index = 1; index < start; index++) {

								out.println("<td >&nbsp;</td>");

								newLine++;

							}

							for (int index = 1; index <= endDay; index++) {

								String color = "";

								if (newLine == 0) {
									color = "RED";

								} else if (newLine == 6) {
									color = "#529dbc";

								} else {
									color = "BLACK";
								};

								String sUseDate = Integer.toString(year);

								sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
										: Integer.toString(month + 1);

								sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
										: Integer.toString(index);

								int iUseDate = Integer.parseInt(sUseDate);

								String backColor = "#EFEFEF";

								if (iUseDate == intToday) {

									backColor = "#c9c9c9";

								}

								out.println("<td valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
						--%>

						<font color='<%--colo--%>'> <%--index--%>
						</font>

						<%--
							out.println("<br>");

								out.println(iUseDate);

								out.println("<BR>");

								//기능 제거 

								out.println("</td>");

								newLine++;

								if (newLine == 7) {
									out.println("</tr>");
									if (index <= endDay) {
										out.println("<tr>");
									}
									newLine = 0;
								}
							}

							//마지막 공란 LOOP
							while (newLine > 0 && newLine < 7) {
								out.println("<td>&nbsp;</td>");
								newLine++;
							}
						--%>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>

</HTML>