<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, sales.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_select.css">
</head>
<body>
<header>
	<h1 align="center">고객 매출관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">고객 매출조회</h2>
	<div align="center">
	<table border="1">
	<tr><th>고객번호</th><th>고객이름</th>
		<th>가입일자</th><th>매 출</th><th>등 급</th></tr>
<%
	ArrayList list=(ArrayList)request.getAttribute("LIST");
	int count = list.size();
	for(int i=0; i<count; i++){
		SalesCustomer salescust = (SalesCustomer)list.get(i);
%>
	<tr><td align="center"><%= salescust.getCustno() %></td>
		<td align="center"><%= salescust.getCustname() %></td>
		<td align="center"><%= salescust.getJoindate() %></td>
		<td align="right"><%= salescust.getFinals() %></td>
		<td align="center">
<% 
		String g = salescust.getGrade();
		if(g.equals("VIP")){
			out.print("VIP");
		}else if(g.equals("FAMILY")){
			out.print("패밀리");
		}else if(g.equals("NORMAL")){
			out.print("일반");
		}else if(g.equals("NEW")){
			out.print("신규");
		}
%>	
		</td></tr>
<%
	}
%>		
	</table>
	</div>
</section>
<footer>
	<h3 align="center">PENCAFE KOREA MANAGEMENT copyright 2022 All 
	right reserved</h3>
</footer>
</body>
</html>