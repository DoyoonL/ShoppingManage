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
	<h1 align="center">펜까페 상품 관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
    <br/>
	<h2 align="center">쇼핑몰 상품 등록</h2><br/>
	<form action="productRegister.do" method="post" 
			onSubmit="return check(this)">
	<div align="center">
	<table border="1">
	<tr><th>상품번호</th><td><input type="text" 
		name="PRD_ID" size="52"/></td></tr>
	<tr><th>브랜드</th><td>
		<select name="BRAND" style="width:370px;">
			<option value="Monblanc">몽블랑</option>
			<option value="Dupont">듀퐁</option>
			<option value="Grafvon">그라폰 파버카스텔</option>
			<option value="Parker">파카</option>
			<option value="Waterman">워터맨</option>
			<option value="Aurora">오로라</option>
			<option value="Pelican">펠리칸</option>
			<option value="Lamy">라미</option>
			<option value="Faber">파버카스텔</option>
			<option value="Sheaffer">쉐퍼</option>
			<option value="Pilot">파이롯트</option>
			<option value="Platinum">플래티넘</option>
			<option value="Sailor">세일러</option>
			<option value="Caran">까렌다쉬</option>
			<option value="Cross">크로스(노트, 지갑)</option>
			<option value="Moleskine">몰스킨(노트)</option>
			<option value="Claire">클레르퐁텐(노트)</option>
			<option value="Zequenz">지퀀스(노트)</option>
			<option value="Kyoto">교토(잉크)</option>
			<option value="Diamine">디아민(잉크)</option>
			<option value="Jherbin">제이허빈(잉크)</option>
			<option value="Swiss">스위스 밀리터리(지갑)</option>
			<option value="Land">랜드 스케이브(지갑)</option>
		</select></td></tr>
	<tr><th>카테고리</th><td>
		<select name="CATEGORY" style="width:370px;">
			<option value="FOUNTAIN">만년필</option>
			<option value="DIARY">다이어리/노트</option>
			<option value="INK">잉크</option>
			<option value="WALLET">지갑</option>
			<option value="BELT">벨트</option>
			<option value="PERFUME">향수</option>
			<option value="OTHER">잡화</option>
		</select></td></tr>
		
	<tr><th>상품 이름</th><td><input type="text"
		name="NAME" size="52"/></td></tr>
	<tr><th>상품 가격</th><td><input type="text"
		name="PRICE" size="52"/></td></tr>
	<tr><th>원산지</th><td><input type="text"
		name="ORIGIN" size="52"/></td></tr>		
	
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
	if(f.BRAND.value == ''){
		alert("브랜드를 선택하세요."); return false;
	}
	if(f.CATEGORY.value == ''){
		alert("카테고리를 선택하세요."); return false;
	}
	if(f.NAME.value == ''){
		alert("상품 이름을 입력하세요."); return false;
	}
	if(f.PRICE.value == ''){
		alert("상품 가격을 입력하세요."); return false;
	}
	if(f.ORIGIN.value == ''){
		alert("상품 원산지를 입력하세요."); return false;
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