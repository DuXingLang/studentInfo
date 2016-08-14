<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="valuebean.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>学生信息管理系统</title>
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
        <h2 class="title">学生信息管理系统</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>，欢迎您！&nbsp;&nbsp;<a href="../index.jsp">退出</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
	    	<span>学生信息管理</span>
	        <ul>
	            <li class="liselected"><a href="getStuInfo.jsp?type=all">查询学生信息</a></li>
	            <li><a href="insertStuInfo.jsp">插入学生信息</a></li>
	        </ul>
    	</div>
    <div class="main">
        <div class="row">
        	<form action="getStuInfo.jsp?type=select" method="post">
	        	<div class="stuId">
	                <div class="input-group">
	                	<span class="input-group-addon">学号</span>
	                    <input type="text" name="stuId" class="form-control" placeholder="学院/班级/学号编码...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="name">
	                <div class="input-group">
	                	<span class="input-group-addon">姓名</span>
	                    <input type="text" name="stuName" class="form-control" placeholder="Search for...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="btndiv">
	            	<button class="btn btn-default" type="submit">搜索</button>
	            </div>
            </form>
        </div><!-- /.row -->
        <div class="stuInfo">
        	<table class="table table-hover">
        		<tr>
        			<td>学号</td>
        			<td>姓名</td>
        			<td>性别</td>
        			<td>院系</td>
        			<td>专业</td>
        			<td>班级</td>
        			<td>籍贯</td>
        			<td>生日</td>
        			<td>手机</td>
        			<td>删除</td>
        		</tr>
<%
		if(studentslist == null || studentslist.size() == 0){
%>
			<tr height="100">
				<td colspan="10" align="center">没有学生信息！</td>
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
				<td><a href="doStuInfo.jsp?type=delete&stuId=<%=single.getStuId()%>">删除</a></td>
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