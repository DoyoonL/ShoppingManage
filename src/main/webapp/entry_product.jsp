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
	<h1 align="center">����� ��ǰ ���� ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
    <br/>
	<h2 align="center">���θ� ��ǰ ���</h2><br/>
	<form action="productRegister.do" method="post" 
			onSubmit="return check(this)">
	<div align="center">
	<table border="1">
	<tr><th>��ǰ��ȣ</th><td><input type="text" 
		name="PRD_ID" size="52"/></td></tr>
	<tr><th>�귣��</th><td>
		<select name="BRAND" style="width:370px;">
			<option value="Monblanc">�����</option>
			<option value="Dupont">����</option>
			<option value="Grafvon">�׶��� �Ĺ�ī����</option>
			<option value="Parker">��ī</option>
			<option value="Waterman">���͸�</option>
			<option value="Aurora">���ζ�</option>
			<option value="Pelican">�縮ĭ</option>
			<option value="Lamy">���</option>
			<option value="Faber">�Ĺ�ī����</option>
			<option value="Sheaffer">����</option>
			<option value="Pilot">���̷�Ʈ</option>
			<option value="Platinum">�÷�Ƽ��</option>
			<option value="Sailor">���Ϸ�</option>
			<option value="Caran">��ٽ�</option>
			<option value="Cross">ũ�ν�(��Ʈ, ����)</option>
			<option value="Moleskine">����Ų(��Ʈ)</option>
			<option value="Claire">Ŭ��������(��Ʈ)</option>
			<option value="Zequenz">������(��Ʈ)</option>
			<option value="Kyoto">����(��ũ)</option>
			<option value="Diamine">��ƹ�(��ũ)</option>
			<option value="Jherbin">�������(��ũ)</option>
			<option value="Swiss">������ �и��͸�(����)</option>
			<option value="Land">���� �����̺�(����)</option>
		</select></td></tr>
	<tr><th>ī�װ�</th><td>
		<select name="CATEGORY" style="width:370px;">
			<option value="FOUNTAIN">������</option>
			<option value="DIARY">���̾/��Ʈ</option>
			<option value="INK">��ũ</option>
			<option value="WALLET">����</option>
			<option value="BELT">��Ʈ</option>
			<option value="PERFUME">���</option>
			<option value="OTHER">��ȭ</option>
		</select></td></tr>
		
	<tr><th>��ǰ �̸�</th><td><input type="text"
		name="NAME" size="52"/></td></tr>
	<tr><th>��ǰ ����</th><td><input type="text"
		name="PRICE" size="52"/></td></tr>
	<tr><th>������</th><td><input type="text"
		name="ORIGIN" size="52"/></td></tr>		
	
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
	if(f.BRAND.value == ''){
		alert("�귣�带 �����ϼ���."); return false;
	}
	if(f.CATEGORY.value == ''){
		alert("ī�װ��� �����ϼ���."); return false;
	}
	if(f.NAME.value == ''){
		alert("��ǰ �̸��� �Է��ϼ���."); return false;
	}
	if(f.PRICE.value == ''){
		alert("��ǰ ������ �Է��ϼ���."); return false;
	}
	if(f.ORIGIN.value == ''){
		alert("��ǰ �������� �Է��ϼ���."); return false;
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