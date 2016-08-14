<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.Student"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	String sql;
	try {
		String type = request.getParameter("type");
		if (type.equals("select")) {
			String stuId = request.getParameter("stuId");
			String stuName = MyTools.toChinese(request.getParameter("stuName"));
			System.out.println(stuName);
			if (stuId != null && stuId != "") {
				if (stuName.length()!=0) {
					sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
							+ "from stu_table where stuId like '"+stuId+"%' and stuName like '%"+stuName+"%'";
				} else {
					sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
							+ "from stu_table where stuId like '"+stuId+"%'";
				}
			} else {
				if (stuName.length()!=0) {
					System.out.println("sss");
					sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
							+ "from stu_table where stuName like '%"+stuName+"%'";
				}else {
					sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
							+ "from stu_table";
				}
			} 
		} else {
			sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
					+ "from stu_table";
		}
	} catch (Exception e) {
		sql = "select stuId,stuName,stuSex,department,major,classId,address,birthday,phone "
				+ "from stu_table";
	}
	Connectdb connection = new Connectdb();
	ResultSet rs = connection.executeQuery(sql);//执行SQL语句并取得结果集
%>
<%
	ArrayList <Student> studentslist = new ArrayList <Student> (); //用来存储学生信息
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
		studentslist.add(single);
	}
	
	session.setAttribute("studentslist", studentslist);
	response.sendRedirect("stuInfo.jsp");
%>