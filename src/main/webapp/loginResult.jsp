<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link type="text/css" rel="stylesheet" href="Design_login.css">
</head>
<body>
<header>
	<h1 align="center">펜까페 쇼핑몰 고객, 상품, 매출관리 ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
<div align="center">
	<h2 align="center">로그인 결과</h2>
<% 
      String result = request.getParameter("R");

      if(result.equals("OK")){ // 로그인 성공 메시지 출력
          String id = (String) session.getAttribute("LOGINID");
          out.print("환영합니다~ "+id+"님 ^^ 오늘도 좋은 하루 되세요 ~");
          
      }else if(result.equals("NOPWD")){ // 암호 불일치 메세지 출력
    	  out.print("암호가 일치하지 않습니다. 암호를 확인하세요");
      
      }else if(result.equals("NOID")){ // 계정없음 메시지 출력
    	  out.print("계정이 없습니다. 가입 후 이용해주세요");
      }
%>	
</div>
</section>
<footer>
	<h3 align="center">PENCAFE KOREA MANAGEMENT copyright 2022 All 
	right reserved</h3>
</footer>
</body>
</html>