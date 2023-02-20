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

/**
 * Servlet implementation class PrdSalesServlet
 */
@WebServlet("/productSales.do")
public class PrdSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrdSalesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String select = "select p.prd_id, p.brand, p.category, p.prd_name, s.finals,"+
                 "from product_info p,"+
		         "(select prd_id, sum(total) finals from sales_info"+
                 "group by prd_id) s" +
		         "where p.prd_id = s.prd_id "+
                 "order by s.finals desc";
 
 // "select p.prd_id, p.brand, p.category, (s.price*s.amount) total,"+
 // "s.sales_date from product_info p, sales_info s "+
 // "where p.prd_id = s.prd_id and s.sales_date = to_date(?, YYYY/MM/DD)"+
 // "and p.prd_id = ?";
 
 // "select s.sales_date,  // 일별 매출 
 //  p.prd_id, p.brand, p.category, s.finals,"+
 // "from product_info p,"+
 // "(select prd_id, sales_date, sum(total) finals from sales_info"+
 // "group by prd_id) s" +
 // "where p.prd_id = s.prd_id "+
 // "order by s.final desc";
 
 // "select substr(s.sales_date,1,7) MM  // 월별 매출
 // 
 // "select substr(s.sales_date,1,4) YY  // 연도별 매출
 //
 //  다른 쿼리문으로 //
 //
 // 
 // select s.sales_date,  // 일별
 // sum(s.total) finals from sales_info s
 // left
 // join product_info p
 // on p.prd_id = s.prd_id
 // group by s.prd_id
 // order by s.finals desc
 //
 //
 
 Connection con = null; 
 Statement stmt = null;
 ResultSet rs = null;
 ArrayList list = new ArrayList();
    try {Class.forName("oracle.jdbc.OracleDriver");
	con = DriverManager.getConnection(
			"jdbc:oracle:thin:@127.0.0.1:1521/XE",
			"hr","hr");
	stmt = con.createStatement();
	rs = stmt.executeQuery(select);
	
    while(rs.next()) {
    	PrdOutput prdoutput = new PrdOutput();
    	prdoutput.setPrd_id(rs.getString(1));
    	prdoutput.setBrand(rs.getString(2));
    	prdoutput.setCategory(rs.getString(3));
    	prdoutput.setPrd_name(rs.getString(4));
    	prdoutput.setFinals(rs.getInt(5));
    	list.add(prdoutput);
    }
    }catch(Exception e) {
		
	}finally {
		         try { con.close(); stmt.close(); rs.close();
		        	 
		         }catch(Exception e) {}
	}
      request.setAttribute("LIST", list);
      RequestDispatcher rd = request.getRequestDispatcher("prdSales.jsp");
      rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
