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
	<h1 align="center">펜까페 고객관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
    <br/>
	<h2 align="center">쇼핑몰 고객 등록</h2><br/>
	<form action="memberRegister.do" method="post" 
			onSubmit="return check(this)">
	<div align="center">
	<table border="1">
	<tr><th>고객번호</th><td><input type="text" 
		name="ID" readonly value="<%= id %>" size="52"/></td></tr>
	<tr><th>고객성명</th><td><input type="text"
		name="NAME" size="52"/></td></tr>
	<tr><th>고객전화</th><td><input type="text"
		name="TEL" size="52"/></td></tr>
	<tr><th>고객주소</th><td><input type="text"
		name="ADDR" size="52"/></td></tr>
	<tr><th>가입일자</th><td><input type="date"
		name="DATE" style="width:365px;"/></td></tr>
	<tr><th>고객등급</th><td>
		<select name="LEVEL" style="width:370px;">
			<option value="VIP">VIP</option>
			<option value="FAMILY">패밀리</option>
			<option value="NORMAL">일반</option>
			<option value="NEW">신규</option>
		</select></td></tr>
	<tr><th>지역</th><td>
		<select name="CITY" style="width:370px;">
			<option value="Seoul">서울</option>
			<option value="Kyungki">경기도</option>
			<option value="Kangwon">강원도</option>
			<option value="Choongbook">충청북도</option>
			<option value="Choongnam">충청남도</option>
			<option value="Junbook">전라북도</option>
			<option value="Junnam">전라남도</option>
			<option value="Kyungbook">경상북도</option>
			<option value="Kyungnam">경상남도</option>
		</select></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="등록" name="btn"/>
		<input type="button" value="조회" 
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
	if(confirm("정말로 조회하시겠습니까?")){
		location.href="memberAll.do";//조회서블릿 호출
	}
}
function check(frm){
	if(frm.NAME.value == ''){
		alert("이름을 입력하세요."); return false;
	}
	if(frm.TEL.value == ''){
		alert("회원전화를 입력하세요."); return false;
	}
	if(frm.ADDR.value == ''){
		alert("주소를 입력하세요."); return false;
	}
	if(frm.DATE.value == ''){
		alert("날짜를 선택하세요."); return false;
	}
	if(confirm("입력한 내용이 맞습니까?")){
		return true;
	}else{
		return false;
	}
}
</script>
</body>
</html>









