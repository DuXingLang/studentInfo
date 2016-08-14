<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%@ page import="valuebean.Course"%>
<%
	String sql;
	try {
		String type = request.getParameter("type");
		if (type.equals("select")) {
			String courseName = MyTools.toChinese(request.getParameter("courseName"));
			String courseSta = request.getParameter("courseSta");
			if (courseName != null && courseName != "") {
				if (courseSta != null && courseSta != "") {
					sql = "select course_table.courseId,course_table.courseName,course_table.courseSta,sta_table.staName,"
							+"course_table.courseTime,course_table.courseAddr,course_table.courseCredit,course_type.typeName "
							+ "from course_table,course_type,sta_table where course_table.courseType=course_type.courseType and course_table.courseSta=sta_table.staId "
							+"and course_table.courseName like '%"+courseName+"%' and course_table.courseSta like '"+courseSta+"%'";
				} else {
					sql = "select course_table.courseId,course_table.courseName,course_table.courseSta,sta_table.staName,"
							+"course_table.courseTime,course_table.courseAddr,course_table.courseCredit,course_type.typeName "
							+ "from course_table,course_type,sta_table where course_table.courseType=course_type.courseType and course_table.courseSta=sta_table.staId "
							+"and course_table.courseName like '%"+courseName+"%'";
				}
			} else {
				if (courseSta != null && courseSta != "") {
					sql = "select course_table.courseId,course_table.courseName,course_table.courseSta,sta_table.staName,"
							+"course_table.courseTime,course_table.courseAddr,course_table.courseCredit,course_type.typeName "
							+ "from course_table,course_type,sta_table where course_table.courseType=course_type.courseType and course_table.courseSta=sta_table.staId "
							+"and course_table.courseSta like '"+courseSta+"%'";
				}else {
					sql = "select course_table.courseId,course_table.courseName,course_table.courseSta,sta_table.staName,"
							+"course_table.courseTime,course_table.courseAddr,course_table.courseCredit,course_type.typeName "
							+ "from course_table,course_type,sta_table where course_table.courseType=course_type.courseType and course_table.courseSta=sta_table.staId ";
				}
			} 
		} else {
			sql = "select course_table.courseId,course_table.courseName,course_table.courseSta,sta_table.staName,"
					+"course_table.courseTime,course_table.courseAddr,course_table.courseCredit,course_type.typeName "
					+ "from course_table,course_type,sta_table where course_table.courseType=course_type.courseType and course_table.courseSta=sta_table.staId";
		}
	} catch (Exception e) {
		sql = "select course_table.courseId,course_table.courseName,course_table.courseSta,sta_table.staName,"
				+"course_table.courseTime,course_table.courseAddr,course_table.courseCredit,course_type.typeName "
				+ "from course_table,course_type,sta_table where course_table.courseType=course_type.courseType and course_table.courseSta=sta_table.staId";
	}
	Connectdb connection = new Connectdb();
	ResultSet rs = connection.executeQuery(sql);//执行SQL语句并取得结果集
%>
<%
	ArrayList <Course> courselist = new ArrayList <Course> ();
	while(rs.next()){
		Course single = new Course();
		single.setCourseId(rs.getString("courseId"));
		single.setCourseName(rs.getString("courseName"));
		single.setCourseSta(rs.getString("courseSta"));
		single.setStaName(rs.getString("staName"));
		single.setCourseTime(rs.getString("courseTime"));
		single.setCourseAddr(rs.getString("courseAddr"));
		single.setCourseCredit(rs.getInt("courseCredit"));
		single.setTypeName(rs.getString("typeName"));
		courselist.add(single);
	}
	
	session.setAttribute("courselist", courselist);
	response.sendRedirect("courseInfo.jsp");
%>