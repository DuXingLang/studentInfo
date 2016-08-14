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
			ResultSet rs = cdb.executeQuery(sql);//ִ��SQL��䲢ȡ�ý����
			ArrayList <SC> staCourse1 = new ArrayList <SC> ();
			while(rs.next()){
				SC single = new SC();
				single.setCourseId(rs.getString("courseId"));
				single.setCourseName(rs.getString("courseName"));
				staCourse1.add(single);
			}
			session.setAttribute("staCourse1", staCourse1);
			response.sendRedirect("scInfo.jsp");
		} else if (type.equals("get")) { //��ѯѡ��ÿγ̵�ѧ��Id,Name,�γ�Id,Name
			String staId = (String)session.getAttribute("userId");
			String courseId = request.getParameter("courseId");
			String sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName from "
					+"sc,stu_table,course_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
					+"and sc.courseId='"+courseId+"'";
			Connectdb cdb = new Connectdb();
			ResultSet rs = cdb.executeQuery(sql);//ִ��SQL��䲢ȡ�ý����
			ArrayList <SC> scInfo = new ArrayList <SC> ();
			while(rs.next()){
				SC single = new SC();
				single.setStuId(rs.getString("stuId"));
				single.setStuName(rs.getString("stuName"));
				single.setCourseId(rs.getString("courseId"));
				single.setCourseName(rs.getString("courseName"));
				scInfo.add(single);
			}
			session.setAttribute("scInfo", scInfo);
			response.sendRedirect("scInfo.jsp");
			
		} else {
			response.sendRedirect("teacher.jsp");
		}
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('��ȡѧ��ѡ����Ϣ����');"); 
		out.println("window.location.href='teacher.jsp';");
		out.println("</script>");
	}
%>