<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String result=request.getParameter("R");
	if(result.equals("OK")){
%>
	<script type="text/javascript">
		alert("���������� �����Ǿ����ϴ�.");
		location.href="index.jsp";
	</script>
<% } else { %>
	<script type="text/javascript">
		alert("���������� �������� �ʾҽ��ϴ�.");
		location.href="index.jsp";
	</script>
<% } %>
</body>
</html>