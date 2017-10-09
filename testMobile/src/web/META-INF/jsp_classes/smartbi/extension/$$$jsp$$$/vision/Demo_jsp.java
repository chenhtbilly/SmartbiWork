package smartbi.extension.$$$jsp$$$.vision;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Demo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n<html>\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=GBK\">\r\n<meta name=\"viewport\" content=\"width=device-width; initial-scale=1.4; minimum-scale=1.0; maximum-scale=2.0\"/>\r\n<title>浏览器端SDK登录示例2</title>\r\n<style type=\"text/css\">\r\ndiv {\r\n\ttext-align: center\r\n}\r\n\r\na {\r\n\ttext-decoration: none\r\n}\r\n</style>\r\n<script type=\"text/javascript\" src=\"js/freequery/lang/JSLoader.js\"></script>\r\n</head>\r\n<body>\r\n\t<h3>单点登录测试浏览器sdk</h3>\r\n\t<div>\r\n\t\t<p id=\"succ\"></p>\r\n\t\t<input type=\"button\" value=\"登录\" onclick=\"login()\">\r\n\t\t<input type=\"button\" value=\"注销\" onclick=\"logout()\">\r\n\t\t<iframe id=\"frame\" src=\"\" height=\"300\" width=\"100%\"\r\n\t\t\tstyle=\"display: none\"> </iframe>\r\n\t</div>\r\n\t<SCRIPT LANGUAGE=\"JavaScript\">\r\n\t\tvar jsloader = new JSLoader();\r\n\t\tfunction login() {\r\n\t\t\ttry {\r\n\t\t\t\tvar util = jsloader.resolve(\"freequery.common.util\");\r\n\t\t\t\tvar ret = util.remoteInvoke(\"UserService\", \"clickLogin\", [\r\n\t\t\t\t\t\t\"admin\", \"admin\" ]);\r\n");
      out.write("\t\t\t\tif (ret && ret.result) {\r\n\t\t\t\t\t//alert(\"单点登录成功\");\r\n\t\t\t\t\t//window.location.href = \"http://localhost:8080/smartbi/vision/mobileportal.jsp\";\r\n\t\t\t\t\twindow.location.href = \"mobileportal.jsp\";\r\n\t\t\t\t} else {\r\n\t\t\t\t\tdocument.getElementById(\"succ\").innerHTML = \"<font color='red'>浏览器端SDK登录失败</font>\";\r\n\t\t\t\t}\r\n\t\t\t} catch (e) {\r\n\t\t\t\tdocument.getElementById(\"succ\").innerHTML = \"<font color='red'>登录异常，\"\r\n\t\t\t\t\t\t+ e + \"</font>\";\r\n\t\t\t}\r\n\t\t}\r\n\t\t//注销\r\n\t\tfunction logout() {\r\n\t\t\ttry {\r\n\t\t\t\t// 创建应用程序对象\r\n\t\t\t\tvar userService = jsloader\r\n\t\t\t\t\t\t.imports(\"bof.usermanager.UserService\");\r\n\t\t\t\t// 通过userService.getInstance()可以调用所有的UserManagerModule方法.\r\n\t\t\t\tvar result = userService.getInstance().logout();\r\n\t\t\t\tif (result) {\r\n\t\t\t\t\tdocument.getElementById(\"succ\").innerHTML = \"<font color='red'>浏览器端SDK注销成功</font>\";\r\n\t\t\t\t} else {\r\n\t\t\t\t\tdocument.getElementById(\"succ\").innerHTML = \"<font color='red'>浏览器端SDK注销失败</font>\";\r\n\t\t\t\t}\r\n\t\t\t} catch (e) {\r\n\t\t\t\tdocument.getElementById(\"succ\").innerHTML = \"<font color='red'>注销异常，\"\r\n\t\t\t\t\t\t+ e + \"</font>\";\r\n\t\t\t}\r\n");
      out.write("\t\t}\r\n\t</SCRIPT>\r\n</body>\r\n</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
