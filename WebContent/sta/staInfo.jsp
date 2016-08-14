<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="valuebean.Teacher"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
<%
	ArrayList sta = (ArrayList) session.getAttribute("sta");
	Teacher single = (Teacher) sta.get(0);
%>
    <header class="heading">
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>ѧ����Ϣ����</span>
        <ul>
            <li class="liselected"><a href="getStaInfo.jsp?type=get">������Ϣ</a></li>
            <li><a href="getSCInfo.jsp?type=select">¼��ɼ�</a></li>
            <li><a href="searchScore.jsp?type=select">�ɼ���ѯ</a></li>
            <li><a href="../resetPassword.jsp">�޸�����</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="updateForm">
        	<form class="form-horizontal" action="#" method="post">
    			<div class="form-group">
			        <label for="staId" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="staId" name="staId" value="<%=single.getStaId() %>" disabled />
			        </div>
    			</div>
			    <div class="form-group">
			        <label for="staName" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="staName" name="staName" value="<%=single.getStaName() %>" disabled>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="staSex" class="col-sm-2 control-label">�Ա�</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="staSex" name="staSex" value="<%=single.getStaSex() %>" disabled>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="department" class="col-sm-2 control-label">Ժϵ</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="department" name="department" value="<%=single.getDepartment() %>" disabled>
			        </div>
			    </div>
   			    <div class="form-group">
			        <label for="birthday" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="birthday" name="birthday" value="<%=single.getBirthday() %>" disabled>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="address" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="address" name="address" value="<%=single.getAddress() %>" disabled>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="phone" class="col-sm-2 control-label">�ֻ�</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="phone" name="phone" value="<%=single.getPhone() %>" disabled>
			        </div>
			    </div>
			</form>
			<div class="col-sm-offset-2 col-sm-10">
	            <a href="updateStaInfo.jsp" class="btn btn-default" id="update">�޸�</a>
	        </div>
        </div>
    </div>
    <div class="none"></div>
    </div>
<%
	session.setAttribute("sta", sta);
%>
</body>
</html>