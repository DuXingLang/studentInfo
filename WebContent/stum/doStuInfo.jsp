<%@ page language="java" contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.Student"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	Connectdb cdb = new Connectdb();
	String type = request.getParameter("type");
	if (type == null)
		type = "";
	if(type.equals("delete")){
		String stuId = request.getParameter("stuId");
		String sql1 = "delete from stu_table where stuId='" + stuId + "'";
		String sql2 = "delete from user_table where userId='" + stuId + "'";
		String sql3 = "select * from sc where stuId='" + stuId + "'";
		String sql4 = "delete from sc where stuId='" + stuId + "'";
		cdb.executeUpdate(sql1);
		cdb.executeUpdate(sql2);
		ResultSet rs = cdb.executeQuery(sql3);
		if(rs.next()){
			cdb.executeUpdate(sql4);
		}
		response.sendRedirect("getStuInfo.jsp");
	}else if(type.equals("update")){
		String stuId = request.getParameter("stuId");
		String stuName = MyTools.toChinese(request.getParameter("stuName"));
		String stuSex = MyTools.toChinese(request.getParameter("stuSex"));
		String department = MyTools.toChinese(request.getParameter("department"));
		String major = MyTools.toChinese(request.getParameter("major"));
		String classId = request.getParameter("classId");
		String address = MyTools.toChinese(request.getParameter("address"));
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String sql = "update stu_table set stuId='" + stuId + "',stuName='" + stuName 
				+ "',stuSex='" + stuSex + "',department='" + department 
				+ "',major='" + major +"',classId='" + classId + "',address='" + address
				+ "',birthday='"+birthday+"',phone='"+phone+"' where stuId='" + stuId + "'";
		cdb.executeUpdate(sql);
		response.sendRedirect("getStuInfo.jsp");
	}else if(type.equals("insert")){
		String stuId = request.getParameter("stuId");
		String stuName = MyTools.toChinese(request.getParameter("stuName"));
		String stuSex = MyTools.toChinese(request.getParameter("stuSex"));
		String department = MyTools.toChinese(request.getParameter("department"));
		String major = MyTools.toChinese(request.getParameter("major"));
		String classId = request.getParameter("classId");
		String address = MyTools.toChinese(request.getParameter("address"));
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String sql = "select * from stu_table where stuId='"+stuId+"'";
		ResultSet rs = cdb.executeQuery(sql);
		if (rs.next()) {
%>
		<script type="text/javascript">
			alert("您输入的学号已存在！");
			window.location.href="insertStuInfo.jsp";
		</script>
<%
			return;
		}
		String sql1 = "insert into stu_table values('" + stuId + "','" + stuName + "','" + stuSex + "','" 
				+ department + "','" + major + "','" + classId + "','" + address + "','" + birthday + "','" + phone + "')";
		String sql2 = "insert into user_table values('" + stuId + "','" + stuId + "',0)";
		cdb.executeUpdate(sql1);
		cdb.executeUpdate(sql2);
%>
		<script type="text/javascript">
			alert("添加成功！");
			window.location.href="insertStuInfo.jsp";
		</script>
<%
	}else{
		response.sendRedirect("getStuInfo.jsp");
	}
%>