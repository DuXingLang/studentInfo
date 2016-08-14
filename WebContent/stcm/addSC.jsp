<%@ page language="java" contentType="text/html; charset=GB2312"%>
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
            <li><a href="getSC.jsp?type=all">查询选课信息</a></li>
	        <li class="liselected"><a href="addSC.jsp">添加选课信息</a></li>
	        <li><a href="getSCResult.jsp?type=all">选课结果统计</a></li>
            <li><span>学生成绩</span></li>
            <li><a href="getInfo.jsp?type=score">查询学生成绩</a></li>
            <li><span><a href="getInfo.jsp?type=sta">教师信息</a></span></li>
            <li><span><a href="getInfo.jsp?type=stu">学生信息</a></span></li>
        </ul>
    </div>
    <div class="main">
        <div class="updateForm">
        	<form class="form-horizontal" action="doSC.jsp?type=insert" method="post">
    			<div class="form-group">
			        <label for="stuId" class="col-sm-2 control-label">学号</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="stuId" name="stuId" placeholder="学号">
			        </div>
    			</div>
			    <div class="form-group">
			        <label for="courseId" class="col-sm-2 control-label">课程编码</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseId" name="courseId" placeholder="课程编码">
			        </div>
			    </div>
			    <!-- <div class="form-group">
			        <label for="courseType" class="col-sm-2 control-label">类型</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="courseType" name="courseType">
						    <option value="0">必修课</option>
						    <option value="1">选修课</option>
						</select>
			        </div>
			    </div> -->
			    <div class="form-group">
			        <div class="col-sm-offset-2 col-sm-10">
			            <button type="submit" class="btn btn-default">提交</button>
			            <button type="reset" class="btn btn-default">重置</button>
			        </div>
			    </div>
			</form>
        </div>
        <hr/>
        <div class="insertAll">
        	<form action="doSC.jsp?type=insertAll" method="post">
        		<h3>为所有学生选择所有必修课程？ <button type="submit" class="btn btn-info">确定</button></h3>
        	</form>
        </div>
    </div>
    <div class="none"></div>
    </div>
</body>
</html>