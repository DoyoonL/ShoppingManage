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
	<h1 align="center"> ���� ���� ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">ī�װ��� ������ȸ</h2>
	<div align="center">
	<table border="1">
	<tr><th>ī�װ�</th><th>�� ��</th></tr>
<%
	ArrayList list=(ArrayList)request.getAttribute("LIST");
	int count = list.size();
	for(int i=0; i<count; i++){
		CategorySales categorysales = (CategorySales)list.get(i);	
%>
	<tr><td align="center"><%= categorysales.getCategory() %></td>
		<td align="center"><%= categorysales.getFinals() %></td></tr>
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