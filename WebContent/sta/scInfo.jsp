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
	ArrayList staCourse1 = (ArrayList) session.getAttribute("staCourse1");
	ArrayList scInfo = (ArrayList) session.getAttribute("scInfo");
%>
    <header class="heading">
        <h2 class="title">学生信息管理系统</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>，欢迎您！&nbsp;&nbsp;<a href="../index.jsp">退出</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>学生信息管理</span>
        <ul>
            <li><a href="getStaInfo.jsp?type=get">基本信息</a></li>
            <li class="liselected"><a href="getSCInfo.jsp?type=select">录入成绩</a></li>
            <li><a href="searchScore.jsp?type=select">成绩查询</a></li>
            <li><a href="../resetPassword.jsp">修改密码</a></li>
        </ul>
    </div>
    <div class="main">
    	<div class="row select">
        	<form action="getSCInfo.jsp?type=get" method="post">
	        	<div class="spandiv" >
            		<span>请选择课程：</span>
            	</div>
                <div class="input-group selectdiv">
                	<span class="input-group-addon">课程</span>
                    <select class="form-control" name="courseId">
                    	<option>请选择...</option>
<%
						for(int i=0;i<staCourse1.size();i++){
							SC single = (SC) staCourse1.get(i);
%>
						<option value="<%=single.getCourseId() %>"><%=single.getCourseId() %>[<%=single.getCourseName() %>]</option>
<%								
						}
%>
                    </select>
                </div><!-- /input-group -->
	            <div class="btndiv newbtndiv">
            		<button class="btn btn-default" type="submit">确定</button>
            	</div>
            </form>
        </div><!-- /.row -->
        <div class="updateForm scupdateForm">
        	<form class="form-horizontal" action="insertScore.jsp" method="post">
    			<table class="table table-hover">
	        		<tr>
	        			<td>学号</td>
	        			<td>姓名</td>
	        			<td>课程</td>
	        			<td>成绩</td>
	        		</tr>
<%
		if(scInfo == null || scInfo.size() == 0){
%>
					<tr height="100">
						<td colspan="4" align="center">没有选课信息！</td>
					</tr>
<%
		}else{
			int size = scInfo.size();
			for(int i = 0; i < size; i++){
				SC single = (SC) scInfo.get(i);
%>
					<tr>
						<td><%=single.getStuId() %></td>
						<td><%=single.getStuName() %></td>
						<td><%=single.getCourseId() %>[<%=single.getCourseName() %>]</td>
						<td><input type="text" name="score" placeHolder="0"/></td>
					</tr>
<%
			}
%>
					<tr>
						<td colspan="4" align="center">
							<div class="col-sm-offset-2 col-sm-10">
					            <button type="submit" class="btn btn-default">提交</button>
					            <button type="reset" class="btn btn-default">重置</button>
	        				</div>
						</td>
					</tr>
<%
		}
%>
				</table>
	      </form>
        </div>
    </div>
    <div class="none"></div>
    </div>
</body>
</html>