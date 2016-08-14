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
	ArrayList scResult = (ArrayList) session.getAttribute("scResult");	
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
           	<li><a href="getCourse.jsp?type=all">查询课程信息</a></li>
           	<li><a href="addCourse.jsp">添加课程信息</a></li>
            <li><span>学生选课</span></li>
            <li><a href="getSC.jsp">查询选课信息</a></li>
	        <li><a href="addSC.jsp">添加选课信息</a></li>
	        <li class="liselected"><a href="getSCResult.jsp?type=all">选课结果统计</a></li>
            <li><span>学生成绩</span></li>
            <li><a href="getInfo.jsp?type=score">查询学生成绩</a></li>
            <li><span><a href="getInfo.jsp?type=sta">教师信息</a></span></li>
            <li><span><a href="getInfo.jsp?type=stu">学生信息</a></span></li>
        </ul>
    </div>
    <div class="main">
        <div class="row">
        	<form action="getSCResult.jsp?type=select" method="post">
        	<div class="courseTerm">
	                <div class="input-group">
	                	<span class="input-group-addon">学期</span>
	                    <select name="courseTerm" class="form-control">
	                    	<option value="">请选择...</option>
	                    	<option value="1">1</option>
	   	                    <option value="2">2</option>
	   	                    <option value="3">3</option>
	   	                    <option value="4">4</option>
	   	                    <option value="5">5</option>
	   	                    <option value="6">6</option>
	   	                    <option value="7">7</option>
	   	                    <option value="8">8</option>
	                    </select>
	                </div><!-- /input-group -->
	            </div>
	        	<div class="courseId">
	                <div class="input-group">
	                	<span class="input-group-addon">课程编码</span>
	                    <input type="text" name="courseId" class="form-control" placeholder="课程编码...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="courseSta">
	                <div class="input-group">
	                	<span class="input-group-addon">课程名称</span>
	                    <input type="text" name="courseName" class="form-control" placeholder="课程名称...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="btndiv">
	            <button class="btn btn-default" type="submit">搜索</button>
	            </div>
            </form>
        </div><!-- /.row -->
        <div class="scResult">
        	<table class="table table-hover">
        		<tr>
        			<td>课程编号</td>
        			<td>课程名称</td>
        			<td>选课人数</td>
        		</tr>
<%
		if(scResult == null || scResult.size() == 0){
%>
			<tr height="100">
				<td colspan="3" align="center">没有统计信息！</td>
			</tr>
<%
		}else{
			int size = scResult.size();
			for(int i = 0; i < size; i++){
				Course single = (Course) scResult.get(i);
%>
			<tr>
				<td><%=single.getCourseId() %></td>
				<td><%=single.getCourseName() %></td>
				<td><%=single.getCourseCount() %></td>
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
</body>
</html>