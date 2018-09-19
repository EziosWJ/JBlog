<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath()+ "/page/";
	String APP_PATH = request.getContextPath() + "/";
	application.setAttribute("path", path);
	application.setAttribute("APP_PATH", APP_PATH);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${path}static/icon/favicon.ico">


    <!-- Bootstrap core CSS -->
    <link href="${path }css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!--<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">-->

    <!-- Custom styles for this template -->
    <!-- 
    
     -->
    <link href="${path}css/plugin/bootstrap-select.min.css" rel="stylesheet">
    <link href="${path}css/font-awesome.min.css" rel="stylesheet">
    <link href="${path}css/blog-main.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
	<script src="${path}js/jquery.min.js"></script>
	<script src="${path}js/bootstrap.min.js"></script>
	<!-- Add Plugins
========================================================
	<script src="${path}plugins/bootstrap-select/i18n/defaults-zh_CN.js"></script>
	<script src="${path}plugins/bootstrap/dropdown.js"></script>
	 -->
	<script src="${path}plugins/bootstrap-select/bootstrap-select.min.js"></script>

	<script src="${path}plugins/wangEditor.js"></script>
	<script src="${path}plugins/AppUtils.js"></script>
</head>
<body>

</body>
</html>