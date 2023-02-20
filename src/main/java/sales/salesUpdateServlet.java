package sales;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/salesUpdate.do")
public class salesUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public salesUpdateServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	String salesUpdate(HttpServletRequest req) {
		String salesno = req.getParameter("SALES_NO");
		String custno = req.getParameter("CUST_NO");
		String prdid = req.getParameter("PRD_ID");
		String price = req.getParameter("PRICE");
		String amount = req.getParameter("AMOUNT");
		String total = req.getParameter("TOTAL");
		String salesdate = req.getParameter("SALES_DATE");
		String year = salesdate.substring(0,4);
		String month = salesdate.substring(5,7);
		String date_ = salesdate.substring(8);
		salesdate = year+month+date_;
		String update = "update sales_info set cust_no=?,"+
		                "prd_id=?, price=?, amount=?,"+
				        "total=?, sales_date = to_date(?,'YYYYMMDD') "+
				        "where sales_no=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		String result = "";
		try {Class.forName("oracle.jdbc.OracleDriver");
		        con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","hr","hr");
		    pstmt=con.prepareStatement(update);
			pstmt.setString(1, custno);
			pstmt.setString(2, prdid);
			pstmt.setInt(3, Integer.parseInt(price));
			pstmt.setInt(4, Integer.parseInt(amount));
			pstmt.setInt(5, Integer.parseInt(total));
			pstmt.setString(6, salesdate);
			pstmt.setString(7, salesno);
			pstmt.executeUpdate();
			result = "OK";
		}catch(Exception e){ result = "NOK"; e.printStackTrace();
		
			
		}finally {
		             try { con.close(); pstmt.close();
		            	 
		             }catch(Exception e) {}
		}
		return result;
	}
	
	String salesDelete(String salesno){
		String delete= "delete from sales_info "+
	                   "where sales_no = ?";
		String result = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {Class.forName("oracle.jdbc.OracleDriver");
		        con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE",
				"hr","hr");
			pstmt=con.prepareStatement(delete);
			pstmt.setString(1, salesno);
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
		String salesno = request.getParameter("SALES_NO");
		String btn = request.getParameter("btn");
		String result = "";
		if(btn.equals("수정")) {
			result = salesUpdate(request);
			response.sendRedirect(
				"salesUpdateResult.jsp?R="+result);
		}else if(btn.equals("삭제")) {
		    result = salesDelete(salesno);
		    response.sendRedirect(
					"salesUpdateResult.jsp?R="+result);
		}else if(btn.equals("조회")) {
			response.sendRedirect("salesAll.do");
		}
	}

}
