<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>乐富支付-在线支付</title>
<link href="${applicationScope.staticFilesHost}/image/favicon.ico" rel="icon" type="image/x-icon" />
<link href="${applicationScope.staticFilesHost}/image/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="${applicationScope.staticFilesHost}${requestScope.contextPath}/css/base.css" rel="stylesheet" type="text/css" />
<link href="${applicationScope.staticFilesHost}${requestScope.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://cache.house.sina.com.cn/esalesleju/resources/js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">DD_belatedPNG.fix('.loginborder');</script>
<![endif]-->
</head>
</html>