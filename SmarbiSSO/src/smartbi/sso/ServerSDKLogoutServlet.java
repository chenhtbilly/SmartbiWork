package smartbi.sso;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import smartbi.sdk.ClientConnector;

/**
 * Servlet implementation class ServerSDKLogoutServlet
 */
public class ServerSDKLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerSDKLogoutServlet() {
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
		
		ClientConnector conn = null;
		//获取session中的连接再关闭，smartbicookie将失效
		conn = (ClientConnector) request.getSession().getAttribute("conn");
		conn.close();
		request.getRequestDispatcher("loginserver/succlogout.jsp").forward(request, response);
	}

}
