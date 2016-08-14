<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="valuebean.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
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
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>ѧ����Ϣ����</span>
        <ul>
            <li class="liselected"><a href="getStuInfo.jsp?type=get">������Ϣ</a></li>
            <li><a href="selectCourse.jsp">����ѡ��</a></li>
            <li><a href="selectResult.jsp">ѡ�ν��</a></li>
            <li><a href="courseTable.jsp">�ҵĿα�</a></li>
            <li><a href="courseScore.jsp">�ɼ���ѯ</a></li>
            <li><a href="../resetPassword.jsp">�޸�����</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="updateForm">
        	<form class="form-horizontal" action="getStuInfo.jsp?type=update" method="post">
    			<div class="form-group">
			        <label for="stuId" class="col-sm-2 control-label">ѧ��</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="stuId" name="stuId" value="<%=single.getStuId() %>" readonly />
			        </div>
    			</div>
			    <div class="form-group">
			        <label for="stuName" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="stuName" name="stuName" value="<%=single.getStuName() %>" readonly>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="stuSex" class="col-sm-2 control-label">�Ա�</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="stuSex" name="stuSex">
<% 
						    if(single.getStuSex().equals("��")){
							out.print("<option value=\"��\" selected>��</option>");
						    }else{
								out.print("<option value=\"Ů\" selected>Ů</option>");
						    }
%>
						</select>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="department" class="col-sm-2 control-label">Ժϵ</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="department" name="department" value="<%=single.getDepartment() %>" readonly/>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="major" class="col-sm-2 control-label">רҵ</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="major" name="major" value="<%=single.getMajor() %>" readonly/>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="classId" class="col-sm-2 control-label">�༶</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="classId" name="classId" value="<%=single.getClassId() %>" readonly/>
			        </div>
			    </div>
   			    <div class="form-group">
			        <label for="birthday" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="birthday" name="birthday" value="<%=single.getBirthday() %>" readonly/>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="address" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="address" name="address" value="<%=single.getAddress() %>" />
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="phone" class="col-sm-2 control-label">�ֻ�</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="phone" name="phone" value="<%=single.getPhone() %>" />
			        </div>
			    </div>
			    <div class="form-group">
			        <div class="col-sm-offset-2 col-sm-10">
			            <button type="submit" class="btn btn-default">�ύ</button>
			            <button type="reset" class="btn btn-default">����</button>
			        </div>
			    </div>
			</form>
        </div>
    </div>
    <div class="none"></div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$("#update").click(function(){
    			window.loction.href='getStuInfo.jsp?type=update';
    		});
    	});
    </script>
</body>
</html>