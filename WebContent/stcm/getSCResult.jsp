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
			String courseTerm = request.getParameter("courseTerm");
			String courseName = MyTools.toChinese(request.getParameter("courseName"));
			String courseId = request.getParameter("courseId");
			if(courseTerm != null && courseTerm !=""){
				if (courseName.length()!=0) {
					if (courseId != null && courseId != "") {
						sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
								+ "sc.courseId=course_table.courseId and course_table.courseName like '%"+courseName+"%' "
								+"and sc.courseId like '"+courseId+"%' group by sc.courseId";
					} else {
						sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
								+ "sc.courseId=course_table.courseId and course_table.courseName like '%"+courseName+"%' "
								+"group by sc.courseId";
					}
				} else {
					if (courseId != null && courseId != "") {
						sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
								+ "sc.courseId=course_table.courseId and sc.courseId like '"+courseId+"%' group by sc.courseId";
					}else {
						sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
								+ "sc.courseId=course_table.courseId and course_table.courseTerm="+courseTerm+" group by sc.courseId";
					}
				} 
			}else{
				if (courseName.length()!=0) {
					if (courseId != null && courseId != "") {
						sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
								+ "sc.courseId=course_table.courseId and course_table.courseName like '%"+courseName+"%' "
								+"and sc.courseId like '"+courseId+"%' group by sc.courseId";
					} else {
						sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
								+ "sc.courseId=course_table.courseId and course_table.courseName like '%"+courseName+"%' "
								+"group by sc.courseId";
					}
				} else {
					if (courseId != null && courseId != "") {
						sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
								+ "sc.courseId=course_table.courseId and sc.courseId like '"+courseId+"%' group by sc.courseId";
					}else {
						sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
								+ "sc.courseId=course_table.courseId group by sc.courseId";
					}
				}
			}
		} else {
			sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
					+ "sc.courseId=course_table.courseId group by sc.courseId";
		}
	} catch (Exception e) {
		sql = "select sc.courseId,course_table.courseName,count(sc.courseId) courseCount from sc,course_table where "
				+ "sc.courseId=course_table.courseId group by sc.courseId";
	}
	Connectdb connection = new Connectdb();
	ResultSet rs = connection.executeQuery(sql);//执行SQL语句并取得结果集
%>
<%
	ArrayList <Course> scResult = new ArrayList <Course> ();
	while(rs.next()){
		Course single = new Course();
		single.setCourseId(rs.getString("courseId"));
		single.setCourseName(rs.getString("courseName"));
		single.setCourseCount(rs.getInt("courseCount"));
		scResult.add(single);
	}
	
	session.setAttribute("scResult", scResult);
	response.sendRedirect("scResult.jsp");
%>