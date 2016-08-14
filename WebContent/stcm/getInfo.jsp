<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%@ page import="valuebean.SC"%>
<%@ page import="valuebean.Teacher"%>
<%@ page import="valuebean.Student"%>
<%
	String sql;
	try {
		String type = request.getParameter("type");
		if (type.equals("score")) {
			String courseTerm = request.getParameter("courseTerm");
			String courseId = request.getParameter("courseId");
			String stuId = request.getParameter("stuId");
			if(courseTerm != null && courseTerm != ""){
				if (courseId != null && courseId != "") {
					if (stuId != null && stuId != "") {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and sc.courseId like '"+courseId+"%' and sc.stuId like '"+stuId+"%'";
					} else {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and sc.courseId like '"+courseId+"%'";
					}
				} else {
					if (stuId != null && stuId != "") {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and sc.stuId like '"+stuId+"%' and course_table.courseTerm="+courseTerm+"";
					}else {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and course_table.courseTerm="+courseTerm+"";
					}
				}
			}else{
				if (courseId != null && courseId != "") {
					if (stuId != null && stuId != "") {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and sc.courseId like '"+courseId+"%' and sc.stuId like '"+stuId+"%'";
					} else {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and sc.courseId like '"+courseId+"%'";
					}
				} else {
					if (stuId != null && stuId != "") {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId "
								+"and sc.stuId like '"+stuId+"%'";
					}else {
						sql = "select sc.stuId,stu_table.stuName,sc.courseId,course_table.courseName,sc.score,sc.credit,sc.gpa "
								+ "from sc,course_table,stu_table where sc.stuId=stu_table.stuId and sc.courseId=course_table.courseId";
					}
				}
			}
			Connectdb connection = new Connectdb();
			ResultSet rs = connection.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <SC> score = new ArrayList <SC> (); //用来存储学生信息
			while(rs.next()){
				SC single = new SC();
				single.setStuId(rs.getString("stuId"));
				single.setStuName(rs.getString("stuName"));
				single.setCourseId(rs.getString("courseId"));
				single.setCourseName(rs.getString("courseName"));
				single.setScore(rs.getInt("score"));
				single.setCredit(rs.getInt("credit"));
				single.setGpa(rs.getFloat("gpa"));
				score.add(single);
			}
			session.setAttribute("score", score);
			response.sendRedirect("stuScore.jsp");
		}else if(type.equals("sta")){
			String staId = request.getParameter("staId");
			String staName = MyTools.toChinese(request.getParameter("staName"));
			if (staId != null && staId != "") {
				if (staName != null && staName != "") {
					sql = "select staId,staName,staSex,department,birthday,address,phone "
							+ "from sta_table where staId like '"+staId+"%' and staName like '%"+staName+"%'";
				} else {
					sql = "select staId,staName,staSex,department,birthday,address,phone "
							+ "from sta_table where staId like '"+staId+"%'";
				}
			} else {
				if (staName != null && staName != "") {
					sql = "select staId,staName,staSex,department,birthday,address,phone "
							+ "from sta_table where staName like '%"+staName+"%'";
				}else {
					sql = "select staId,staName,staSex,department,birthday,address,phone "
							+ "from sta_table";
				}
			}
			Connectdb connection = new Connectdb();
			ResultSet rs = connection.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <Teacher> sta = new ArrayList <Teacher> (); //用来存储学生信息
			while(rs.next()){
				Teacher single = new Teacher();
				single.setStaId(rs.getString("staId"));
				single.setStaName(rs.getString("staName"));
				single.setStaSex(rs.getString("staSex"));
				single.setDepartment(rs.getString("department"));
				single.setBirthday(rs.getString("birthday"));
				single.setAddress(rs.getString("address"));
				single.setPhone(rs.getString("phone"));
				sta.add(single);
			}
			session.setAttribute("sta", sta);
			response.sendRedirect("staInfo.jsp");
		}else if(type.equals("stu")){
			String stuId = request.getParameter("stuId");
			String stuName = MyTools.toChinese(request.getParameter("stuName"));
			if (stuId != null && stuId != "") {
				if (stuName != null && stuName != "") {
					sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
							+ "from stu_table where stuId like '"+stuId+"%' and stuName like '%"+stuName+"%'";
				} else {
					sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
							+ "from stu_table where stuId like '"+stuId+"%'";
				}
			} else {
				if (stuName != null && stuName != "") {
					sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
							+ "from stu_table where stuName like '%"+stuName+"%'";
				}else {
					sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
							+ "from stu_table";
				}
			}
			Connectdb connection = new Connectdb();
			ResultSet rs = connection.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <Student> stu = new ArrayList <Student> (); //用来存储学生信息
			while(rs.next()){
				Student single = new Student();
				single.setStuId(rs.getString("stuId"));
				single.setStuName(rs.getString("stuName"));
				single.setStuSex(rs.getString("stuSex"));
				single.setDepartment(rs.getString("department"));
				single.setMajor(rs.getString("major"));
				single.setClassId(rs.getString("classId"));
				single.setAddress(rs.getString("address"));
				single.setBirthday(rs.getString("birthday"));
				single.setPhone(rs.getString("phone"));
				stu.add(single);
			}
			session.setAttribute("stu", stu);
			response.sendRedirect("stuInfo.jsp");
		}else{
%>
			<script type="text/javascript">
				alert("查询出错！");
				window.location.href="stcManager.jsp";
			</script>
<%
		}
		
	} catch (Exception e) {
%>
		<script type="text/javascript">
			alert("查询出错！");
			window.location.href="stcManager.jsp";
		</script>
<%
	}
%>