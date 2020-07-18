<!DOCTYPE html>
<html>
<head>
	<title>Chrome Frame Test</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<!--[if lte IE 10]><![endif]-->
	<script type="text/javascript" src="js/CFInstall.js"></script>
	<script type="text/javascript" src="js/gcfutil.js"></script>
	<script type="text/javascript">
	</script>
	
	<script type="text/javascript">
		function startup() {
			if (window.__isLessThanOrEqualToIE10 === true) { // 当前为IE内核(IE10或以下)
				if (window.gcfutil && window.gcfutil.isGcfAvailable()) { // Chrome插件已安装(但未成功自动启用)
					// alert('reload');
					window.location.href = window.location.href; // 尝试reload
					return;
				} else {
					alert('请先安装Chrome Frame插件!');
				}
			}
		}
	</script>
</head>
<body onload="startup();">
	<h1>测试1111111111111111</h1>
	<iframe style="width: 100%; height: 100%; min-height: 500px;" 
	src="http://10.10.202.10:17300/smartbi/vision/openresource.jsp?resid=I4028818a0165d2b1d2b1553b0165f57f5d426e22&user=admin&password=admin&showtoolbar=true&refresh=true">
	</iframe>
</body>
</html>