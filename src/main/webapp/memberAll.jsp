<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, member.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_select.css">
</head>
<body>
<header>
	<h1 align="center">����� ������ ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">����� ��ȸ/����</h2>
	<div align="center">
	<table border="1">
	<tr><th>����ȣ</th><th>������</th><th>��ȭ��ȣ</th>
		<th>�ּ�</th><th>��������</th><th>�����</th>
		<th>��������</th></tr>
<%
	ArrayList members=(ArrayList)request.getAttribute("ALL");
	int size = members.size();
	for(int i=0; i<size; i++){
		Member mem = (Member)members.get(i);
%>
	<tr><td align="center"><a href="memberSelect.do?ID=<%= mem.getCustno() %>"><%= mem.getCustno() %></a></td>
		<td align="center"><%= mem.getName() %></td>
		<td align="center"><%= mem.getTel() %></td>
		<td align="center"><%= mem.getAddr() %></td>
		<td align="center"><%= mem.getDate() %></td>
		<td align="center">
<%
		String g = mem.getGrade();
		if(g.equals("VIP")){
			out.print("VIP");
		}else if(g.equals("FAMILY")){
			out.print("�йи�");
		}else if(g.equals("NORMAL")){
			out.print("�Ϲ�");	
		}else if(g.equals("NEW")){
			out.print("�ű�");
		}
%>
		</td>
		<td align="center">
<%
		String c = mem.getCode();
		if(c.equals("Seoul")){
			out.print("����");
		}else if(c.equals("Kyungki")){
			out.print("��⵵");
		}else if(c.equals("Kangwon")){
			out.print("������");	
		}else if(c.equals("Choongbook")){
			out.print("��û�ϵ�");	
		}else if(c.equals("Choongnam")){
			out.print("��û����");	
		}else if(c.equals("Junbook")){
			out.print("����ϵ�");	
		}else if(c.equals("Junnam")){
			out.print("���󳲵�");	
		}else if(c.equals("Kyungbook")){
			out.print("���ϵ�");	
		}else if(c.equals("Kyungnam")){
			out.print("��󳲵�");	
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




