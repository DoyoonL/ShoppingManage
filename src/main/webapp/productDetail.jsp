<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "product.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_detail.css">
</head>
<body>
<header>
	<h1 align="center">펜까페 상품관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">상품 정보 수정</h2>
	<div align="center">
	<form action="productUpdate.do" method="post"
			onSubmit="return check()">
	<table border="1">
<%
	Product product=(Product)request.getAttribute("PRD");
%>	
	<tr><th>상품번호</th><td><input type="text" name="PRD_ID" size="52"
		readonly value="<%= product.getPrdid() %>"/></td></tr>
	<tr><th>브랜드</th><td><input type="text" name="BRAND" size="52"
		value="<%= product.getBrand() %>"/></td></tr>
	<tr><th>카테고리</th><td><input type="text" name="CATEGORY" size="52"
		value="<%= product.getCategory() %>"/></td></tr>
	<tr><th>상품이름</th><td><input type="text" name="NAME" size="52"
		value="<%= product.getName() %>"/></td></tr>
	<tr><th>상품가격</th><td><input type="text" name="PRICE" size="52"
		value="<%= product.getPrice() %>"/></td></tr>
	<tr><th>원산지</th><td><input type="text" size="52"
		name="ORIGIN" value="<%= product.getOrigin() %>"/></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="수정" name="btn"/>
		<input type="submit" value="삭제" name="btn"/>
		<input type="submit" value="조회" name="btn"/></td></tr>
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
	if(confirm("작업을 진행하시겠습니까?")){
		return true;
	}else{
		return false;
	}
}
</script>


</body>
</html>