<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="valuebean.SC"%>
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
		String courseId = request.getParameter("courseId");
		String sql = "delete from sc where stuId='"+stuId+"' and courseId='" + courseId + "'";
		cdb.executeUpdate(sql);
		response.sendRedirect("getSC.jsp");
	}else if(type.equals("insert")){
		String stuId = request.getParameter("stuId");
		String courseId = request.getParameter("courseId");
		String sql = "select * from sc where stuId='"+stuId+"' and courseId='"+courseId+"'";
		ResultSet rs = cdb.executeQuery(sql);
		if (rs.next()) {
%>
		<script type="text/javascript">
			alert("您输入的选课已存在！");
			window.location.href="addSC.jsp";
		</script>
<%
			return;
		}
		String sql1 = "insert into sc(stuId,courseId) values('" + stuId + "','" + courseId + "')";
		cdb.executeUpdate(sql1);
%>
		<script type="text/javascript">
			alert("添加成功！");
			window.location.href="addSC.jsp";
		</script>
<%
	}else if(type.equals("insertAll")){
		String sql1 = "select stuId from stu_table";
		String sql2 = "select courseId from course_table where courseType=0";
		ResultSet rs1 = cdb.executeQuery(sql1);
		ResultSet rs2 = cdb.executeQuery(sql2);
		ArrayList<SC> sclist1 = new ArrayList<SC>();
		ArrayList<SC> sclist2 = new ArrayList<SC>();
		while(rs1.next()){
			SC stuId = new SC();
			stuId.setStuId(rs1.getString("stuId"));
			sclist1.add(stuId);
		}
		while(rs2.next()){
			SC courseId = new SC();
			courseId.setCourseId(rs2.getString("courseId"));
			sclist2.add(courseId);
		}
		for(int i=0;i<sclist1.size();i++){
			for(int j=0;j<sclist2.size();j++){
				SC stu = (SC) sclist1.get(i);
				SC course = (SC) sclist2.get(j);
				String sql = "insert into sc(stuId,courseId) values('"+stu.getStuId()+"','"+course.getCourseId()+"')";
				cdb.executeUpdate(sql);
			}
		}
		response.sendRedirect("getSC.jsp");
	}else{
		response.sendRedirect("getSC.jsp");
	}
%>