<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
<a href="index.jsp"><b>♨ 홈으로</b></a><br/>

<div align="center">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href="memberEntry.do"><b>☞ 고객 등록</b></a>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                                       
<a href="memberAll.do"><b>♠ 고객 조회 / 수정 / 삭제</b></a><br/><br/>

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
 
 <a href="productEntry.do"><b>☞ 상품 등록</b></a>

                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
                                         
<a href="productAll.do"><b>♣ 상품 조회 / 수정 / 삭제</b></a><br/><br/>

<a href="salesEntry.do"><b>☞ 매출 등록</b></a>

                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                                           
    <a href="salesLogin.do"><b>$$$ 매출 조회</b></a><br/>

</div>

<% 
      String id = (String)session.getAttribute("LOGINID");
      if (id == null){
%>
<a href="login.jsp"><b>◈ 로그인</b></a>
<% 
      }else{
%>
<td>
<table><tr><td>
<font color="skyblue">환영합니다~ <br/> <%=id %>님~</font></br>
</td></tr></table>
<a href="logout.do"><b>◈ 로그아웃</b></a>  

<% 
      }
%>





