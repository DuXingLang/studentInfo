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
        	<form class="form-horizontal" action="getStaInfo.jsp?type=update" method="post">
    			<div class="form-group">
			        <label for="staId" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="staId" name="staId" value="<%=single.getStaId() %>" readonly />
			        </div>
    			</div>
			    <div class="form-group">
			        <label for="staName" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="staName" name="staName" value="<%=single.getStaName() %>" readonly>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="staSex" class="col-sm-2 control-label">�Ա�</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="staSex" name="staSex">
<% 
						    if(single.getStaSex().equals("��")){
							out.print("<option value=\"��\" selected>��</option>");
						    }else{
								out.print("<option value=\"Ů\" selected>Ů</option>");
						    }
%>
						</select>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="department" class="col-sm-2 control-label">Ժϵ</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="department" name="department" value="<%=single.getDepartment() %>" readonly/>
			        </div>
			    </div>
   			    <div class="form-group">
			        <label for="birthday" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="birthday" name="birthday" value="<%=single.getBirthday() %>" readonly/>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="address" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="address" name="address" value="<%=single.getAddress() %>" />
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="phone" class="col-sm-2 control-label">�ֻ�</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="phone" name="phone" value="<%=single.getPhone() %>" />
			        </div>
			    </div>
			    <div class="form-group">
			        <div class="col-sm-offset-2 col-sm-10">
			            <button type="submit" class="btn btn-default">�ύ</button>
			            <button type="reset" class="btn btn-default">����</button>
			        </div>
			    </div>
			</form>
        </div>
    </div>
    <div class="none"></div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$("#update").click(function(){
    			window.loction.href='getStaInfo.jsp?type=update';
    		});
    	});
    </script>
</body>
</html>