<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.Student"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	try {
		String type = request.getParameter("type");
		if (type.equals("get")) {
			String stuId = (String)session.getAttribute("userId");
			String sql = "select * from stu_table where stuId='"+stuId+"'";
			Connectdb cdb = new Connectdb();
			ResultSet rs = cdb.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <Student> stu = new ArrayList <Student> ();
			while(rs.next()){
				Student single = new Student();
				single.setStuId(rs.getString("stuId"));
				single.setStuName(rs.getString("stuName"));
				single.setStuSex(rs.getString("stuSex"));
				single.setDepartment(rs.getString("department"));
				single.setMajor(rs.getString("major"));
				single.setClassId(rs.getString("classId"));
				single.setBirthday(rs.getString("birthday"));
				single.setAddress(rs.getString("address"));
				single.setPhone(rs.getString("phone"));
				stu.add(single);
			}
			session.setAttribute("stu", stu);
			response.sendRedirect("stuInfo.jsp");
			
		} else if(type.equals("update")){
			String stuId = request.getParameter("stuId");
			String address = MyTools.toChinese(request.getParameter("address"));
			String phone = request.getParameter("phone");
			System.out.print(phone);
			Connectdb cdb = new Connectdb();
			String sql = "update stu_table set address='"+address+"',phone='"+phone+"' where stuId='"+stuId+"'";
			cdb.executeUpdate(sql);
			out.println("<script>");
			out.println("alert('修改成功！');"); 
			out.println("window.location.href='getStuInfo.jsp?type=get';");
			out.println("</script>");
		} else {
			response.sendRedirect("teacher.jsp");
		}
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('执行出错！');"); 
		out.println("window.location.href='student.jsp';");
		out.println("</script>");
	}
%>