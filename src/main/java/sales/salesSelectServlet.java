package sales;

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




@WebServlet("/salesSelect.do")
public class salesSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public salesSelectServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String select = "select sales_no, cust_no, prd_id, price, amount, total,"+
				        "to_char(sales_date, 'YYYY-MM-DD') "+
	                    "from sales_info "+
				        "where sales_no = "+id;
		Connection con = null; 
		Statement stmt = null;
		ResultSet rs = null; 
		Sales sales = new Sales();
        try {Class.forName("oracle.jdbc.OracleDriver");
		     con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","hr","hr");
        	 stmt = con.createStatement();
        	 rs = stmt.executeQuery(select);
        	 rs.next();
        	 sales.setSalesno(rs.getString(1));
        	 sales.setCustno(rs.getString(2));
        	 sales.setPrdid(rs.getString(3));
        	 sales.setPrice(rs.getInt(4));
        	 sales.setAmount(rs.getInt(5));
        	 sales.setTotal(rs.getInt(6));
        	 sales.setSalesdate(rs.getString(7));

        }catch(Exception e) {
        	
        }finally {
                    try { con.close(); stmt.close(); rs.close();
                    	
                    }catch(Exception e){}
        }
         request.setAttribute("SALES", sales);
         RequestDispatcher r = 
        		  request.getRequestDispatcher("salesDetail.jsp");
         r.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
