<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
<a href="index.jsp"><b>�� Ȩ����</b></a><br/>

<div align="center">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href="memberEntry.do"><b>�� �� ���</b></a>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                                       
<a href="memberAll.do"><b>�� �� ��ȸ / ���� / ����</b></a><br/><br/>

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
 
 <a href="productEntry.do"><b>�� ��ǰ ���</b></a>

                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
                                         
<a href="productAll.do"><b>�� ��ǰ ��ȸ / ���� / ����</b></a><br/><br/>

<a href="salesEntry.do"><b>�� ���� ���</b></a>

                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                                           
    <a href="salesLogin.do"><b>$$$ ���� ��ȸ</b></a><br/>

</div>

<% 
      String id = (String)session.getAttribute("LOGINID");
      if (id == null){
%>
<a href="login.jsp"><b>�� �α���</b></a>
<% 
      }else{
%>
<td>
<table><tr><td>
<font color="skyblue">ȯ���մϴ�~ <br/> <%=id %>��~</font></br>
</td></tr></table>
<a href="logout.do"><b>�� �α׾ƿ�</b></a>  

<% 
      }
%>





