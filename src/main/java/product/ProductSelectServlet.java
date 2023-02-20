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


@WebServlet("/productSelect.do")
public class ProductSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductSelectServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		String select = "select prd_id, brand, category, prd_name, price, origin "+
	                    "from product_info "+
				        "where prd_id = "+id;
		Connection con = null; 
		Statement stmt = null;
		ResultSet rs = null; 
		Product prd = new Product();
        try {Class.forName("oracle.jdbc.OracleDriver");
		     con = DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521/XE","hr","hr");
        	 stmt = con.createStatement();
        	 rs = stmt.executeQuery(select);
        	 rs.next();
        	 prd.setPrdid(rs.getString(1));
        	 prd.setBrand(rs.getString(2));
        	 prd.setCategory(rs.getString(3));
        	 prd.setName(rs.getString(4));
        	 prd.setPrice(rs.getInt(5));
        	 prd.setOrigin(rs.getString(6));

        }catch(Exception e) {
        	
        }finally {
                    try { con.close(); stmt.close(); rs.close();
                    	
                    }catch(Exception e){}
        }
         request.setAttribute("PRD", prd);
         RequestDispatcher r = 
        		  request.getRequestDispatcher("productDetail.jsp");
         r.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
