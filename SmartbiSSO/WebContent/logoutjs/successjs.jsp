<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ҳ����ʹ��Formע���ɹ�</title>
<%
    request.setCharacterEncoding("GBK");
    String smartbiURL = "http://localhost:8080/smartbi";
	if (null != session.getAttribute("smartbiUrl")) {
		smartbiURL = (String) session.getAttribute("smartbiUrl");
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
			<font color="red">ע���ɹ�</font>
		</p>
		smartbi��ַ��<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		����Դid��<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
		<input type="button" value="�´��ڴ���Դ" onclick="window.open(document.getElementsByName('smartbiUrl')[0].value + '/vision/openresource.jsp?resid='+ document.getElementById('resid').value)">
		<input type="button" value="IFrame����Դ" onclick="linkFrame()">
		<input type="button" value="IFrame����ҳ" onclick="linkFrameIndex()">
	</div>
	<iframe id="frame" src="" height="300" width="100%" style="display: none">
			
	</iframe>
	<p>
		��ע��<br/>
		ע���ɹ������´��ڴ���Դ��IFrame����Դ��������¼ҳ
	</p>
	<script type="text/javascript">
		function linkFrame() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid="+ document.getElementById('resid').value;
		}
		function linkFrameIndex() {
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/index.jsp";
		}
	</script>
</body>
</html>