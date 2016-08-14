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
	ArrayList scResult = (ArrayList) session.getAttribute("scResult");	
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
           	<li><a href="getCourse.jsp?type=all">��ѯ�γ���Ϣ</a></li>
           	<li><a href="addCourse.jsp">���ӿγ���Ϣ</a></li>
            <li><span>ѧ��ѡ��</span></li>
            <li><a href="getSC.jsp">��ѯѡ����Ϣ</a></li>
	        <li><a href="addSC.jsp">����ѡ����Ϣ</a></li>
	        <li class="liselected"><a href="getSCResult.jsp?type=all">ѡ�ν��ͳ��</a></li>
            <li><span>ѧ���ɼ�</span></li>
            <li><a href="getInfo.jsp?type=score">��ѯѧ���ɼ�</a></li>
            <li><span><a href="getInfo.jsp?type=sta">��ʦ��Ϣ</a></span></li>
            <li><span><a href="getInfo.jsp?type=stu">ѧ����Ϣ</a></span></li>
        </ul>
    </div>
    <div class="main">
        <div class="row">
        	<form action="getSCResult.jsp?type=select" method="post">
        	<div class="courseTerm">
	                <div class="input-group">
	                	<span class="input-group-addon">ѧ��</span>
	                    <select name="courseTerm" class="form-control">
	                    	<option value="">��ѡ��...</option>
	                    	<option value="1">1</option>
	   	                    <option value="2">2</option>
	   	                    <option value="3">3</option>
	   	                    <option value="4">4</option>
	   	                    <option value="5">5</option>
	   	                    <option value="6">6</option>
	   	                    <option value="7">7</option>
	   	                    <option value="8">8</option>
	                    </select>
	                </div><!-- /input-group -->
	            </div>
	        	<div class="courseId">
	                <div class="input-group">
	                	<span class="input-group-addon">�γ̱���</span>
	                    <input type="text" name="courseId" class="form-control" placeholder="�γ̱���...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="courseSta">
	                <div class="input-group">
	                	<span class="input-group-addon">�γ�����</span>
	                    <input type="text" name="courseName" class="form-control" placeholder="�γ�����...">
	                </div><!-- /input-group -->
	            </div>
	            <div class="btndiv">
	            <button class="btn btn-default" type="submit">����</button>
	            </div>
            </form>
        </div><!-- /.row -->
        <div class="scResult">
        	<table class="table table-hover">
        		<tr>
        			<td>�γ̱��</td>
        			<td>�γ�����</td>
        			<td>ѡ������</td>
        		</tr>
<%
		if(scResult == null || scResult.size() == 0){
%>
			<tr height="100">
				<td colspan="3" align="center">û��ͳ����Ϣ��</td>
			</tr>
<%
		}else{
			int size = scResult.size();
			for(int i = 0; i < size; i++){
				Course single = (Course) scResult.get(i);
%>
			<tr>
				<td><%=single.getCourseId() %></td>
				<td><%=single.getCourseName() %></td>
				<td><%=single.getCourseCount() %></td>
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