<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="valuebean.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>学生信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
<%
	ArrayList stu = (ArrayList) session.getAttribute("stu");
	Student single = (Student) stu.get(0);
%>
	<header class="heading">
        <h2 class="title">学生信息管理系统</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>，欢迎您！&nbsp;&nbsp;<a href="../index.jsp">退出</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>学生信息管理</span>
        <ul>
            <li class="liselected"><a href="getStuInfo.jsp?type=get">基本信息</a></li>
            <li><a href="selectCourse.jsp">网上选课</a></li>
            <li><a href="selectResult.jsp">选课结果</a></li>
            <li><a href="courseTable.jsp">我的课表</a></li>
            <li><a href="courseScore.jsp">成绩查询</a></li>
            <li><a href="../resetPassword.jsp">修改密码</a></li>
        </ul>
    	</div>
		<div class="main">
	        <div class="updateForm">
	        	<form class="form-horizontal" action="#" method="post">
	    			<div class="form-group">
				        <label for="staId" class="col-sm-2 control-label">学号</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="stuId" name="stuId" value="<%=single.getStuId() %>" disabled />
				        </div>
	    			</div>
				    <div class="form-group">
				        <label for="stuName" class="col-sm-2 control-label">姓名</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="stuName" name="stuName" value="<%=single.getStuName() %>" disabled>
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="stuSex" class="col-sm-2 control-label">性别</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="stuSex" name="stuSex" value="<%=single.getStuSex() %>" disabled>
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="department" class="col-sm-2 control-label">院系</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="department" name="department" value="<%=single.getDepartment() %>" disabled>
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="major" class="col-sm-2 control-label">专业</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="major" name="major" value="<%=single.getMajor() %>" disabled>
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="classId" class="col-sm-2 control-label">班级</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="classId" name="classId" value="<%=single.getClassId() %>" disabled>
				        </div>
				    </div>
	   			    <div class="form-group">
				        <label for="birthday" class="col-sm-2 control-label">生日</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="birthday" name="birthday" value="<%=single.getBirthday() %>" disabled>
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="address" class="col-sm-2 control-label">籍贯</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="address" name="address" value="<%=single.getAddress() %>" disabled>
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="phone" class="col-sm-2 control-label">手机</label>
				        <div class="col-sm-10">
				            <input type="text" class="form-control" id="phone" name="phone" value="<%=single.getPhone() %>" disabled>
				        </div>
				    </div>
				</form>
				<div class="col-sm-offset-2 col-sm-10">
		            <a href="updateStuInfo.jsp" class="btn btn-default" id="update">修改</a>
		        </div>
	        </div>
	    </div>
	   	<div class="none"></div>
   	</div>
<%
	session.setAttribute("stu", stu);
%>
</body>
</html>