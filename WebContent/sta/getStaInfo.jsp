<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.Teacher"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	try {
		String type = request.getParameter("type");
		if (type.equals("get")) {
			String staId = (String)session.getAttribute("userId");
			String sql = "select * from sta_table where staId='"+staId+"'";
			Connectdb cdb = new Connectdb();
			ResultSet rs = cdb.executeQuery(sql);//执行SQL语句并取得结果集
			ArrayList <Teacher> sta = new ArrayList <Teacher> ();
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
			
		} else if(type.equals("update")){
			String staId = request.getParameter("staId");
			String address = MyTools.toChinese(request.getParameter("address"));
			String phone = request.getParameter("phone");
			System.out.print(phone);
			Connectdb cdb = new Connectdb();
			String sql = "update sta_table set address='"+address+"',phone='"+phone+"' where staId='"+staId+"'";
			cdb.executeUpdate(sql);
			out.println("<script>");
			out.println("alert('修改成功！');"); 
			out.println("window.location.href='getStaInfo.jsp?type=get';");
			out.println("</script>");
		} else {
			response.sendRedirect("teacher.jsp");
		}
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('执行出错！');"); 
		out.println("window.location.href='teacher.jsp';");
		out.println("</script>");
	}
%>