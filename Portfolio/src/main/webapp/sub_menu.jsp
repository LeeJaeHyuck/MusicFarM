<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%
    String result = "";
    // 데이터 수신
    String syear = request.getParameter("year");
    String smonth = request.getParameter("month");
    
    Calendar cal = Calendar.getInstance();
    int nowYear = 0;
    int nowMonth = 0;
    if(syear == null || smonth == null) {
        nowYear = cal.get(Calendar.YEAR);
        nowMonth = cal.get(Calendar.MONTH);
        syear = nowYear + "";
        smonth = nowMonth + "";
    }
    else {
        nowYear = Integer.parseInt(syear);
        nowMonth = Integer.parseInt(smonth);
    }
   
    cal.set(nowYear, nowMonth-1, 1);
    int startDay = 1;
    int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int week = cal.get(Calendar.DAY_OF_WEEK);
   
    int newLine = 0;
    result += "<tr>";
    for(int i=1; i<week; i++) {
        result += "<td>&nbsp;</td>";
        newLine++;
    }
   
    for(int i=startDay; i<=endDay; i++) {
        if(newLine == 6) {
            result += "<td height='30' width='30' align='center'><font color='BLUE'>" + i + "</font></td>";
        }
        else if(newLine == 0) {
            result += "<td height='30' width='30' align='center'><font color='RED'>" + i + "</font></td>";
        }
        else {
            result += "<td height='30' width='30' align='center'>" + i + "</td>";
        }
        newLine++;
        if(newLine==7 && i!=endDay) {
            result += "</tr><tr>";
            newLine = 0;
        }
    }
   
    while(newLine>0 && newLine<7) {
        result += "<td>&nbsp;</td>";
        newLine++;
    }
   
    result += "</tr>";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>달력 출력(한 페이지 안에서)</title>
<script type="text/javascript">
function fsubmit(obj) {
    // 자바스크립트에서의 폼 전송
    // ->submit() 메소드 이용
    obj.form.submit();
}
</script>
</head>
<body>
달력 출력 <br><br>
<form method="post">
년도 : <select name="year" onchange="fsubmit(this);">
    <% for(int i=2020; i<2050; i++) {
        %><option value="<%= i %>"
        <% if(Integer.parseInt(syear)==i) out.println("selected='selected'");%>> <%= i %><%    
    }
    %></option>
</select>년 &nbsp;
월 : <select name="month" onchange="fsubmit(this);">
    <% for(int i=1; i<13; i++) {
        %><option value="<%= i %>"
        <% if(Integer.parseInt(smonth)==i) out.println("selected='selected'");%>> <%= i %><%    
    }
    %></option>
</select>월
</form>
<br><br>
<table border="3">
    <tr>
        <td height="30" width="30" align="center">일</td>
        <td height="30" width="30" align="center">월</td>
        <td height="30" width="30" align="center">화</td>
        <td height="30" width="30" align="center">수</td>
        <td height="30" width="30" align="center">목</td>
        <td height="30" width="30" align="center">금</td>
        <td height="30" width="30" align="center">토</td>
    </tr>
<%= result %>
</table>
</body>
</html>