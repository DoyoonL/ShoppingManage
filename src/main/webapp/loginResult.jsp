<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link type="text/css" rel="stylesheet" href="Design_login.css">
</head>
<body>
<header>
	<h1 align="center">����� ���θ� ��, ��ǰ, ������� ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
<div align="center">
	<h2 align="center">�α��� ���</h2>
<% 
      String result = request.getParameter("R");

      if(result.equals("OK")){ // �α��� ���� �޽��� ���
          String id = (String) session.getAttribute("LOGINID");
          out.print("ȯ���մϴ�~ "+id+"�� ^^ ���õ� ���� �Ϸ� �Ǽ��� ~");
          
      }else if(result.equals("NOPWD")){ // ��ȣ ����ġ �޼��� ���
    	  out.print("��ȣ�� ��ġ���� �ʽ��ϴ�. ��ȣ�� Ȯ���ϼ���");
      
      }else if(result.equals("NOID")){ // �������� �޽��� ���
    	  out.print("������ �����ϴ�. ���� �� �̿����ּ���");
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