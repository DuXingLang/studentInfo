<%@ page language="java" contentType="text/html; charset=GB2312" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="valuebean.Course"%>
<!DOCTYPE html>
<html>
<head>
<title>学生信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stcManager.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
<%
	ArrayList courselist = (ArrayList) session.getAttribute("courselist");	
%>
    <header class="heading">
        <h2 class="title">学生信息管理系统</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>，欢迎您！&nbsp;&nbsp;<a href="../index.jsp">退出</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>教务信息管理</span>
        <ul>
            <li><span>课程设置</span></li>
           	<li class="liselected"><a href="getCourse.jsp?type=all">查询课程信息</a></li>
           	<li><a href="addCourse.jsp">添加课程信息</a></li>
            <li><span>学生选课</span></li>
            <li><a href="getSC.jsp?type=all">查询选课信息</a></li>
	        <li><a href="addSC.jsp">添加选课信息</a></li>
	        <li><a href="getSCResult.jsp?type=all">选课结果统计</a></li>
            <li><span>学生成绩</span></li>
            <li><a href="getInfo.jsp?type=score">查询学生成绩</a></li>
            <li><span><a href="getInfo.jsp?type=sta">教师信息</a></span></li>
            <li><span><a href="getInfo.jsp?type=stu">学生信息</a></span></li>
        </ul>
    </div>
    <div class="main">
        <div class="row">
        	<form action="getCourse.jsp?type=select" method="post">
	        	<div class="courseId">
	                <div class="input-group">
	                	<span class="input-group-addon">课程名称</span>
	                    <input type="text" name="courseName" class="form-control" placeholder="课程名称...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="courseSta">
	                <div class="input-group">
	                	<span class="input-group-addon">教师工号</span>
	                    <input type="text" name="courseSta" class="form-control" placeholder="教师工号...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="btndiv">
	            <button class="btn btn-default" type="submit">搜索</button>
	            </div>
            </form>
        </div><!-- /.row -->
        <div class="courseInfo">
        	<table class="table table-hover">
        		<tr>
        			<td>编号</td>
        			<td>名称</td>
        			<td>教师</td>
        			<td>时间</td>
        			<td>地点</td>
        			<td>学分</td>
        			<td>类型</td>
        			<td>删除</td>
        		</tr>
<%
		if(courselist == null || courselist.size() == 0){
%>
			<tr height="100">
				<td colspan="8" align="center">没有课程信息！</td>
			</tr>
<%
		}else{
			int size = courselist.size();
			for(int i = 0; i < size; i++){
				Course single = (Course) courselist.get(i);
%>
			<tr>
				<td><a href="updateCourse.jsp?myId=<%=i %>"><%=single.getCourseId() %></a></td>
				<td><%=single.getCourseName() %></td>
				<td><%=single.getCourseSta()%>[<%=single.getStaName() %>]</td>
				<td><%=single.getCourseTime() %></td>
				<td><%=single.getCourseAddr() %></td>
				<td><%=single.getCourseCredit() %></td>
				<td><%=single.getTypeName() %></td>
				<td><a href="doCourse.jsp?type=delete&courseId=<%=single.getCourseId()%>">删除</a></td>
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
	session.setAttribute("courselist", courselist);
%>
</body>
</html>