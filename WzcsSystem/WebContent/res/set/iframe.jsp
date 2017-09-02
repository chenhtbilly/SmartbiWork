<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="WzcsSystem" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="${WzcsSystem}/css/base.css" />
</head>
<script type="text/javascript">
	window.onload = function(){
		document.getElementById("form").submit();
	}
</script>
<body>
	<form id="form" action="http://localhost:8080/smartbi/vision/openresource.jsp?resid=I402881f738d5a79a0138d67650d00299"
		method="POST" target="iframetest">
		<input type="text" id="resid" name="param.资源ID或名称" value="I2c94ea86296db80801296dd20f12005a">
		<input type="submit">
	</form>
	
	<form method="POST" id="export" action="${WzcsSystem}/ExportServlet">
	    <input type="hidden" id="residexport" name="residexport" value="I402881f738d5a79a0138d67650d00299">
	    <input type="hidden" id="param" name="param" value="">
	</form>
	iframe 测试  <br/>
	<input type="button" onclick="exportExcel()" value="导出excel"/>  <br/>
	<iframe name="iframetest" src="" width="900" height="450"></iframe>
	<script type="text/javascript">

		function exportExcel(){
			var param = document.getElementById("resid").value;
			document.getElementById("param").value = param;
			document.getElementById("export").submit();
		}
	</script>
</body>

</html>