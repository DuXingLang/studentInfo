<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="valuebean.SC"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
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
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>ѧ����Ϣ����</span>
        <ul>
            <li><a href="getStuInfo.jsp?type=get">������Ϣ</a></li>
            <li><a href="selectCourse.jsp">����ѡ��</a></li>
            <li><a href="selectResult.jsp">ѡ�ν��</a></li>
            <li><a href="courseTable.jsp">�ҵĿα�</a></li>
            <li class="liselected"><a href="courseScore.jsp">�ɼ���ѯ</a></li>
            <li><a href="../resetPassword.jsp">�޸�����</a></li>
        </ul>
    </div>
    <div class="main">
    	<div class="row select">
        	<form action="getCourseScore.jsp?type=get" method="post">
	        	<div class="spandiv" >
            		<span>��ѡ��ѧ�ڣ�</span>
            	</div>
                <div class="input-group selectdiv">
                	<span class="input-group-addon">ѧ��</span>
                	<select class="form-control" name="courseTerm">
   	                    <option>��ѡ��...</option>
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
            		<button class="btn btn-default" type="submit">ȷ��</button>
            	</div>
            </form>
        </div><!-- /.row -->
        <div class="updateForm selectCourseForm">
   			<table class="table table-hover">
        		<tr>
        			<td>�γ̱���</td>
        			<td>�γ�����</td>
        			<td>�γ̳ɼ�</td>
        			<td>�γ�ѧ��</td>
        			<td>��ü���</td>
        		</tr>
<%
	if(courseScore == null || courseScore.size() == 0){
%>
				<tr height="100">
					<td colspan="5" align="center">û�гɼ���Ϣ��</td>
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