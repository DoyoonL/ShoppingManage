<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_entry.css">
</head>
<body>
<%
	String id=request.getParameter("ID");
%>
<header>
	<h1 align="center">����� ������ ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
    <br/>
	<h2 align="center">���θ� �� ���</h2><br/>
	<form action="memberRegister.do" method="post" 
			onSubmit="return check(this)">
	<div align="center">
	<table border="1">
	<tr><th>����ȣ</th><td><input type="text" 
		name="ID" readonly value="<%= id %>" size="52"/></td></tr>
	<tr><th>������</th><td><input type="text"
		name="NAME" size="52"/></td></tr>
	<tr><th>����ȭ</th><td><input type="text"
		name="TEL" size="52"/></td></tr>
	<tr><th>���ּ�</th><td><input type="text"
		name="ADDR" size="52"/></td></tr>
	<tr><th>��������</th><td><input type="date"
		name="DATE" style="width:365px;"/></td></tr>
	<tr><th>�����</th><td>
		<select name="LEVEL" style="width:370px;">
			<option value="VIP">VIP</option>
			<option value="FAMILY">�йи�</option>
			<option value="NORMAL">�Ϲ�</option>
			<option value="NEW">�ű�</option>
		</select></td></tr>
	<tr><th>����</th><td>
		<select name="CITY" style="width:370px;">
			<option value="Seoul">����</option>
			<option value="Kyungki">��⵵</option>
			<option value="Kangwon">������</option>
			<option value="Choongbook">��û�ϵ�</option>
			<option value="Choongnam">��û����</option>
			<option value="Junbook">����ϵ�</option>
			<option value="Junnam">���󳲵�</option>
			<option value="Kyungbook">���ϵ�</option>
			<option value="Kyungnam">��󳲵�</option>
		</select></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="���" name="btn"/>
		<input type="button" value="��ȸ" 
					onClick="doSelect()"/>
		</td></tr>
	</table>
	</div>
	</form>
</section>
<footer>
	<h3 align="center">PENCAFE KOREA MANAGEMENT copyright 2022 All 
	right reserved</h3>
</footer>
<script type="text/javascript">
function doSelect(){
	if(confirm("������ ��ȸ�Ͻðڽ��ϱ�?")){
		location.href="memberAll.do";//��ȸ���� ȣ��
	}
}
function check(frm){
	if(frm.NAME.value == ''){
		alert("�̸��� �Է��ϼ���."); return false;
	}
	if(frm.TEL.value == ''){
		alert("ȸ����ȭ�� �Է��ϼ���."); return false;
	}
	if(frm.ADDR.value == ''){
		alert("�ּҸ� �Է��ϼ���."); return false;
	}
	if(frm.DATE.value == ''){
		alert("��¥�� �����ϼ���."); return false;
	}
	if(confirm("�Է��� ������ �½��ϱ�?")){
		return true;
	}else{
		return false;
	}
}
</script>
</body>
</html>









