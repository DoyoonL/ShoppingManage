package product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/productRegister.do")
public class ProductRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ProductRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("EUC-KR");
	String prdid = request.getParameter("PRD_ID");
	String brand = request.getParameter("BRAND");
	String category = request.getParameter("CATEGORY");
	String name = request.getParameter("NAME");
	String price = request.getParameter("PRICE");
	String origin = request.getParameter("ORIGIN");
	String insert = "insert into product_info "+
	                "values(?,?,?,?,?,?)";
	Connection con = null; 
	PreparedStatement pstmt = null;
	String result = "";
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","hr","hr");
		 pstmt = con.prepareStatement(insert);
		 pstmt.setInt(1, Integer.parseInt(prdid));
		 pstmt.setString(2, brand);
		 pstmt.setString(3, category);
		 pstmt.setString(4, name);
		 pstmt.setString(5, price);
		 pstmt.setString(6, origin);
		 pstmt.executeUpdate();
		 result = "OK";
	}catch(Exception e) { result = "NOK";
	                      e.printStackTrace();	
	}finally {
		        try{ con.close();  pstmt.close();
		        	
		        }catch(Exception e) {}
	}
	  response.sendRedirect("registerProductResult.jsp?R="+result);
	
 }
	               
}
