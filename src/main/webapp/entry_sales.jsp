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
<header>
	<h1 align="center">����� ���� ���� ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
    <br/>
	<h2 align="center">���θ� ���� ���</h2><br/>
	<form action="salesRegister.do" method="post" 
			onSubmit="return check(this)">
	<div align="center">
	<table border="1">
	<tr><th>�ǸŹ�ȣ</th><td><input type="text" 
		name="SALES_NO" size="52"/></td></tr>
	<tr><th>����ȣ</th><td><input type="text"
		name="CUST_NO" size="52"/></td></tr>
	<tr><th>��ǰ��ȣ</th><td><input type="text"
		name="PRD_ID" size="52"/></td></tr>
	<tr><th>�ܰ�</th><td><input type="text"
		name="PRICE" size="52"/></td></tr>		
	<tr><th>�Ǹż���</th><td><input type="text"
		name="AMOUNT" size="52"/></td></tr>
	<tr><th>�ǸŰ���</th><td><input type="text"
		name="TOTAL" size="52"/></td></tr>
	<tr><th>�Ǹ�����</th><td><input type="date"
		name="SALES_DATE" style="width:365px;"/></td></tr>
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
function check(f){
	if(f.SALES_NO.value == ''){
		alert("�ǸŹ�ȣ�� �Է��ϼ���."); return false;
	}
	if(f.CUST_NO.value == ''){
		alert("����ȣ�� �Է��ϼ���."); return false;
	}
	if(f.PRD_ID.value == ''){
		alert("��ǰ��ȣ�� �Է��ϼ���."); return false;
	}
	if(f.PRICE.value == ''){
		alert("������ �Է��ϼ���."); return false;
	}
	if(f.AMOUNT.value == ''){
		alert("�Ǹż����� �Է��ϼ���."); return false;
	}
	if(f.SALES_DATE.value == ''){
		alert("�Ǹż����� �Է��ϼ���."); return false;
	}
	if(confirm("�Է��� ������ �½��ϱ�?")){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
</body>
</html>