package servicebean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolbean.Connectdb;

public class resetPassword extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		response.setCharacterEncoding("GB2312");
		String userId = request.getSession().getAttribute("userId").toString();
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		Connectdb cdb = new Connectdb();
		if(!password1.equals(password2)){
			PrintWriter out=response.getWriter();
			out.write("<script language='javascript'>alert('两次输入的密码不一致！');history.go(-1);</script>");;
			return;
		}
		try{
			System.out.println(userId+","+password+","+password1);
			String sql1="select * from user_table where userId='"+userId+"' and password='"+password+"'";
			ResultSet rs = cdb.executeQuery(sql1);
			if(rs.next()){
				System.out.println("bbb");
				String sql2 = "update user_table set password='"+password1+"' where userId='"+userId+"'";
				cdb.executeUpdate(sql2);
				PrintWriter out=response.getWriter();
				out.write("<script language='javascript'>alert('修改成功，请重新登录!');window.location.href='index.jsp';</script>");
				//request.getRequestDispatcher("/index.jsp").forward(request, response);
			}else{
				PrintWriter out=response.getWriter();
				out.write("<script language='javascript'>alert('原密码输入错误！');history.go(-1);</script>");
				//request.getRequestDispatcher("/resetPassword.jsp").forward(request, response);
			}
		}catch (SQLException SE) {
			PrintWriter out=response.getWriter();
			out.write("<script language='javascript'>alert('修改失败！');window.location.href='index.jsp';</script>");
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
}