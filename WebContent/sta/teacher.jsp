<%@ page language="java" contentType="text/html; charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
    <header class="heading">
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>ѧ����Ϣ����</span>
        <ul>
            <li><a href="getStaInfo.jsp?type=get">������Ϣ</a></li>
            <li><a href="getSCInfo.jsp?type=select">¼��ɼ�</a></li>
            <li><a href="searchScore.jsp?type=select">�ɼ���ѯ</a></li>
            <li><a href="../resetPassword.jsp">�޸�����</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="main_block">��ӭ��½!</div>
    </div>
    <div class="none"></div>
    </div>
<%
	String staId = session.getAttribute("userId").toString(); 
	session.setAttribute("staId", staId);
%>
</body>
</html>