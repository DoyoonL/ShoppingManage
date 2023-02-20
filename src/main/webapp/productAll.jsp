<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, product.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_select.css">
</head>
<body>
<header>
	<h1 align="center">펜까페 상품관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">전체 상품목록 조회/수정</h2>
	<div align="center">
	<table border="1">
	<tr><th>상품번호</th><th>브랜드</th><th>카테고리</th>
		<th>이름</th><th>가격</th><th>원산지</th></tr>
<%
	ArrayList products = (ArrayList)request.getAttribute("LIST");
	int size = products.size();
	for(int i=0; i<size; i++){
		Product prd = (Product)products.get(i);
%>
	<tr><td align="center"><a href="productSelect.do?ID=<%= prd.getPrdid() %>"><%= prd.getPrdid() %></a></td>
	<td align="center">
<%
		String b = prd.getBrand();
		if(b.equals("Monblanc")){
			out.print("몽블랑");
		}else if(b.equals("Dupont")){
			out.print("듀퐁");
		}else if(b.equals("Grafvon")){
			out.print("그라폰 파버카스텔");	
		}else if(b.equals("Parker")){
			out.print("파카");	
		}else if(b.equals("Waterman")){
			out.print("워터맨");	
		}else if(b.equals("Aurora")){
			out.print("오로라");	
		}else if(b.equals("Pelican")){
			out.print("펠리칸");	
		}else if(b.equals("Lamy")){
			out.print("라미");	
		}else if(b.equals("Faber")){
			out.print("파버카스텔");	
		}else if(b.equals("Sheaffer")){
			out.print("쉐퍼");	
		}else if(b.equals("Pilot")){
			out.print("파이롯트");	
		}else if(b.equals("Platinum")){
			out.print("플래티넘");	
		}else if(b.equals("Sailor")){
			out.print("세일러");	
		}else if(b.equals("Caran")){
			out.print("까렌다쉬");	
		}else if(b.equals("Cross")){
			out.print("크로스(노트, 지갑)");	
		}else if(b.equals("Moleskine")){
			out.print("몰스킨(노트)");	
		}else if(b.equals("Claire")){
			out.print("클레르퐁텐(노트)");	
		}else if(b.equals("Zequenz")){
			out.print("지퀀스(노트)");	
		}else if(b.equals("Kyoto")){
			out.print("교토(잉크)");	
		}else if(b.equals("Diamine")){
			out.print("디아민(잉크)");	
		}else if(b.equals("Jherbin")){
			out.print("제이허빈(잉크)");	
		}else if(b.equals("Swiss")){
			out.print("스위스 밀리터리(지갑)");	
		}else if(b.equals("Land")){
			out.print("랜드 스케이브(지갑)");	
		}
%>
		</td>
		<td align="center">
		<%
		String c = prd.getCategory();
		if(c.equals("FOUNTAIN")){
			out.print("만년필");
		}else if(c.equals("DIARY")){
			out.print("다이어리/노트");
		}else if(c.equals("INK")){
			out.print("잉크");	
		}else if(c.equals("WALLET")){
			out.print("지갑");	
		}else if(c.equals("BELT")){
			out.print("벨트");	
		}else if(c.equals("PERFUME")){
			out.print("향수");	
		}else if(c.equals("OTHER")){
			out.print("잡화");	
		}
%>
		</td>
	
		<td align="center"><%= prd.getName() %></td>
		<td align="right"><%= prd.getPrice() %></td>
		<td align="center"><%= prd.getOrigin() %></td></tr>
		
<% 
	}
%>		

	</table>
	</div>
</section>
<footer>
	<h3 align="center">PENCAFE KOREA MANAGEMENT copyright 2022 All 
	right reserved</h3>
</footer>
</body>
</html>