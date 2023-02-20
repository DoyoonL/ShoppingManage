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
		//세션을 삭제한다
		HttpSession session = request.getSession(); // 세션등록
		          // session.setAttribute("LOGOUTID", id);
		session.invalidate(); //세션을 비활성화 한다 (세션이 가지고 있는 invalidate는 비활성화 메소드)
		
		//로그아웃 결과(logoutResult.jsp)로 전환
		response.sendRedirect("logoutResult.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
