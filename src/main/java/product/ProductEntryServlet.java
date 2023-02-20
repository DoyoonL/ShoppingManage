package product;

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


@WebServlet("/productEntry.do")
public class ProductEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ProductEntryServlet() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("LOGINID");
				if(id == null) {response.sendRedirect("login.jsp?M=Y");  // M파라미터에 Y가 있으니까, login.jsp에 가보면
				}
				else {  // 포워드 끝에서 } 닫아주세요
					
				
				Connection con=null;  Statement stmt=null;
				String result = "";
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					con = DriverManager.getConnection(
							"jdbc:oracle:thin:@127.0.0.1:1521/XE",
							"hr","hr");
					stmt=con.createStatement();
					result = "OK";
					
				}catch(Exception e) {
					                     result = "NOK"; 
					                     e.printStackTrace();
				}finally {
					try {
						con.close(); stmt.close(); 
					}catch(Exception e) {}
				}
				
				RequestDispatcher rd = 
						request.getRequestDispatcher(
							"entry_product.jsp");
				rd.forward(request, response); 
				}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
