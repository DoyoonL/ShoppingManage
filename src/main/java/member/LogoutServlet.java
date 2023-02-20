package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logout.do")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LogoutServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		//������ �����Ѵ�
		HttpSession session = request.getSession(); // ���ǵ��
		          // session.setAttribute("LOGOUTID", id);
		session.invalidate(); //������ ��Ȱ��ȭ �Ѵ� (������ ������ �ִ� invalidate�� ��Ȱ��ȭ �޼ҵ�)
		
		//�α׾ƿ� ���(logoutResult.jsp)�� ��ȯ
		response.sendRedirect("logoutResult.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
