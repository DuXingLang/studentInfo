<%@ page language="java" contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.Course"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	Connectdb cdb = new Connectdb();
	String type = request.getParameter("type");
	if (type == null)
		type = "";
	if(type.equals("delete")){
		String courseId = request.getParameter("courseId");
		String sql = "delete from course_table where courseId='" + courseId + "'";
		cdb.executeUpdate(sql);
		response.sendRedirect("getCourse.jsp");
	}else if(type.equals("update")){
		String courseId = request.getParameter("courseId");
		String courseName = MyTools.toChinese(request.getParameter("courseName"));
		String courseSta = request.getParameter("courseSta");
		String courseTime = MyTools.toChinese(request.getParameter("courseTime"));
		String courseAddr = MyTools.toChinese(request.getParameter("courseAddr"));
		int courseCredit = MyTools.strToint(request.getParameter("courseCredit"));
		int courseType = MyTools.strToint(request.getParameter("courseType"));
		int courseTerm = MyTools.strToint(request.getParameter("courseTerm"));
		String sql = "update course_table set courseId='" + courseId + "',courseName='" + courseName 
				+ "',courseSta='" + courseSta + "',courseTime='" + courseTime 
				+ "',courseCredit=" + courseCredit +",courseAddr='" + courseAddr + "',courseType=" + courseType
				+ ",courseTerm="+courseTerm+" where courseId='" + courseId + "'";
		cdb.executeUpdate(sql);
		response.sendRedirect("getCourse.jsp");
	}else if(type.equals("insert")){
		String courseId = request.getParameter("courseId");
		String courseName = MyTools.toChinese(request.getParameter("courseName"));
		String courseSta = request.getParameter("courseSta");
		String courseTime = MyTools.toChinese(request.getParameter("courseTime"));
		String courseAddr = MyTools.toChinese(request.getParameter("courseAddr"));
		int courseCredit = MyTools.strToint(request.getParameter("courseCredit"));
		int courseType = MyTools.strToint(request.getParameter("courseType"));
		int courseTerm = MyTools.strToint(request.getParameter("courseTerm"));
		String sql = "select * from course_table where courseId='"+courseId+"'";
		ResultSet rs = cdb.executeQuery(sql);
		if (rs.next()) {
%>
		<script type="text/javascript">
			alert("您输入的课程编号已存在！");
			window.location.href="addCourse.jsp";
		</script>
<%
			return;
		}
		String sql1 = "insert into course_table values('" + courseId + "','" + courseName + "','" + courseSta + "','" 
				+ courseTime + "'," + courseCredit + ",'" + courseAddr + "'," + courseType + ","+courseTerm+")";
		cdb.executeUpdate(sql1);
%>
		<script type="text/javascript">
			alert("添加成功！");
			window.location.href="addCourse.jsp";
		</script>
<%
	}else{
		response.sendRedirect("getCourse.jsp");
	}
%>