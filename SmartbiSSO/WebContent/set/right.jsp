<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title></title>
<style type="text/css">
	a{
		text-decoration: none
	}
</style>
<%
    request.setCharacterEncoding("GBK");
    String smartbiURL = "http://localhost:8080/smartbi";
	if (null != session.getAttribute("smartbiUrl")) {
		smartbiURL = (String) session.getAttribute("smartbiUrl");
	}
%>
</head>
<body>
		<marquee direction="left" onmouseover="this.stop()" onmouseout="this.start()"><p>����1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ʱ�</p></marquee>
		<marquee direction="left" onmouseover="this.stop()" onmouseout="this.start()"><p>����2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������</p></marquee>
		<marquee direction="left" scrolldelay="1" onmouseover="this.stop()" onmouseout="this.start()"><p>����3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������</p></marquee>
		<marquee direction="left" scrolldelay="2" onmouseover="this.stop()" onmouseout="this.start()"><p>���±���&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://localhost:8080/smartbi/vision/openresource.jsp?resid=I4028ff81015bbc65bc65eb99015bbc8bf8f80243">���������</a></p></marquee>
		<p>����1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Į����ֱ</p>
		<p>����1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������Բ</p>
		<marquee direction="left" onmouseover="this.stop()" onmouseout="this.start()"><p>����1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ط����</p></marquee>
		<marquee direction="left" onmouseover="this.stop()" onmouseout="this.start()"><p>����1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������Ȼ</p></marquee>
		<p>����1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������������</p>
		<marquee direction="left" onmouseover="this.stop()" onmouseout="this.start()"><p>����1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;jkajjgsgdsgsdgafkjaskk</p></marquee>
</body>

</html>