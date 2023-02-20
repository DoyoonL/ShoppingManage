<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, member.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_select.css">
</head>
<body>
<header>
	<h1 align="center">펜까페 고객관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
	<h2 align="center">고객목록 조회/수정</h2>
	<div align="center">
	<table border="1">
	<tr><th>고객번호</th><th>고객성명</th><th>전화번호</th>
		<th>주소</th><th>가입일자</th><th>고객등급</th>
		<th>거주지역</th></tr>
<%
	ArrayList members=(ArrayList)request.getAttribute("ALL");
	int size = members.size();
	for(int i=0; i<size; i++){
		Member mem = (Member)members.get(i);
%>
	<tr><td align="center"><a href="memberSelect.do?ID=<%= mem.getCustno() %>"><%= mem.getCustno() %></a></td>
		<td align="center"><%= mem.getName() %></td>
		<td align="center"><%= mem.getTel() %></td>
		<td align="center"><%= mem.getAddr() %></td>
		<td align="center"><%= mem.getDate() %></td>
		<td align="center">
<%
		String g = mem.getGrade();
		if(g.equals("VIP")){
			out.print("VIP");
		}else if(g.equals("FAMILY")){
			out.print("패밀리");
		}else if(g.equals("NORMAL")){
			out.print("일반");	
		}else if(g.equals("NEW")){
			out.print("신규");
		}
%>
		</td>
		<td align="center">
<%
		String c = mem.getCode();
		if(c.equals("Seoul")){
			out.print("서울");
		}else if(c.equals("Kyungki")){
			out.print("경기도");
		}else if(c.equals("Kangwon")){
			out.print("강원도");	
		}else if(c.equals("Choongbook")){
			out.print("충청북도");	
		}else if(c.equals("Choongnam")){
			out.print("충청남도");	
		}else if(c.equals("Junbook")){
			out.print("전라북도");	
		}else if(c.equals("Junnam")){
			out.print("전라남도");	
		}else if(c.equals("Kyungbook")){
			out.print("경상북도");	
		}else if(c.equals("Kyungnam")){
			out.print("경상남도");	
		}
%>
		</td></tr>
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




