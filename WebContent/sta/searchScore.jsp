<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.SC"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	try {
		String type = request.getParameter("type");
		if(type.equals("select")){
			String staId = (String)session.getAttribute("userId");
			String sql = "select courseId,courseName from course_table where courseId in(select courseId from sc) "
					+"and courseSta='"+staId+"'";
			Connectdb cdb = new Connectdb();
			ResultSet rs = cdb.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <SC> staCourse = new ArrayList <SC> ();
			while(rs.next()){
				SC single = new SC();
				single.setCourseId(rs.getString("courseId"));
				single.setCourseName(rs.getString("courseName"));
				staCourse.add(single);
			}
			session.setAttribute("staCourse", staCourse);
			response.sendRedirect("scoreInfo.jsp");
		}else if(type.equals("get")){
			String courseId = request.getParameter("courseId");
			String sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa from "
					+"sc,stu_table,course_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
					+"and sc.courseId='"+courseId+"'";
			Connectdb cdb = new Connectdb();
			ResultSet rs = cdb.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <SC> stuScore = new ArrayList <SC> ();
			while(rs.next()){
				SC single = new SC();
				single.setStuId(rs.getString("stuId"));
				single.setStuName(rs.getString("stuName"));
				single.setCourseId(rs.getString("courseId"));
				single.setCourseName(rs.getString("courseName"));
				single.setScore(rs.getInt("score"));
				single.setCredit(rs.getInt("credit"));
				single.setGpa(rs.getFloat("gpa"));
				stuScore.add(single);
			}
			session.setAttribute("stuScore", stuScore);
			response.sendRedirect("scoreInfo.jsp");
		} else {
			response.sendRedirect("teacher.jsp");
		}
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('查询出错！');"); 
		out.println("window.location.href='teacher.jsp';");
		out.println("</script>");
	}
%>