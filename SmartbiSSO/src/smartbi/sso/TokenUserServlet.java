package smartbi.sso;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import smartbi.sdk.ClientConnector;
import smartbi.sdk.InvokeResult;

/**
 * Servlet implementation class TokenUserServlet
 */
public class TokenUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TokenUserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		String tokenUser = request.getParameter("tokenUser");
		if("".equals(tokenUser)){
			request.setAttribute("errmsg", "用户名不能为空！");
			request.getRequestDispatcher("loginToken.jsp").forward(request,response);
			return;
		}
		String user = "admin";
		String password = "manager";
		String smartbiUrl = "http://localhost:8080/smartbi";
		HttpSession session = request.getSession();
		if (null != session.getAttribute("smartbiUrl")) {
			smartbiUrl = (String) session.getAttribute("smartbiUrl");
		}
		if (null != (String) session.getAttribute("user")) {
			user = (String) session.getAttribute("user");
		}
		if (null != (String) session.getAttribute("password")) {
			password = (String) session.getAttribute("password");
		}
		session.setAttribute("smartbiUrl", smartbiUrl);
		session.setAttribute("user", user);
		session.setAttribute("password", password);
		ClientConnector conn = new ClientConnector(smartbiUrl);
		conn.open(user, password);//以管理员身份登录
		InvokeResult result = conn.remoteInvoke("LoginTokenModule", "generateLoginToken", new Object[] {tokenUser});//用户名
		if (null == result || null == result.getResult()) {

		} else {
			System.out.println("Token："+result.getResult());
			request.setAttribute("tokenUser", tokenUser);
			request.setAttribute("token", result.getResult());
		}
		conn.close();
		request.getRequestDispatcher("loginToken.jsp").forward(request,response);
	}

}
