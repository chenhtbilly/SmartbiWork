package smartbi.sso;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class UrlServlet
 */
public class UrlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static Logger log = Logger.getLogger(UrlServlet.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UrlServlet() {
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
		String smartbiUrl = request.getParameter("smartbiUrl");
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		log.info("smartbiUrl="+smartbiUrl);
		session.setAttribute("smartbiUrl", smartbiUrl);
		session.setAttribute("user", user);
		session.setAttribute("password", password);
		response.sendRedirect("index.jsp");
	}

}
