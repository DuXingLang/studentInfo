<%@ page language="java" contentType="text/html; charset=GB2312" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="valuebean.Course"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stcManager.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
<%
	ArrayList courselist = (ArrayList) session.getAttribute("courselist");	
%>
    <header class="heading">
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>������Ϣ����</span>
        <ul>
            <li><span>�γ�����</span></li>
           	<li class="liselected"><a href="getCourse.jsp?type=all">��ѯ�γ���Ϣ</a></li>
           	<li><a href="addCourse.jsp">��ӿγ���Ϣ</a></li>
            <li><span>ѧ��ѡ��</span></li>
            <li><a href="getSC.jsp?type=all">��ѯѡ����Ϣ</a></li>
	        <li><a href="addSC.jsp">���ѡ����Ϣ</a></li>
	        <li><a href="getSCResult.jsp?type=all">ѡ�ν��ͳ��</a></li>
            <li><span>ѧ���ɼ�</span></li>
            <li><a href="getInfo.jsp?type=score">��ѯѧ���ɼ�</a></li>
            <li><span><a href="getInfo.jsp?type=sta">��ʦ��Ϣ</a></span></li>
            <li><span><a href="getInfo.jsp?type=stu">ѧ����Ϣ</a></span></li>
        </ul>
    </div>
    <div class="main">
        <div class="row">
        	<form action="getCourse.jsp?type=select" method="post">
	        	<div class="courseId">
	                <div class="input-group">
	                	<span class="input-group-addon">�γ�����</span>
	                    <input type="text" name="courseName" class="form-control" placeholder="�γ�����...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="courseSta">
	                <div class="input-group">
	                	<span class="input-group-addon">��ʦ����</span>
	                    <input type="text" name="courseSta" class="form-control" placeholder="��ʦ����...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="btndiv">
	            <button class="btn btn-default" type="submit">����</button>
	            </div>
            </form>
        </div><!-- /.row -->
        <div class="courseInfo">
        	<table class="table table-hover">
        		<tr>
        			<td>���</td>
        			<td>����</td>
        			<td>��ʦ</td>
        			<td>ʱ��</td>
        			<td>�ص�</td>
        			<td>ѧ��</td>
        			<td>����</td>
        			<td>ɾ��</td>
        		</tr>
<%
		if(courselist == null || courselist.size() == 0){
%>
			<tr height="100">
				<td colspan="8" align="center">û�пγ���Ϣ��</td>
			</tr>
<%
		}else{
			int size = courselist.size();
			for(int i = 0; i < size; i++){
				Course single = (Course) courselist.get(i);
%>
			<tr>
				<td><a href="updateCourse.jsp?myId=<%=i %>"><%=single.getCourseId() %></a></td>
				<td><%=single.getCourseName() %></td>
				<td><%=single.getCourseSta()%>[<%=single.getStaName() %>]</td>
				<td><%=single.getCourseTime() %></td>
				<td><%=single.getCourseAddr() %></td>
				<td><%=single.getCourseCredit() %></td>
				<td><%=single.getTypeName() %></td>
				<td><a href="doCourse.jsp?type=delete&courseId=<%=single.getCourseId()%>">ɾ��</a></td>
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
<%
	session.setAttribute("courselist", courselist);
%>
</body>
</html>