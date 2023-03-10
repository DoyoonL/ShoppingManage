package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberEntryServlet
 */
@WebServlet("/memberEntry.do")
public class MemberEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEntryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 여부를 검사
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		if(id == null) {response.sendRedirect("login.jsp?M=Y");  // M파라미터에 Y가 있으니까, login.jsp에 가보면
		}
		else {  // 포워드 끝에서 } 닫아주세요
			
		//고객정보테이블에서 가장 큰 회원번호를 찾는다.
		String select="select max(cust_no) from customer_info";
		int custno = 0;//조회된 고객번호를 위한 변수
		Connection con=null; Statement stmt=null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE",
					"hr","hr");
			stmt=con.createStatement();
			rs = stmt.executeQuery(select);//select 실행
			rs.next();//조회 결과로 이동
			custno = rs.getInt(1);//첫번째 조회결과를 수신
			custno = custno + 1;//새 고객의 고객번호
		}catch(Exception e) {
			
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			}catch(Exception e) {}
		}
		//custno를 entry.jsp로 넘겨준다.
		//Forward
		RequestDispatcher rd = 
				request.getRequestDispatcher(
					"entry.jsp?ID="+custno);
		rd.forward(request, response); }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
