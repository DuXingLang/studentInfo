<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%@ page import="valuebean.SC"%>
<%
	String sql;
	try {
		String type = request.getParameter("type");
		if (type.equals("select")) {
			String courseTerm = request.getParameter("courseTerm");
			String courseName = MyTools.toChinese(request.getParameter("courseName"));
			String stuId = request.getParameter("stuId");
			if(courseTerm != null && courseTerm != ""){
				if (courseName.length()!=0) {
					if (stuId != null && stuId != "") {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and course_table.courseName like '%"+courseName+"%' and sc.stuId like '"+stuId+"%'";
					} else {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and course_table.courseName like '%"+courseName+"%'";
					}
				} else {
					if (stuId != null && stuId != "") {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and sc.stuId like '"+stuId+"%' and course_table.courseTerm="+courseTerm+"";
					}else {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and course_table.courseTerm="+courseTerm+"";
					}
				} 
			}else{
				if (courseName.length()!=0) {
					if (stuId != null && stuId != "") {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and course_table.courseName like '%"+courseName+"%' and sc.stuId like '"+stuId+"%'";
					} else {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and course_table.courseName like '%"+courseName+"%'";
					}
				} else {
					if (stuId != null && stuId != "") {
						System.out.println("ddd");
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and sc.stuId like '"+stuId+"%'";
					}else {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId";
					}
				} 
			}
		} else {
			sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
					+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId";
		}
				
	} catch (Exception e) {
		sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName "
				+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId";
	}
	Connectdb connection = new Connectdb();
	ResultSet rs = connection.executeQuery(sql);//执行SQL语句并取得结果集
%>
<%
	ArrayList <SC> sclist = new ArrayList <SC> (); //用来存储学生信息
	while(rs.next()){
		SC single = new SC();
		single.setStuId(rs.getString("stuId"));
		single.setStuName(rs.getString("stuName"));
		single.setCourseId(rs.getString("courseId"));
		single.setCourseName(rs.getString("courseName"));
		sclist.add(single);
	}
	
	session.setAttribute("sclist", sclist);
	response.sendRedirect("scInfo.jsp");
%>