<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="valuebean.SC"%>
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
	ArrayList courseScore = (ArrayList) session.getAttribute("courseScore");
%>
    <header class="heading">
        <h2 class="title">学生信息管理系统</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>，欢迎您！&nbsp;&nbsp;<a href="../index.jsp">退出</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>学生信息管理</span>
        <ul>
            <li><a href="getStuInfo.jsp?type=get">基本信息</a></li>
            <li><a href="selectCourse.jsp">网上选课</a></li>
            <li><a href="selectResult.jsp">选课结果</a></li>
            <li><a href="courseTable.jsp">我的课表</a></li>
            <li class="liselected"><a href="courseScore.jsp">成绩查询</a></li>
            <li><a href="../resetPassword.jsp">修改密码</a></li>
        </ul>
    </div>
    <div class="main">
    	<div class="row select">
        	<form action="getCourseScore.jsp?type=get" method="post">
	        	<div class="spandiv" >
            		<span>请选择学期：</span>
            	</div>
                <div class="input-group selectdiv">
                	<span class="input-group-addon">学期</span>
                	<select class="form-control" name="courseTerm">
   	                    <option>请选择...</option>
   	                    <option>1</option>
   	                    <option>2</option>
   	                    <option>3</option>
   	                    <option>4</option>
   	                    <option>5</option>
   	                    <option>6</option>
   	                    <option>7</option>
   	                    <option>8</option>
                    </select>
                </div><!-- /input-group -->
	            <div class="btndiv newbtndiv">
            		<button class="btn btn-default" type="submit">确定</button>
            	</div>
            </form>
        </div><!-- /.row -->
        <div class="updateForm selectCourseForm">
   			<table class="table table-hover">
        		<tr>
        			<td>课程编码</td>
        			<td>课程名称</td>
        			<td>课程成绩</td>
        			<td>课程学分</td>
        			<td>获得绩点</td>
        		</tr>
<%
	if(courseScore == null || courseScore.size() == 0){
%>
				<tr height="100">
					<td colspan="5" align="center">没有成绩信息！</td>
				</tr>
<%
	}else{
		int size = courseScore.size();
		for(int i = 0; i < size; i++){
			SC single = (SC) courseScore.get(i);
%>
				<tr>
					<td><%=single.getCourseId() %></td>
					<td><%=single.getCourseName() %></td>
					<td><%=single.getScore() %></td>
					<td><%=single.getCredit() %></td>
					<td><%=single.getGpa() %></td>
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