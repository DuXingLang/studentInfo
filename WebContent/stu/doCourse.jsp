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
			String sql = "select course_table.courseId,course_table.courseName,course_table.courseSta,sta_table.staName, "
					+"course_table.courseCredit,course_table.courseTime,course_table.courseAddr from "
					+"course_table,sta_table where course_table.courseSta=sta_table.staId and courseType=1 and courseTerm='"+courseTerm+"'";
			Connectdb cdb = new Connectdb();
			ResultSet rs = cdb.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <Course> stuCourse = new ArrayList <Course> ();
			while(rs.next()){
				Course single = new Course();
				single.setCourseId(rs.getString("courseId"));
				single.setCourseName(rs.getString("courseName"));
				single.setCourseSta(rs.getString("courseSta"));
				single.setStaName(rs.getString("staName"));
				single.setCourseCredit(rs.getInt("courseCredit"));
				single.setCourseTime(rs.getString("courseTime"));
				single.setCourseAddr(rs.getString("courseAddr"));
				stuCourse.add(single);
			}
			session.setAttribute("stuCourse", stuCourse);
			session.setAttribute("courseTerm", courseTerm);
			response.sendRedirect("selectCourse.jsp");
		} else if (type.equals("select")) { //查询选择该课程的学生Id,Name,课程Id,Name
			Connectdb cdb = new Connectdb();
			int courseTerm = (Integer)session.getAttribute("courseTerm");
			String stuId = (String)session.getAttribute("userId");
			String [] course = request.getParameterValues("courseId");
			int length = course.length;
			String sql1 = "select courseId from sc where courseId in(select courseId from "
						+"course_table where courseType=1 and courseTerm="+courseTerm+") and stuId='"+stuId+"'";
			String sql2 = "select count(courseId) selectCount from sc where courseId in(select courseId from "
						+"course_table where courseType=1 and courseTerm="+courseTerm+") and stuId='"+stuId+"'";
			ResultSet rs1=cdb.executeQuery(sql1);
			ResultSet rs2=cdb.executeQuery(sql2);
			int count=0;
			while(rs2.next()){
				count = rs2.getInt("selectCount");
			}
			if(count+length>2){
				out.println("<script>");
				out.println("alert('选课门数超出上限！');"); 
				out.println("window.location.href='selectCourse.jsp?type=get';");
				out.println("</script>");
				return;
			}
			System.out.println(count);
			if(length>0){
				for(int i=0;i<length;i++){
					while(rs1.next()){
						String courseId=course[i];
						if(rs1.getString("courseId").equals(courseId)){
							out.println("<script>");
							out.println("alert('所选课程重复！');"); 
							out.println("window.location.href='selectCourse.jsp?type=get';");
							out.println("</script>");
							return;
						}
					}
				}
				for(int i=0;i<length;i++){
					String courseId=course[i];
					String sql = "insert into sc(stuId,courseId) values('"+stuId+"','"+courseId+"')";
					cdb.executeUpdate(sql);
				}
				out.println("<script>");
				out.println("alert('选课成功！');"); 
				out.println("window.location.href='selectCourse.jsp?type=get';");
				out.println("</script>");
			}
		} else {
			response.sendRedirect("Student.jsp");
		}
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('选课出错！');"); 
		out.println("window.location.href='selectCourse.jsp?type=get';");
		out.println("</script>");
	}
%>