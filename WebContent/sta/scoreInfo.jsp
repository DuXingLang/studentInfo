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
	ArrayList staCourse = (ArrayList)session.getAttribute("staCourse");
	ArrayList stuScore = (ArrayList) session.getAttribute("stuScore");
%>
    <header class="heading">
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>ѧ����Ϣ����</span>
        <ul>
            <li><a href="getStaInfo.jsp?type=get">������Ϣ</a></li>
            <li><a href="getSCInfo.jsp?type=select">¼��ɼ�</a></li>
            <li class="liselected"><a href="searchScore.jsp?type=select">�ɼ���ѯ</a></li>
            <li><a href="../resetPassword.jsp">�޸�����</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="row select">
        	<form action="searchScore.jsp?type=get" method="post">
	        	<div class="spandiv" >
            		<span>��ѡ��γ̣�</span>
            	</div>
                <div class="input-group selectdiv">
                	<span class="input-group-addon">�γ�</span>
                    <select class="form-control" name="courseId">
                    	<option>��ѡ��...</option>
<%
						for(int i=0;i<staCourse.size();i++){
							SC single = (SC) staCourse.get(i);
%>
						<option value="<%=single.getCourseId() %>"><%=single.getCourseId() %>[<%=single.getCourseName() %>]</option>
<%								
						}
%>
                    </select>
                </div><!-- /input-group -->
	            <div class="btndiv newbtndiv">
            		<button class="btn btn-default" type="submit">ȷ��</button>
            	</div>
            </form>
        </div><!-- /.row -->
        <div class="scInfo">
        	<table class="table table-hover">
        		<tr>
        			<td>ѧ��</td>
        			<td>����</td>
        			<td>�γ�</td>
        			<td>�ɼ�</td>
        			<td>ѧ��</td>
        			<td>����</td>
        		</tr>
<%
		if(stuScore == null || stuScore.size() == 0){
%>
			<tr height="100">
				<td colspan="6" align="center">û��ѡ����Ϣ��</td>
			</tr>
<%
		}else{
			int size = stuScore.size();
			for(int i = 0; i < size; i++){
				SC single = (SC) stuScore.get(i);
%>
			<tr>
				<td><%=single.getStuId() %></td>
				<td><%=single.getStuName() %></td>
				<td><%=single.getCourseId() %>[<%=single.getCourseName() %>]</td>
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