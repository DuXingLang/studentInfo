<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.SC"%>
<%@ page import="java.sql.*"%>
<%@ page import="toolbean.Connectdb"%>
<%@ page import="toolbean.MyTools" %>
<%
	try {
		String [] score = request.getParameterValues("score");
		ArrayList scInfo = (ArrayList) session.getAttribute("scInfo");
		for(int i=0;i<scInfo.size();i++){
			for(int j=0;j<score.length;j++){
				SC single = (SC) scInfo.get(i);
				String stuId = single.getStuId();
				String courseId = single.getCourseId();
				int stuScore = MyTools.strToint(score[j]);
				Connectdb cdb = new Connectdb();
				String sql1 = "select courseCredit from course_table where courseId='"+courseId+"'";
				ResultSet rs1 = cdb.executeQuery(sql1);//执行SQL语句并取得结果集
				if(rs1.next()){
					int credit = rs1.getInt("courseCredit");
					float gpa = (float) stuScore/100*5;
					String sql = "update sc set score="+stuScore+",credit="+credit+", gpa="+gpa+" where stuId='"
								+stuId+"' and courseId='"+courseId+"'";
					cdb.executeUpdate(sql);
				}else{
					out.println("<script>");
					out.println("alert('录入成绩出错！');"); 
					out.println("window.location.href='getSCInfo.jsp?type=select';");
					out.println("</script>");
					return;
				}
			}
		}
		session.setAttribute("scInfo", scInfo);
		out.println("<script>");
		out.println("alert('成绩录入成功！');"); 
		out.println("window.location.href='getSCInfo.jsp?type=select';");
		out.println("</script>");
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('成绩录入出错！');"); 
		out.println("window.location.href='teacher.jsp';");
		out.println("</script>");
	}
%>