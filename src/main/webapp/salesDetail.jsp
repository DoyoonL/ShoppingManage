<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="sales.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_detail.css">
</head>
<body>
<header>
	<h1 align="center">����� ������� ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">���� ���� ����</h2>
	<div align="center">
	<form action="salesUpdate.do" method="post"
			onSubmit="return check()">
	<table border="1">
<%
	Sales sales=(Sales)request.getAttribute("SALES");
%>	
	<tr><th>�ǸŹ�ȣ</th><td><input type="text" name="SALES_NO" size="52"
		readonly value="<%= sales.getSalesno() %>"/></td></tr>
	<tr><th>����ȣ</th><td><input type="text" name="CUST_NO" size="52"
		value="<%= sales.getCustno() %>"/></td></tr>
	<tr><th>��ǰ��ȣ</th><td><input type="text" name="PRD_ID" size="52"
		value="<%= sales.getPrdid() %>"/></td></tr>
	<tr><th>��ǰ����</th><td><input type="text" name="PRICE" size="52"
		value="<%= sales.getPrice() %>"/></td></tr>
	<tr><th>�Ǹż���</th><td><input type="text" name="AMOUNT" size="52"
		value="<%= sales.getAmount() %>"/></td></tr>
	<tr><th>�ǸŰ���</th><td><input type="text" name="TOTAL" size="52"
		value="<%= sales.getTotal() %>"/></td></tr>
	<tr><th>�Ǹų�¥</th><td><input type="date" name="SALES_DATE" style="width:380px;"
		value="<%= sales.getSalesdate() %>"/></td></tr>
	
	<tr><td colspan="2" align="center">
		<input type="submit" value="����" name="btn"/>
		<input type="submit" value="����" name="btn"/>
		<input type="submit" value="��ȸ" name="btn"/></td></tr>
	
	</table>
	</form>
	</div>
</section>
<footer>
	<h3 align="center">PENCAFE KOREA MANAGEMENT copyright 2022 All 
	right reserved</h3>
</footer>
<script type="text/javascript">
function check(){
	if(confirm("�۾��� �����Ͻðڽ��ϱ�?")){
		return true;
	}else{
		return false;
	}
}
</script>



</body>
</html>