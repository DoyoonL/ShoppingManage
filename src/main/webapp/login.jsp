<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="Design_login.css">
</head>
<body>
<header>
	<h1 align="center">����� ���θ� ����, ��ǰ, ������� ver1.0</h1>
</header>
<menu>
	<jsp:include page="menu_header.jsp"/>
</menu>
<section>
<% 
       String m = request.getParameter("M");     
       if(m != null){
%>
  <script type="text/javascript">
      alert("���񽺸� �̿��Ͻ÷���, �α��� �ؾ� �մϴ�");
  
  </script>
<% 
       }
%>
	<br/><br/>
	<h2 align="center">�� �� ��</h2><br/>
	<div align="center">
	<form action="login.do" method="post" onSubmit="return check(this)">
	�� �� : <input type="text" name="ID" size="50"/><br/><br/>
	�� ȣ : <input type="password" name="PWD" size="50"/><br/><br/>
	<input type="submit" value="�α���"/>
	<input type="reset" value="�� ��"/>
	</form>
	</div>
</section>
<footer>
	<h3 align="center">PENCAFE KOREA MANAGEMENT copyright 2022 All 
	right reserved</h3>
</footer>
<script type="text/javascript">
function check(f){
         if(f.ID.value=='') {
        	 alert("������ �Է��ϼ���"); return false;
         }	
         if(f.PWD.value=='') {
        	 alert("��ȣ�� �Է��ϼ���"); return false;
         }
}
</script>
</body>
</html>