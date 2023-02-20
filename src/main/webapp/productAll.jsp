<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, product.*" %>
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
	<h2 align="center">��ü ��ǰ��� ��ȸ/����</h2>
	<div align="center">
	<table border="1">
	<tr><th>��ǰ��ȣ</th><th>�귣��</th><th>ī�װ�</th>
		<th>�̸�</th><th>����</th><th>������</th></tr>
<%
	ArrayList products = (ArrayList)request.getAttribute("LIST");
	int size = products.size();
	for(int i=0; i<size; i++){
		Product prd = (Product)products.get(i);
%>
	<tr><td align="center"><a href="productSelect.do?ID=<%= prd.getPrdid() %>"><%= prd.getPrdid() %></a></td>
	<td align="center">
<%
		String b = prd.getBrand();
		if(b.equals("Monblanc")){
			out.print("�����");
		}else if(b.equals("Dupont")){
			out.print("����");
		}else if(b.equals("Grafvon")){
			out.print("�׶��� �Ĺ�ī����");	
		}else if(b.equals("Parker")){
			out.print("��ī");	
		}else if(b.equals("Waterman")){
			out.print("���͸�");	
		}else if(b.equals("Aurora")){
			out.print("���ζ�");	
		}else if(b.equals("Pelican")){
			out.print("�縮ĭ");	
		}else if(b.equals("Lamy")){
			out.print("���");	
		}else if(b.equals("Faber")){
			out.print("�Ĺ�ī����");	
		}else if(b.equals("Sheaffer")){
			out.print("����");	
		}else if(b.equals("Pilot")){
			out.print("���̷�Ʈ");	
		}else if(b.equals("Platinum")){
			out.print("�÷�Ƽ��");	
		}else if(b.equals("Sailor")){
			out.print("���Ϸ�");	
		}else if(b.equals("Caran")){
			out.print("��ٽ�");	
		}else if(b.equals("Cross")){
			out.print("ũ�ν�(��Ʈ, ����)");	
		}else if(b.equals("Moleskine")){
			out.print("����Ų(��Ʈ)");	
		}else if(b.equals("Claire")){
			out.print("Ŭ��������(��Ʈ)");	
		}else if(b.equals("Zequenz")){
			out.print("������(��Ʈ)");	
		}else if(b.equals("Kyoto")){
			out.print("����(��ũ)");	
		}else if(b.equals("Diamine")){
			out.print("��ƹ�(��ũ)");	
		}else if(b.equals("Jherbin")){
			out.print("�������(��ũ)");	
		}else if(b.equals("Swiss")){
			out.print("������ �и��͸�(����)");	
		}else if(b.equals("Land")){
			out.print("���� �����̺�(����)");	
		}
%>
		</td>
		<td align="center">
		<%
		String c = prd.getCategory();
		if(c.equals("FOUNTAIN")){
			out.print("������");
		}else if(c.equals("DIARY")){
			out.print("���̾/��Ʈ");
		}else if(c.equals("INK")){
			out.print("��ũ");	
		}else if(c.equals("WALLET")){
			out.print("����");	
		}else if(c.equals("BELT")){
			out.print("��Ʈ");	
		}else if(c.equals("PERFUME")){
			out.print("���");	
		}else if(c.equals("OTHER")){
			out.print("��ȭ");	
		}
%>
		</td>
	
		<td align="center"><%= prd.getName() %></td>
		<td align="right"><%= prd.getPrice() %></td>
		<td align="center"><%= prd.getOrigin() %></td></tr>
		
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