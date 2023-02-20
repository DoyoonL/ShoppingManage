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


@WebServlet("/salesRegister.do")
public class SalesRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SalesRegisterServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String salesno = request.getParameter("SALES_NO");
		String custno = request.getParameter("CUST_NO");
		String prdid = request.getParameter("PRD_ID");
		String price = request.getParameter("PRICE");
		String amount = request.getParameter("AMOUNT");
		String total = request.getParameter("TOTAL");
		String salesdate = request.getParameter("SALES_DATE");
		String year = salesdate.substring(0,4);
		String month = salesdate.substring(5,7);
		String date_ = salesdate.substring(8);
		salesdate = year+month+date_;
		String insert = "insert into sales_info "+
		                "values(?,?,?,?,?,?,to_date(?,'YYYYMMDD'))";
		Connection con = null; 
		PreparedStatement pstmt = null;
		String result = "";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE","hr","hr");
			 pstmt = con.prepareStatement(insert);
			 pstmt.setString(1, salesno);
			 pstmt.setString(2, custno);
			 pstmt.setString(3, prdid);
			 pstmt.setInt(4, Integer.parseInt(price));
			 pstmt.setInt(5, Integer.parseInt(amount));
			 pstmt.setInt(6, Integer.parseInt(total));
			 pstmt.setString(7, salesdate);
			 pstmt.executeUpdate();
			 result = "OK";
		}catch(Exception e) { result = "NOK";
		                      e.printStackTrace();	
		}finally {
			        try{ con.close();  pstmt.close();
			        	
			        }catch(Exception e) {}
		}
		  response.sendRedirect("registerSalesResult.jsp?R="+result);
	}

}
