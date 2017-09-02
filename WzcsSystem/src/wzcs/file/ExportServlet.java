package wzcs.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import smartbi.sdk.ClientConnector;
import smartbi.sdk.service.simplereport.Report;

/**
 * Servlet implementation class ExportServlet
 */
public class ExportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportServlet() {
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
		String resid = request.getParameter("residexport");
		String param = request.getParameter("param");
		ClientConnector connector = new ClientConnector("http://localhost:8080/smartbi");
		connector.open("admin", "admin");
		Report report = new Report(connector);
		report.open(resid);
		String currentReportName = report.getCurrentReportName();
		report.setParamValue("OutputParameter.I402881f738d5a79a0138d5e0af4100dc.资源ID或名称", param);
		File filepath = new File("C:\\temp");
		if (!filepath.exists()) {
			filepath.mkdir();
		}
		FileOutputStream fileOutputStream = new FileOutputStream(new File("C:\\temp\\"+currentReportName+".xls"));
		report.doExport("EXCEL", "", "20000", fileOutputStream);
		fileOutputStream.flush();
		fileOutputStream.close();
		connector.close();
		request.getRequestDispatcher("res/exportsuc.jsp").forward(request, response);
	}
}
