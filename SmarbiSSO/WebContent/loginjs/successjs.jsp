<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="SSOLogin" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>JS�ű���¼�ɹ�</title>
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
<style type="text/css">
	div{
	  	text-align:center
	  }
	a{
		text-decoration: none
	}
</style>
</head>
<body>
	<h3>�����¼���Թ���/������</h3>
	<div>
		<p id="succ">
			<font color="red">�����¼�ɹ�</font>
		</p>
		smartbi��ַ��<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		�����¼�û���<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		�����¼���룺<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		����Դid��<input type="text" id="resid" value="I4028ff81015bbd11bd110ba5015bbd2381160098" size="50"/><br/>
		<input type="button" value="�´��ڴ���Դ" onclick="window.open(document.getElementsByName('smartbiUrl')[0].value + '/vision/openresource.jsp?resid='+ document.getElementById('resid').value)">
		<input type="button" value="IFrame����Դ" onclick="linkFrame()">
		<form method="POST" id="formLogout" onsubmit="go();return false">
		    <p>ע���ɹ������ת��ַ��<input type="text" name="surl" size="50" value="http://localhost:8090${SSOLogin}/logoutjs/successjs.jsp"></p>
		    <p>ע��ʧ�ܺ����ת��ַ��<input type="text" name="furl" size="50" value="http://localhost:8090${SSOLogin}/logoutjs/failjs.jsp"></p>    
		    <p><input type="submit" value="ע��" name="B1"></p>
		</form>
	</div>
	<iframe id="frame" src="" height="300" width="100%" style="display: none">
	</iframe>
	<p>
		��ע��<br/>
	</p>
	<script type="text/javascript">
		function linkFrame() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid="+ document.getElementById('resid').value;
		}
		//ע��
		function go(){
		    formLogout.action = document.getElementsByName("smartbiUrl")[0].value+"/vision/logout.jsp";
		    formLogout.surl.value = document.getElementsByName("surl")[0].value; // ע���ɹ������ת��ַ Ϊ��ʱ�Զ���ת��smartbi��index.jsp
		    formLogout.furl.value = document.getElementsByName("furl")[0].value; // ע��ʧ�ܺ����ת��ַ Ϊ��ʱ�Զ���ת��smartbi��index.jsp
		    formLogout.submit();
		    return true;
		}
	</script>
</body>
</html>