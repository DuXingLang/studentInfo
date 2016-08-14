<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.Course"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	try {
		String type = request.getParameter("type");
		if(type.equals("get")){
			int courseTerm = MyTools.strToint(request.getParameter("courseTerm"));
			String stuId = (String)session.getAttribute("userId");
			String sql = "select course_table.courseId,course_table.courseName,course_table.courseSta,sta_table.staName, "
					+"course_table.courseCredit,course_table.courseTime,course_table.courseAddr from "
					+"course_table,sta_table,sc where course_table.courseSta=sta_table.staId and "
					+"course_table.courseId=sc.courseId and course_table.courseTerm='"+courseTerm+"' and sc.stuId='"+stuId+"'";
			Connectdb cdb = new Connectdb();
			ResultSet rs = cdb.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <Course> courseTable = new ArrayList <Course> ();
			while(rs.next()){
				Course single = new Course();
				single.setCourseId(rs.getString("courseId"));
				single.setCourseName(rs.getString("courseName"));
				single.setCourseSta(rs.getString("courseSta"));
				single.setStaName(rs.getString("staName"));
				single.setCourseCredit(rs.getInt("courseCredit"));
				single.setCourseTime(rs.getString("courseTime"));
				single.setCourseAddr(rs.getString("courseAddr"));
				courseTable.add(single);
			}
			session.setAttribute("courseTable", courseTable);
			response.sendRedirect("courseTable.jsp");
		} else {
			response.sendRedirect("courseTable.jsp");
		}
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('查询出错！');"); 
		out.println("window.location.href='Student.jsp';");
		out.println("</script>");
	}
%>