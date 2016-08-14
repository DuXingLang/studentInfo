<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="valuebean.Course"%>
<%@ page import="valuebean.CourseSingle"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stumStuInfo.css"/>
    <link rel="stylesheet" type="text/css" href="../css/courseTable.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
<%
	ArrayList courseTable = (ArrayList) session.getAttribute("courseTable");
	ArrayList <CourseSingle> courseSingle = new ArrayList <CourseSingle> ();
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
            <li class="liselected"><a href="courseTable.jsp">�ҵĿα�</a></li>
            <li><a href="courseScore.jsp">�ɼ���ѯ</a></li>
            <li><a href="../resetPassword.jsp">�޸�����</a></li>
        </ul>
    </div>
    <div class="main">
    	<div class="row select">
        	<form action="getCourseTable.jsp?type=get" method="post">
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
        			<td>�ڿ���ʦ</td>
        			<td>�γ�ѧ��</td>
        			<td>�Ͽ�ʱ��</td>
        			<td>�Ͽεص�</td>
        		</tr>
<%
	if(courseTable == null || courseTable.size() == 0){
%>
				<tr height="100">
					<td colspan="6" align="center">û�пγ���Ϣ��</td>
				</tr>
<%
	}else{
		int size = courseTable.size();
		for(int i = 0; i < size; i++){
			Course single = (Course) courseTable.get(i);
			CourseSingle single1 = new CourseSingle();
			String courseTime = single.getCourseTime();
			String courseWeek = String.valueOf(courseTime.charAt(1));
			String start = String.valueOf(courseTime.charAt(3));
			String end = String.valueOf(courseTime.charAt(5));
			int courseStart = Integer.parseInt(start);
			int courseEnd = Integer.parseInt(end);
			int courseCount = courseEnd - courseStart+1;
			single1.setCourseName(single.getCourseName());
			single1.setCourseSta(single.getStaName());
			single1.setCourseAddr(single.getCourseAddr());
			single1.setCourseWeek(courseWeek);
			single1.setCourseStart(courseStart);
			single1.setCourseCount(courseCount);
			courseSingle.add(single1);
%>
				<tr>
					<td><%=single.getCourseId() %></td>
					<td><%=single.getCourseName() %></td>
					<td><%=single.getCourseSta() %>[<%=single.getStaName() %>]</td>
					<td><%=single.getCourseCredit() %></td>
					<td><%=single.getCourseTime() %></td>
					<td><%=single.getCourseAddr() %></td>
				</tr>
<%
		}
	}
%>
			</table>
        </div>
        <div class="courseTable">
        	<h3>��ά�α�</h3>
	    	<ul class="week classNumber">
	    		<li>�ڴ�\����</li>
	    		<li>1</li>
	    		<li>2</li>
	    		<li>3</li>
	    		<li>4</li>
	    		<li>5</li>
	    		<li>6</li>
	    		<li>7</li>
	    		<li>8</li>
	    		<li>9</li>
	    	</ul>
	    	<ul class="week" id="week1">
	    		<li>һ</li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    	</ul>
	    	<ul class="week" id="week2">
	    		<li>��</li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    	</ul>
	    	<ul class="week" id="week3">
	    		<li>��</li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    	</ul>
	    	<ul class="week" id="week4">
	    		<li>��</li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    	</ul>
	    	<ul class="week" id="week5">
	    		<li>��</li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    		<li></li>
	    	</ul>
    	</div>
    </div>
    <div class="none"></div>
    </div>
<%
	if(courseSingle == null || courseSingle.size() == 0){
%>
	<script type="text/javascript">
		$(function(){
			$(".courseTable").css("display","none");
		});
	</script>
<%
	}else{
		int size = courseSingle.size();
		for(int i = 0; i < size; i++){
			CourseSingle single1 = (CourseSingle) courseSingle.get(i);
			String courseName = single1.getCourseName();
			String courseSta = single1.getCourseSta();
			String courseAddr = single1.getCourseAddr();
			String courseWeek = single1.getCourseWeek();
			int courseStart = single1.getCourseStart();
			int courseCount = single1.getCourseCount();
%>
	<script type="text/javascript">
		$(function(){
			function insert(id){
				var start = <%=courseStart %>;
				var count = <%=courseCount %>;
				if(count==2){
					$(id).children(":eq("+(start+1)+")").remove();
					$(id).children(":eq("+start+")").css({"height":"80px","line-height":"25px","background-color":"#FFF"});
					$(id).children(":eq("+start+")").html("<%=courseName %><br/><%=courseSta %><br/><%=courseAddr %>");
				}else if(count = 3){
					$(id).children(":eq("+(start+1)+"),:eq("+(start+2)+")").remove();
					$(id).children(":eq("+start+")").css({"height":"120px","line-height":"30px","background-color":"#FFF"});
					$(id).children(":eq("+start+")").html("<%=courseName %><br/><%=courseSta %><br/><%=courseAddr %>");
				}else if(count = 4){
					$(id).children(":eq("+(start+1)+"),:eq("+(start+2)+"),:eq("+(start+3)+")").remove();
					$(id).children(":eq("+start+")").css({"height":"160px","line-height":"30px","background-color":"#FFF"});
					$(id).children(":eq("+start+")").html("<%=courseName %><br/><%=courseSta %><br/><%=courseAddr %>");
				}
			}
			if('<%=courseWeek %>'=='һ'){
				insert("#week1");
			}else if('<%=courseWeek %>'=='��'){
				insert("#week2");
			}else if('<%=courseWeek %>'=='��'){
				insert("#week3");
			}else if('<%=courseWeek %>'=='��'){
				insert("#week4");
			}else if('<%=courseWeek %>'=='��'){
				insert("#week5");
			}
		});
	</script>
<%
		}
	}
%>
</body>
</html>