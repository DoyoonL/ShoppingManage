package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/memberUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	String memberUpdate(HttpServletRequest req) {
		String id=req.getParameter("ID");//��ȣ
		String name=req.getParameter("NAME");//�̸�
		String tel=req.getParameter("TEL");//��ȭ
		String addr=req.getParameter("ADDR");//�ּ�
		String date=req.getParameter("DATE");//������
		//2022-07-29
		date=date.substring(0,4)+date.substring(5,7)+
				date.substring(8);
		String grade=req.getParameter("LEVEL");//���
		String city=req.getParameter("CITY");//�����ڵ�
		String update="update customer_info set cust_name=?,"+
			"phone=?,address=?,join_date=to_date(?,'YYYYMMDD'),"+
			"grade=?,city=? where cust_no=?";
		Connection con=null; PreparedStatement pstmt=null;
		String result = "";//update����� ���� ���� ����
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE",
					"hr","hr");
			pstmt=con.prepareStatement(update);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			pstmt.setString(3, addr);
			pstmt.setString(4, date);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setInt(7, Integer.parseInt(id));
			pstmt.executeUpdate();//update����
			result = "OK";
		}catch(Exception e) {
			result = "NOK";
			e.printStackTrace();
		}finally {
			try {
				con.close(); pstmt.close();
			}catch(Exception e) {}
		}
		return result;
	}
	
	String memberDelete(String memberID){
		String delete= "delete from customer_info "+
	                   "where cust_no = ?";
		String result = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {Class.forName("oracle.jdbc.OracleDriver");
		        con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE",
				"hr","hr");
			pstmt=con.prepareStatement(delete);
			pstmt.setString(1, memberID);
			pstmt.executeUpdate();
			result = "OK";
		}catch(Exception e) {
			result = "NOK"; e.printStackTrace();
		}finally {
			         try {
			        	     con.close();  pstmt.close();
			         }catch(Exception e) {}
		}
		 return result;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("ID");
		String btn = request.getParameter("btn");
		String result = "";
		if(btn.equals("����")) {
			result = memberUpdate(request);
			response.sendRedirect(
				"updateResult.jsp?R="+result);
		}else if(btn.equals("����")) {
				result = memberDelete(id);
				response.sendRedirect(
					"updateResult.jsp?R="+result);
		}else if(btn.equals("��ȸ")) {
			response.sendRedirect("memberAll.do");
		}

 }

}









