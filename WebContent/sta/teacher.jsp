<%@ page language="java" contentType="text/html; charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
<title>学生信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
    <header class="heading">
        <h2 class="title">学生信息管理系统</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>，欢迎您！&nbsp;&nbsp;<a href="../index.jsp">退出</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>学生信息管理</span>
        <ul>
            <li><a href="getStaInfo.jsp?type=get">基本信息</a></li>
            <li><a href="getSCInfo.jsp?type=select">录入成绩</a></li>
            <li><a href="searchScore.jsp?type=select">成绩查询</a></li>
            <li><a href="../resetPassword.jsp">修改密码</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="main_block">欢迎登陆!</div>
    </div>
    <div class="none"></div>
    </div>
<%
	String staId = session.getAttribute("userId").toString(); 
	session.setAttribute("staId", staId);
%>
</body>
</html>