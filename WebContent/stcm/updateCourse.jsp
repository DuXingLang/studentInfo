<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.util.ArrayList"%>
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
	int myId = Integer.parseInt(request.getParameter("myId"));
	Course single = (Course) courselist.get(myId);
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
        <div class="updateForm">
        	<form class="form-horizontal" action="doCourse.jsp?type=update" method="post">
    			<div class="form-group">
			        <label for="courseId" class="col-sm-2 control-label">课程编号</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseId" name="courseId" value="<%=single.getCourseId() %>" readonly>
			        </div>
    			</div>
			    <div class="form-group">
			        <label for="courseName" class="col-sm-2 control-label">课程名称</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseName" name="courseName" value="<%=single.getCourseName() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseSta" class="col-sm-2 control-label">授课教师</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseSta" name="courseSta" value="<%=single.getCourseSta() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseTime" class="col-sm-2 control-label">上课时间</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseTime" name="courseTime" value="<%=single.getCourseTime() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseAddr" class="col-sm-2 control-label">上课地点</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseAddr" name="courseAddr" value="<%=single.getCourseAddr() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseCredit" class="col-sm-2 control-label">课程学分</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseCredit" name="courseCredit" value="<%=single.getCourseCredit() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseType" class="col-sm-2 control-label">类型</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="courseType" name="courseType">
<% 
						    if(single.getCourseType()==0){
							out.print("<option value=\"0\" selected>必修课</option>");
							out.print("<option value=\"1\">选修课</option>");
						    }else{
						    	out.print("<option value=\"0\">必修课</option>");
								out.print("<option value=\"1\" selected>选修课</option>");
						    }
%>
						</select>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseTerm" class="col-sm-2 control-label">类型</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="courseTerm" name="courseTerm">
							<option value="1">1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						    <option value="5">5</option>
						    <option value="6">6</option>
						    <option value="7">7</option>
						    <option value="8">8</option>
						</select>
			        </div>
			    </div>
			    <div class="form-group">
			        <div class="col-sm-offset-2 col-sm-10">
			            <button type="submit" class="btn btn-default">提交</button>
			            <button type="reset" class="btn btn-default">重置</button>
			        </div>
			    </div>
			</form>
        </div>
    </div>
    <div class="none"></div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$("#courseTerm").val('<%=single.getCourseTerm() %>');
    	});
    </script>
</body>
</html>