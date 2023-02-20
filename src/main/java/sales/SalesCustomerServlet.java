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

@WebServlet("/salesCustomer.do")
public class SalesCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SalesCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String select= "select c.cust_no, c.cust_name, to_char(c.join_date, 'YYYY-MM-DD'),"+
		               "s.finals, c.grade from customer_info c, "+
				       "(select cust_no, sum(total) finals from sales_info "+
		               "group by cust_no) s "+
				       "where c.cust_no = s.cust_no "+
		               "order by s.finals desc";
				     
			
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
					SalesCustomer salescust = new SalesCustomer(); 
					salescust.setCustno(rs.getString(1));
					salescust.setCustname(rs.getString(2));
					salescust.setJoindate(rs.getString(3));
					salescust.setFinals(rs.getInt(4));
					salescust.setGrade(rs.getString(5));
					list.add(salescust);
				}
			}catch(Exception e) {
				
			}finally {
				try {
					con.close(); stmt.close(); rs.close();
				}catch(Exception e) {}
			}
			
			request.setAttribute("LIST", list);
			RequestDispatcher rd = 
				request.getRequestDispatcher("salesCustomer.jsp");
			rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
