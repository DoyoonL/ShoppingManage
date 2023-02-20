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


@WebServlet("/Monthsales.do")
public class MonthSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MonthSalesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String select= "select substr(to_char(sales_date,'YYYY-MM-DD'),1,7),"+
				       "sum(total) "+ 
                       "from sales_info "+
                       "group by substr(to_char(sales_date,'YYYY-MM-DD'),1,7)";
	
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
			DaySales daysales = new DaySales();
			daysales.setSalesdate(rs.getString(1));
			daysales.setFinals(rs.getInt(2));
			list.add(daysales);
		}
	}catch(Exception e) {
		
	}finally {
		try {
			con.close(); stmt.close(); rs.close();
		}catch(Exception e) {}
	}
	
	request.setAttribute("LIST", list);
	RequestDispatcher rd = 
		request.getRequestDispatcher("monthSales.jsp");
	rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
