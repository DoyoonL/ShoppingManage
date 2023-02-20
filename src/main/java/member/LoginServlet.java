package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String pwd = request.getParameter("PWD");
		// 고객정보 테이블에 있는 계정과 암호와 비교한다
		String select = "select password from account_info "+
		                "where id = ?";
		String result = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {Class.forName("oracle.jdbc.OracleDriver");
		     con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE",
				"hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 조회결과로 이동 성공. 즉 조회결과 있음
                               String pwdInDB = rs.getString(1); // 조회결과
                               
                               if(pwdInDB.equals(pwd)) {
                            	        result = "OK";    // 로그인 성공
                               
                            	        HttpSession session = 
                            		   request.getSession();
                               
                               session.setAttribute("LOGINID", id);
                               
                               }else {
                            	        result = "NOPWD";  // 암호 불일치
                               }
			}else { // 조회결과로 이동 실패. 즉 조회결과가 없음
				                 result = "NOID";   // 계정 없음
			}
			
		}catch(Exception e) {
			
		}finally {
			          try {  con.close();  pstmt.close(); rs.close();
			        	   
			          }catch(Exception e) {}
		}
	            // 로그인 결과 JSP(loginResult.jsp)로 전환
		        // 로그인 결과 나왔으니 새로고침 누를 때 마다 DB를 갈 필요가 없다
		        // 포워드로 하면 새로고침하면 서블릿이 계속 실행된다
		        response.sendRedirect("loginResult.jsp?R="+result);
	}

}
