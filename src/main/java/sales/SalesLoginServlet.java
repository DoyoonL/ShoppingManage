package sales;

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


@WebServlet("/salesLogin.do")
public class SalesLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SalesLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("LOGINID");
		if(id==null) {
			response.sendRedirect("login.jsp?M=Y");
		}else {
		
		Connection con=null; 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521/XE",
					"hr","hr");
			}
		     catch(Exception e) {
			
		}finally {
			try {
				con.close();
			}catch(Exception e) {}
		}
		RequestDispatcher rd = 
			request.getRequestDispatcher("sales_page.jsp");
		rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
