<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_detail.css">
</head>
<body>
<header>
	<h1 align="center">����� ������ ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">�� ���� ����</h2>
	<div align="center">
	<form action="memberUpdate.do" method="post"
			onSubmit="return check()">
	<table border="1">
<%
	Member member=(Member)request.getAttribute("MEM");
%>	
	<tr><th>ȸ����ȣ</th><td><input type="text" name="ID"  size="52"
		readonly value="<%= member.getCustno() %>"/></td></tr>
	<tr><th>ȸ������</th><td><input type="text" name="NAME" size="52"
		value="<%= member.getName() %>"/></td></tr>
	<tr><th>ȸ����ȭ</th><td><input type="text" name="TEL" size="52"
		value="<%= member.getTel() %>"/></td></tr>
	<tr><th>ȸ���ּ�</th><td><input type="text" name="ADDR" size="52"
		value="<%= member.getAddr() %>"/></td></tr>
	<tr><th>��������</th><td><input type="date" name="DATE" style="width:380px;"
		value="<%= member.getDate() %>"/></td></tr>
	<tr><th>�����</th><td><input type="text"
		name="LEVEL" size="52" value="<%= member.getGrade() %>"/></td></tr>
	<tr><th>�����ڵ�</th><td><input type="text" name="CITY" size="52"
		value="<%= member.getCode() %>"/></td></tr>
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




