<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="valuebean.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stumStuInfo.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
<%
	ArrayList studentslist = (ArrayList) session.getAttribute("studentslist");	
%>
    <header class="heading">
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
	    	<span>ѧ����Ϣ����</span>
	        <ul>
	            <li class="liselected"><a href="getStuInfo.jsp?type=all">��ѯѧ����Ϣ</a></li>
	            <li><a href="insertStuInfo.jsp">����ѧ����Ϣ</a></li>
	        </ul>
    	</div>
    <div class="main">
        <div class="row">
        	<form action="getStuInfo.jsp?type=select" method="post">
	        	<div class="stuId">
	                <div class="input-group">
	                	<span class="input-group-addon">ѧ��</span>
	                    <input type="text" name="stuId" class="form-control" placeholder="ѧԺ/�༶/ѧ�ű���...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="name">
	                <div class="input-group">
	                	<span class="input-group-addon">����</span>
	                    <input type="text" name="stuName" class="form-control" placeholder="Search for...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="btndiv">
	            	<button class="btn btn-default" type="submit">����</button>
	            </div>
            </form>
        </div><!-- /.row -->
        <div class="stuInfo">
        	<table class="table table-hover">
        		<tr>
        			<td>ѧ��</td>
        			<td>����</td>
        			<td>�Ա�</td>
        			<td>Ժϵ</td>
        			<td>רҵ</td>
        			<td>�༶</td>
        			<td>����</td>
        			<td>����</td>
        			<td>�ֻ�</td>
        			<td>ɾ��</td>
        		</tr>
<%
		if(studentslist == null || studentslist.size() == 0){
%>
			<tr height="100">
				<td colspan="10" align="center">û��ѧ����Ϣ��</td>
			</tr>
<%
		}else{
			int size = studentslist.size();
			for(int i = 0; i < size; i++){
				Student single = (Student) studentslist.get(i);
%>
			<tr>
				<td><a href="updateStuInfo.jsp?myId=<%=i %>"><%=single.getStuId() %></a></td>
				<td><%=single.getStuName() %></td>
				<td><%=single.getStuSex() %></td>
				<td><%=single.getDepartment() %></td>
				<td><%=single.getMajor() %></td>
				<td><%=single.getClassId() %></td>
				<td><%=single.getAddress() %></td>
				<td><%=single.getBirthday() %></td>
				<td><%=single.getPhone() %></td>
				<td><a href="doStuInfo.jsp?type=delete&stuId=<%=single.getStuId()%>">ɾ��</a></td>
			</tr>
<%
			}
		}
%>
			</table>
         </div>
      </div>
    <div class="none"></div>
    </div>
<%
	session.setAttribute("studentslist", studentslist);
%>
</body>
</html>