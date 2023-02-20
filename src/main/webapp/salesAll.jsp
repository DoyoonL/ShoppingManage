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
	<h1 align="center">펜까페 상품관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">전체 매출 조회/수정</h2>
	<div align="center">
	<table border="1">
	<tr><th>상품번호</th><th>고객번호</th><th>상품번호</th>
		<th>단가</th><th>판매수량</th><th>판매가격</th><th>판매날짜</th></tr>
<%
	ArrayList SalesAll = (ArrayList)request.getAttribute("LIST");
	int size = SalesAll.size();
	for(int i=0; i<size; i++){
		Sales sales = (Sales) SalesAll.get(i);
%>
	<tr><td align="center"><a href="salesSelect.do?ID=<%= sales.getSalesno() %>"><%= sales.getSalesno() %></a></td>
		<td align="center"><%= sales.getCustno() %></td>
		<td align="center"><%= sales.getPrdid() %></td>
		<td align="right"><%= sales.getPrice() %></td>
		<td align="center"><%= sales.getAmount() %></td>
		<td align="right"><%= sales.getTotal() %></td>
		<td align="center"><%= sales.getSalesdate() %></td></tr>
		
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