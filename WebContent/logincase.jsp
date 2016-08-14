<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="toolbean.MyTools" %>
<%@ page import="toolbean.Connectdb" %>
<%@ page import="java.io.PrintWriter"%>
<%
	String url = "jdbc:mysql://localhost/studentinfo";
	String user = "root";
	String password = "root";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int role = 0;
	
	boolean flag = false;
	String id = request.getParameter("username");
	String mima = request.getParameter("password");
	String sql = "select * from user_table where userId=? and password=?";
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, mima);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String randomCode = (String)session.getAttribute("randomCode");
			String imgcode = request.getParameter("imgcode");
			if(!imgcode.equalsIgnoreCase(randomCode)){
				response.setContentType("text/html; charset=UTF-8");
				out.println("<script>");
				out.println("alert('验证码错误！');"); 
				out.println("window.location.href='index.jsp';");
				out.println("</script>");
				return;
			}else{
				//用户合法 
				flag = true;
				//将用户名保存到session中 
				request.getSession().setAttribute("userId",rs.getString("userId"));
				role = MyTools.strToint(rs.getString("role"));
			}
			/* //用户合法 
			flag = true;
			//将用户名保存到session中 
			request.getSession().setAttribute("userId",rs.getString("userId"));
			role = MyTools.strToint(rs.getString("role")); */
		} else {
			//保存错误信息
			request.setAttribute("err", "错误的用户名及密码！");
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch (SQLException SE) {
		System.out.println("打开数据库失败!");
		SE.printStackTrace();
	} catch (InstantiationException e) {
		e.printStackTrace();
	} catch (IllegalAccessException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	if (flag == true) {
		switch(role){
		case 0:
			response.sendRedirect("stu/student.jsp");
			break;
		case 1:
			response.sendRedirect("sta/teacher.jsp");
			break;
		case 2:
			response.sendRedirect("stcm/stcManager.jsp");
			break;
		case 3:
			response.sendRedirect("stum/stuManager.jsp");
			break;
		default:
%>
		<script>
			alert('登录出错！');
		</script>
<%
		}
	} else {
%>
		<script type="text/javascript">
			alert("用户名或密码错误！");
			window.location.href="index.jsp";
		</script>
<%
	}
%>