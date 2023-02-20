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
	<h1 align="center">펜까페 매출관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">매출 정보 수정</h2>
	<div align="center">
	<form action="salesUpdate.do" method="post"
			onSubmit="return check()">
	<table border="1">
<%
	Sales sales=(Sales)request.getAttribute("SALES");
%>	
	<tr><th>판매번호</th><td><input type="text" name="SALES_NO" size="52"
		readonly value="<%= sales.getSalesno() %>"/></td></tr>
	<tr><th>고객번호</th><td><input type="text" name="CUST_NO" size="52"
		value="<%= sales.getCustno() %>"/></td></tr>
	<tr><th>상품번호</th><td><input type="text" name="PRD_ID" size="52"
		value="<%= sales.getPrdid() %>"/></td></tr>
	<tr><th>상품가격</th><td><input type="text" name="PRICE" size="52"
		value="<%= sales.getPrice() %>"/></td></tr>
	<tr><th>판매수량</th><td><input type="text" name="AMOUNT" size="52"
		value="<%= sales.getAmount() %>"/></td></tr>
	<tr><th>판매가격</th><td><input type="text" name="TOTAL" size="52"
		value="<%= sales.getTotal() %>"/></td></tr>
	<tr><th>판매날짜</th><td><input type="date" name="SALES_DATE" style="width:380px;"
		value="<%= sales.getSalesdate() %>"/></td></tr>
	
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