<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService,smartbi.sdk.InvokeResult" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
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
	String password = "admin";
	String serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
	session.setAttribute("serverUrl", serverUrl);
	String smartbiURL = serverUrl+ "/smartbi";
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
	<h3>�����¼���Թ���/LoginToken��չ��</h3>
	<div>
		smartbi��ַ��<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		����Ա�û���<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		����Ա���룺<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		<font color=red>�����Ӧ�汾��logintoken��չ�������</font><br/>
		<form id="tokenForm" action="tokenUserServlet" method="post">
			��ȡToken�û�����<input type="text" value="${requestScope.tokenUser}" name="tokenUser" id="tuser" size="20">
			<input type="submit" value="��ȡtoken">
		</form>
		
	</div>	
	<div>
		<p id="succ">
			<c:if test="${not empty requestScope.token}&&${empty requestScope.errmsg}">
				<font color="red">��ȡtoken�ɹ�</font>
			</c:if>
			<c:if test="${not empty requestScope.errmsg}">
				<font color="red">��ȡtokenʧ�ܣ�${requestScope.errmsg}</font>
			</c:if>
		</p>
			Token��<input type="text" id="token" value="${requestScope.token}" size="50"/><br/>
			����Դid��<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
			
			<input type="button" value="iframe����ҳ" onclick="linkFrameIndex()"> 
			<input type="button" value="iframe����Դ" onclick="linkFrame()">
			<input type="button" value="�´��ڴ���ҳ" 
			onclick="window.open('<%=smartbiURL%>/vision/index.jsp?user='+ document.getElementById('tuser').value +'&password='+ document.getElementById('token').value)">
			<input type="button" value="�´��ڴ���Դ" 
			onclick="window.open('<%=smartbiURL%>/vision/openresource.jsp?resid='+ document.getElementById('resid').value +'&user='+ document.getElementById('tuser').value +'&password='+ document.getElementById('token').value)">
			<input type="button" value="ע��" onclick="logout()">
	</div>
	<p>
		<iframe id="frame" name="frameTarget" src="" height="300" width="100%" style="display: none">
			
		</iframe>
		��ע��<br/>
		1�������д���password����������ֵΪ��ȡ����token��url��ʽ���£�<br/>
		http://localhost:8080/smartbi/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089&user=liming&password=I4028ff81015cfea5fea563d0015cfec67991038d
		<br/>
		
	</p>
	<script type="text/javascript">
		function linkFrame() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid="+ document.getElementById('resid').value +"&user="+ document.getElementById('tuser').value +"&password=" + document.getElementById('token').value;
		}
		function linkFrameIndex() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/index.jsp?"+ "user="+ document.getElementById('tuser').value +"&password=" + document.getElementById('token').value;
		}
		
		function logout(){
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/logout.jsp";
		}
	</script>
</body>
</html>