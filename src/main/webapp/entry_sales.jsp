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
	<h1 align="center">펜까페 매출 관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
    <br/>
	<h2 align="center">쇼핑몰 매출 등록</h2><br/>
	<form action="salesRegister.do" method="post" 
			onSubmit="return check(this)">
	<div align="center">
	<table border="1">
	<tr><th>판매번호</th><td><input type="text" 
		name="SALES_NO" size="52"/></td></tr>
	<tr><th>고객번호</th><td><input type="text"
		name="CUST_NO" size="52"/></td></tr>
	<tr><th>상품번호</th><td><input type="text"
		name="PRD_ID" size="52"/></td></tr>
	<tr><th>단가</th><td><input type="text"
		name="PRICE" size="52"/></td></tr>		
	<tr><th>판매수량</th><td><input type="text"
		name="AMOUNT" size="52"/></td></tr>
	<tr><th>판매가격</th><td><input type="text"
		name="TOTAL" size="52"/></td></tr>
	<tr><th>판매일자</th><td><input type="date"
		name="SALES_DATE" style="width:365px;"/></td></tr>
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
function check(f){
	if(f.SALES_NO.value == ''){
		alert("판매번호를 입력하세요."); return false;
	}
	if(f.CUST_NO.value == ''){
		alert("고객번호를 입력하세요."); return false;
	}
	if(f.PRD_ID.value == ''){
		alert("상품번호을 입력하세요."); return false;
	}
	if(f.PRICE.value == ''){
		alert("가격을 입력하세요."); return false;
	}
	if(f.AMOUNT.value == ''){
		alert("판매수량을 입력하세요."); return false;
	}
	if(f.SALES_DATE.value == ''){
		alert("판매수량을 입력하세요."); return false;
	}
	if(confirm("입력한 내용이 맞습니까?")){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
</body>
</html>