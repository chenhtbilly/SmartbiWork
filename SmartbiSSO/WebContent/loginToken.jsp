<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService,smartbi.sdk.InvokeResult" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>loginToken��¼</title>
<style type="text/css">
	div{
	  	text-align:center
	  }
	a{
		text-decoration: none
	}
</style>
<%
    request.setCharacterEncoding("GBK");
    String user ="admin";
    String password = "manager";
    String smartbiURL = "http://localhost:8080/smartbi";
	if (null != session.getAttribute("smartbiUrl")) {
		smartbiURL = (String) session.getAttribute("smartbiUrl");
	}
	if (null != (String) session.getAttribute("user")) {
		user = (String) session.getAttribute("user");
	}
	if (null != (String) session.getAttribute("password")) {
		password = (String) session.getAttribute("password");
	}
%>
</head>
<body>
	<h3>�����¼���Թ���/����һ</h3>
	<div>
		smartbi��ַ��<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		����Ա�û���<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		����Ա���룺<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		<font color=red>�����Ӧ�汾��logintoken��չ�������</font><br/>
		<form action="tokenUserServlet" method="post">
			��ȡToken�û�����<input type="text" value="${requestScope.tokenUser}" name="tokenUser" size="20">
			<input type="submit" value="��ȡtoken">
		</form>
	</div>	
	<div>
		<p id="succ">
			<c:if test="${not empty requestScope.token}">
				<font color="red">��ȡtoken�ɹ�</font>
			</c:if>
			<c:if test="${not empty requestScope.errmsg}">
				<font color="red">��ȡʧ�ܣ�${requestScope.errmsg}</font>
			</c:if>
		</p>
			Token��<input type="text" id="token" value="${requestScope.token}" size="50"/><br/>
			����Դid��<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
			<%-- 
			<a href="${sessionScope.smartbiUrl}/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089&user=${requestScope.tokenUser}&password=${requestScope.token}">�´��ڲ���</a> 
			<input type="button" value="�´��ڴ���Դ" onclick="location='<%=smartbiURL%>/vision/openresource.jsp?resid='+ document.getElementById('resid').value +'&user=${requestScope.tokenUser}&password=${requestScope.token}'">
			--%>
			<input type="button" value="�´��ڴ���Դ" onclick="window.open('<%=smartbiURL%>/vision/openresource.jsp?resid='+ document.getElementById('resid').value +'&user=${requestScope.tokenUser}&password=${requestScope.token}')">
			<input type="button" value="IFrame����Դ" onclick="linkFrame()">
	</div>
	<p>
		<iframe id="frame" src="" height="300" width="100%" style="display: none">
			
		</iframe>
		��ע��<br/>
		1�������д���password����������ֵΪ��ȡ����token��url��ʽ���£�<br/>
		http://localhost:8080/smartbi/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089&user=liming&password=I4028ff81015cfea5fea563d0015cfec67991038d
		<br/>
		
	</p>
	<script type="text/javascript">
		function linkFrame() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid="+ document.getElementById('resid').value +"&user=${requestScope.tokenUser}&password=${requestScope.token}";
		}
	</script>
</body>
</html>