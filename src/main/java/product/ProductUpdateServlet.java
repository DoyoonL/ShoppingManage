package product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/productUpdate.do")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ProductUpdateServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	String productUpdate(HttpServletRequest req) {
		String prdid = req.getParameter("PRD_ID");
		String brand = req.getParameter("BRAND");
		String category = req.getParameter("CATEGORY");
		String name = req.getParameter("NAME");
		String price = req.getParameter("PRICE");
		String origin = req.getParameter("ORIGIN");
		String update = "update product_info set brand=?,"+
		                "category=?, prd_name=?, price=?, origin=? "+
				        "where prd_id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		String result = "";
		try {Class.forName("oracle.jdbc.OracleDriver");
		        con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","hr","hr");
		    pstmt=con.prepareStatement(update);
			pstmt.setString(1, brand);
			pstmt.setString(2, category);
			pstmt.setString(3, name);
			pstmt.setInt(4, Integer.parseInt(price));
			pstmt.setString(5, origin);
			pstmt.setString(6, prdid);
			pstmt.executeUpdate();
			result = "OK";
		}catch(Exception e){ result = "NOK"; e.printStackTrace();
		
			
		}finally {
		             try { con.close(); pstmt.close();
		            	 
		             }catch(Exception e) {}
		}
		return result;
	}
	
	String productDelete(String prdID){
		String delete= "delete from product_info "+
	                   "where prd_id = ?";
		String result = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {Class.forName("oracle.jdbc.OracleDriver");
		        con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE",
				"hr","hr");
			pstmt=con.prepareStatement(delete);
			pstmt.setString(1, prdID);
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
		String prdid = request.getParameter("PRD_ID");
		String btn = request.getParameter("btn");
		String result = "";
		if(btn.equals("수정")) {
			result = productUpdate(request);
			//페이지를 수정의 결과(updateResult.jsp)로 바꿈.
			response.sendRedirect(
				"productUpdateResult.jsp?R="+result);
		}else if(btn.equals("삭제")) {
		    result = productDelete(prdid);
		    response.sendRedirect(
					"productUpdateResult.jsp?R="+result);
		}else if(btn.equals("조회")) {
			//조회 서블릿을 호출한다.
			response.sendRedirect("productAll.do");
		}
	}

}
