<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="http://echarts.baidu.com/examples/vendors/bootstrap/css/bootstrap.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries-->
<!--[if lt IE 9]><script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<link rel="stylesheet" type="text/css"
	href="http://echarts.baidu.com/examples/stylesheets/main.css?_v_=1516200292096">
<title>ECharts测试-3.8.5</title>
<script type="text/javascript">
	window.EC_DEMO_LANG = 'cn';
</script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" data-toggle="collapse"
					data-target="#navbar-collapse" aria-expanded="false"
					class="navbar-toggle collapsed">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a href="http://echarts.baidu.com/index.html" class="navbar-brand"><img
					src="http://echarts.baidu.com/examples/images/logo.png" alt="echarts logo" class="navbar-logo"></a>
			</div>
			<div id="navbar-collapse" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li id="nav-index"><a
						href="http://echarts.baidu.com/index.html">首页</a></li>
					<li id="nav-doc" class="dropdown"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">文档<b
							class="caret"></b></a>
					<ul class="dropdown-menu">
							<li><a href="http://echarts.baidu.com/feature.html">特性</a></li>
							<li><a href="http://echarts.baidu.com/tutorial.html">教程</a></li>
							<li><a href="http://echarts.baidu.com/api.html">API</a></li>
							<li><a href="http://echarts.baidu.com/option.html">配置项手册</a></li>
							<li><a href="http://echarts.baidu.com/option-gl.html">GL
									配置项手册</a></li>
							<li><a href="http://echarts.baidu.com/faq.html">常见问题</a></li>
							<li><a href="http://echarts.baidu.com/changelog.html">版本记录</a></li>
						</ul></li>
					<li id="nav-download" class="dropdown"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">下载<b
							class="caret"></b></a>
					<ul class="dropdown-menu">
							<li><a href="http://echarts.baidu.com/download.html">下载</a></li>
							<li><a href="http://echarts.baidu.com/download-theme.html">主题下载</a></li>
							<li><a href="http://echarts.baidu.com/download-map.html">地图下载</a></li>
							<li><a
								href="http://echarts.baidu.com/download-extension.html">扩展下载</a></li>
						</ul></li>
					<li id="nav-examples"><a href="#" data-toggle="dropdown"
						class="dropdown-toggle">实例<b class="caret"></b></a>
					<ul class="dropdown-menu">
							<li><a href="http://echarts.baidu.com/examples.html">官方实例</a></li>
							<li><a
								href="http://gallery.echartsjs.com/explore.html#tags=echarts-gl">GL
									实例</a></li>
						</ul></li>
					<li id="nav-community"><a href="#" data-toggle="dropdown"
						class="dropdown-toggle">社区<b class="caret"></b></a>
					<ul class="dropdown-menu">
							<li><a href="http://gallery.echartsjs.com">GALLERY</a></li>
							<li><a href="undefined">博客</a></li>
						</ul></li>
					<li id="nav-tool"><a href="#" data-toggle="dropdown"
						class="dropdown-toggle">工具<b class="caret"></b></a>
					<ul class="dropdown-menu">
							<li><a href="http://echarts.baidu.com/spreadsheet.html">表格工具</a></li>
							<li><a href="http://ecomfe.github.io/echarts-map-tool/">地图数据在线工具</a></li>
							<li><a href="http://echarts.baidu.com/theme-builder/">主题构建工具</a></li>
						</ul></li>
					<li id="nav-about"><a href="#" data-toggle="dropdown"
						class="dropdown-toggle">关于<b class="caret"></b></a>
					<ul class="dropdown-menu">
							<li><a href="http://echarts.baidu.com/about.html">关于我们</a></li>
							<li><a
								href="https://github.com/ecomfe/echarts/blob/master/LICENSE">版权声明</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li id="nav-github"><a
						href="https://github.com/ecomfe/echarts" target="_blank"><img
							src="http://echarts.baidu.com/images/github.png" width="18"></a></li>
					<li id="nav-2" class="0"><a
						href="http://echarts.baidu.com/echarts2/">2.0</a></li>
					<li id="nav-homeen"><a
						href="https://ecomfe.github.io/echarts-doc/public/en/index.html">EN</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="main-container">
		<div id="code-container">
			<div id="control-panel">
				<div id="code-info"></div>
				<div class="control-btn-panel">
					<a href="javascript:;" onclick="disposeAndRun()"
						class="btn btn-default btn-sm">运行</a>
				</div>
			</div>
			<div id="code-panel"></div>
		</div>
		<div id="h-handler" class="handler"></div>
		<div class="right-container">
			<div id="chart-panel" class="right-panel"></div>
			<div id="tool-panel">
				<div id="theme">
					<a title="default" class="default"><span></span></a><a
						title="light" class="light"><span></span></a><a title="dark"
						class="dark"><span></span></a>
				</div>
				<button id="download" class="btn btn-sm">Download</button>
			</div>
		</div>
	</div>
	<script>
		if (window !== top) {
			var nav = document.getElementsByClassName('navbar')[0];
			nav.parentNode.removeChild(nav);
			document.getElementById('main-container').style.top = 0;
		}
	</script>
	<script type="text/javascript" src="http://echarts.baidu.com/examples/vendors/jquery/jquery.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/examples/vendors/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="http://echarts.baidu.com/examples/vendors/lodash.js"></script>
	<script type="text/javascript" src="http://echarts.baidu.com/examples/vendors/dat.gui.min.js"></script>
	<script type="text/javascript"
		src="js/echarts3/echarts3.8.5.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/examples/vendors/echarts-stat/ecStat.min.js?_v_=1516200292096"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/examples/vendors/echarts/map/js/china.js?_v_=1516200292096"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/examples/vendors/echarts/map/js/world.js?_v_=1516200292096"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/examples/vendors/echarts/extension/dataTool.js?_v_=1516200292096"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&amp;ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
	<script type="text/javascript"
		src="js/echarts3/bmap.js"></script>
	<script type="text/javascript" src="http://echarts.baidu.com/examples/vendors/ace/src/ace.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/examples/vendors/ace/src/ext-language_tools.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/examples/javascripts/editor.js?_v_=1516200292096"></script>
	<script type="text/javascript" src="http://echarts.baidu.com/examples/javascripts/hm.js"></script>
	<script type="text/javascript">
		document.getElementById('nav-examples').className = 'active';
	</script>
</body>
</html>