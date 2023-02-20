package product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.Member;


@WebServlet("/productAll.do")
public class ProductAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		if(id==null) {
			response.sendRedirect("login.jsp?M=Y");
		}else {
		
		
		String select="select prd_id, brand, "+
				"category, prd_name, price, origin "+
				"from product_info";
			Connection con=null; Statement stmt=null;
			ResultSet rs=null;
			ArrayList list = new ArrayList();
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@127.0.0.1:1521/XE",
						"hr","hr");
				stmt = con.createStatement();
				rs = stmt.executeQuery(select);
				while(rs.next()) {
					Product prd = new Product();
					prd.setPrdid(rs.getString(1));
					prd.setBrand(rs.getString(2));
					prd.setCategory(rs.getString(3));
					prd.setName(rs.getString(4));
					prd.setPrice(rs.getInt(5));
					prd.setOrigin(rs.getString(6));
					list.add(prd);
				}
			}catch(Exception e) {
				
			}finally {
				try {
					con.close(); stmt.close(); rs.close();
				}catch(Exception e) {}
			}
			//조회결과를 출력하는 JSP(memberAll.jsp)로 전환
			//1.Redirect, 2.Forward, 3.둘 다
			request.setAttribute("LIST", list);
			RequestDispatcher rd = 
				request.getRequestDispatcher("productAll.jsp");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
