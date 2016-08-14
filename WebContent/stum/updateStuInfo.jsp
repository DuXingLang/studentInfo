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
	ArrayList studentslist = (ArrayList) session.getAttribute("studentslist");
	int myId = Integer.parseInt(request.getParameter("myId"));
	Student single = (Student) studentslist.get(myId);
%>
    <header class="heading">
        <h2 class="title">学生信息管理系统</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>，欢迎您！&nbsp;&nbsp;<a href="../index.jsp">退出</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>学生信息管理</span>
        <ul>
            <li><a href="getStuInfo.jsp?type=all">查询学生信息</a></li>
            <li><a href="insertStuInfo.jsp?type=insert">插入学生信息</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="updateForm">
        	<form class="form-horizontal" action="doStuInfo.jsp?type=update" method="post">
    			<div class="form-group">
			        <label for="stuId" class="col-sm-2 control-label">学号</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="stuId" name="stuId" value="<%=single.getStuId() %>"readonly />
			        </div>
    			</div>
			    <div class="form-group">
			        <label for="stuName" class="col-sm-2 control-label">姓名</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="stuName" name="stuName" value="<%=single.getStuName() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="stuSex" class="col-sm-2 control-label">性别</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="stuSex" name="stuSex">
<% 
						    if(single.getStuSex().equals("男")){
							out.print("<option value=\"男\" selected>男</option>");
							out.print("<option value=\"女\">女</option>");
						    }else{
						    	out.print("<option value=\"男\">男</option>");
								out.print("<option value=\"女\" selected>女</option>");
						    }
%>
						</select>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="department" class="col-sm-2 control-label">院系</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="department" name="department" value="<%=single.getDepartment() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="major" class="col-sm-2 control-label">专业</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="major" name="major" value="<%=single.getMajor() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="classId" class="col-sm-2 control-label">班级</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="classId" name="classId" value="<%=single.getClassId() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="address" class="col-sm-2 control-label">籍贯</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="address" name="address" value="<%=single.getAddress() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="birthday" class="col-sm-2 control-label">生日</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="birthday" name="birthday" value="<%=single.getBirthday() %>">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="phone" class="col-sm-2 control-label">手机</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="phone" name="phone" value="<%=single.getPhone() %>">
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
</body>
</html>