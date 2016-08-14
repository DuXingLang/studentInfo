<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="valuebean.Course"%>
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
	ArrayList selectResult = (ArrayList) session.getAttribute("selectResult");
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
            <li class="liselected"><a href="selectResult.jsp">选课结果</a></li>
            <li><a href="courseTable.jsp">我的课表</a></li>
            <li><a href="courseScore.jsp">成绩查询</a></li>
            <li><a href="../resetPassword.jsp">修改密码</a></li>
        </ul>
    </div>
    <div class="main">
    	<div class="row select">
        	<form action="doResult.jsp?type=get" method="post">
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
        			<td>授课老师</td>
        			<td>课程学分</td>
        			<td>上课时间</td>
        			<td>上课地点</td>
        			<td>退选</td>
        		</tr>
<%
	if(selectResult == null || selectResult.size() == 0){
%>
				<tr height="100">
					<td colspan="7" align="center">没有课程信息！</td>
				</tr>
<%
	}else{
		int size = selectResult.size();
		for(int i = 0; i < size; i++){
			Course single = (Course) selectResult.get(i);
%>
				<tr>
					<td><%=single.getCourseId() %></td>
					<td><%=single.getCourseName() %></td>
					<td><%=single.getCourseSta() %>[<%=single.getStaName() %>]</td>
					<td><%=single.getCourseCredit() %></td>
					<td><%=single.getCourseTime() %></td>
					<td><%=single.getCourseAddr() %></td>
					<td><a href="doResult.jsp?type=delete&courseId=<%=single.getCourseId() %>">退选</a></td>
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