<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.SC"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	try {
		String type = request.getParameter("type");
		if(type.equals("get")){
			int courseTerm = MyTools.strToint(request.getParameter("courseTerm"));
			String stuId = (String)session.getAttribute("userId");
			String sql = "select sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa from "
					+"course_table,sc where sc.courseId=course_table.courseId and sc.stuId='"+stuId+"' and "
					+"course_table.courseTerm='"+courseTerm+"'";
			Connectdb cdb = new Connectdb();
			ResultSet rs = cdb.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <SC> courseScore = new ArrayList <SC> ();
			while(rs.next()){
				SC single = new SC();
				single.setCourseId(rs.getString("courseId"));
				single.setCourseName(rs.getString("courseName"));
				single.setScore(rs.getInt("score"));
				single.setCredit(rs.getInt("credit"));
				single.setGpa(rs.getFloat("gpa"));
				courseScore.add(single);
			}
			session.setAttribute("courseScore", courseScore);
			response.sendRedirect("courseScore.jsp");
		} else {
			response.sendRedirect("courseScore.jsp");
		}
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('查询出错！');"); 
		out.println("window.location.href='courseScore.jsp';");
		out.println("</script>");
	}
%>