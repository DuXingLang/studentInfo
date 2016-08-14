<%@ page language="java" contentType="text/html; charset=GB2312" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="valuebean.Teacher"%>
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
	ArrayList sta = (ArrayList) session.getAttribute("sta");	
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
	        <li><a href="getSCResult.jsp?type=all">选课结果统计</a></li>
            <li><span>学生成绩</span></li>
            <li><a href="getInfo.jsp?type=score">查询学生成绩</a></li>
            <li><span><a href="getInfo.jsp?type=sta">教师信息</a></span></li>
            <li><span><a href="getInfo.jsp?type=stu">学生信息</a></span></li>
        </ul>
    </div>
    <div class="main">
        <div class="row">
        	<form action="getInfo.jsp?type=sta" method="post">
	        	<div class="courseId">
	                <div class="input-group">
	                	<span class="input-group-addon">工号</span>
	                    <input type="text" name="staId" class="form-control" placeholder="工号...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="courseSta">
	                <div class="input-group">
	                	<span class="input-group-addon">姓名</span>
	                    <input type="text" name="staName" class="form-control" placeholder="姓名...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="btndiv">
	            <button class="btn btn-default" type="submit">搜索</button>
	            </div>
            </form>
        </div><!-- /.row -->
        <div class="scInfo">
        	<table class="table table-hover">
        		<tr>
        			<td>工号</td>
        			<td>姓名</td>
        			<td>性别</td>
        			<td>院系</td>
        			<td>生日</td>
        			<td>籍贯</td>
        			<td>手机</td>
        		</tr>
<%
		if(sta == null || sta.size() == 0){
%>
			<tr height="100">
				<td colspan="7" align="center">没有选课信息！</td>
			</tr>
<%
		}else{
			int size = sta.size();
			for(int i = 0; i < size; i++){
				Teacher single = (Teacher) sta.get(i);
%>
			<tr>
				<td><%=single.getStaId() %></td>
				<td><%=single.getStaName() %></td>
				<td><%=single.getStaSex() %></td>
				<td><%=single.getDepartment() %></td>
				<td><%=single.getBirthday() %></td>
				<td><%=single.getAddress() %></td>
				<td><%=single.getPhone() %></td>
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