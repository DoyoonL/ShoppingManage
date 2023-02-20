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
	<h1 align="center">����� ��ǰ���� ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">��ü ���� ��ȸ/����</h2>
	<div align="center">
	<table border="1">
	<tr><th>��ǰ��ȣ</th><th>����ȣ</th><th>��ǰ��ȣ</th>
		<th>�ܰ�</th><th>�Ǹż���</th><th>�ǸŰ���</th><th>�Ǹų�¥</th></tr>
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