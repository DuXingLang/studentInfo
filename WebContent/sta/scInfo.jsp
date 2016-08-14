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
	ArrayList staCourse1 = (ArrayList) session.getAttribute("staCourse1");
	ArrayList scInfo = (ArrayList) session.getAttribute("scInfo");
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
            <li class="liselected"><a href="getSCInfo.jsp?type=select">¼��ɼ�</a></li>
            <li><a href="searchScore.jsp?type=select">�ɼ���ѯ</a></li>
            <li><a href="../resetPassword.jsp">�޸�����</a></li>
        </ul>
    </div>
    <div class="main">
    	<div class="row select">
        	<form action="getSCInfo.jsp?type=get" method="post">
	        	<div class="spandiv" >
            		<span>��ѡ��γ̣�</span>
            	</div>
                <div class="input-group selectdiv">
                	<span class="input-group-addon">�γ�</span>
                    <select class="form-control" name="courseId">
                    	<option>��ѡ��...</option>
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
            		<button class="btn btn-default" type="submit">ȷ��</button>
            	</div>
            </form>
        </div><!-- /.row -->
        <div class="updateForm scupdateForm">
        	<form class="form-horizontal" action="insertScore.jsp" method="post">
    			<table class="table table-hover">
	        		<tr>
	        			<td>ѧ��</td>
	        			<td>����</td>
	        			<td>�γ�</td>
	        			<td>�ɼ�</td>
	        		</tr>
<%
		if(scInfo == null || scInfo.size() == 0){
%>
					<tr height="100">
						<td colspan="4" align="center">û��ѡ����Ϣ��</td>
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
					            <button type="submit" class="btn btn-default">�ύ</button>
					            <button type="reset" class="btn btn-default">����</button>
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