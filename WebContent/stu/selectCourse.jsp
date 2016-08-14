<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="valuebean.Course"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stumStuInfo.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
<%
	ArrayList stuCourse = (ArrayList) session.getAttribute("stuCourse");
%>
    <header class="heading">
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>ѧ����Ϣ����</span>
        <ul>
            <li><a href="getStuInfo.jsp?type=get">������Ϣ</a></li>
            <li class="liselected"><a href="selectCourse.jsp">����ѡ��</a></li>
            <li><a href="selectResult.jsp">ѡ�ν��</a></li>
            <li><a href="courseTable.jsp">�ҵĿα�</a></li>
            <li><a href="courseScore.jsp">�ɼ���ѯ</a></li>
            <li><a href="../resetPassword.jsp">�޸�����</a></li>
        </ul>
    </div>
    <div class="main">
    	<div class="row select">
        	<form action="doCourse.jsp?type=get" method="post">
	        	<div class="spandiv" >
            		<span>��ѡ��ѧ�ڣ�</span>
            	</div>
                <div class="input-group selectdiv">
                	<span class="input-group-addon">ѧ��</span>
                	<select class="form-control" name="courseTerm">
   	                    <option>��ѡ��...</option>
   	                    <option value="1">1</option>
   	                    <option value="2">2</option>
   	                    <option value="3">3</option>
   	                    <option value="4">4</option>
   	                    <option value="5">5</option>
   	                    <option value="6">6</option>
   	                    <option value="7">7</option>
   	                    <option value="8">8</option>
                    </select>
                </div><!-- /input-group -->
	            <div class="btndiv newbtndiv">
            		<button class="btn btn-default" type="submit">ȷ��</button>
            	</div>
            </form>
        </div><!-- /.row -->
        <div class="updateForm selectCourseForm">
        	<form class="form-horizontal" action="doCourse.jsp?type=select" method="post">
    			<table class="table table-hover">
	        		<tr>
	        			<td>�γ̱���</td>
	        			<td>�γ�����</td>
	        			<td>�ڿ���ʦ</td>
	        			<td>�γ�ѧ��</td>
	        			<td>�Ͽ�ʱ��</td>
	        			<td>�Ͽεص�</td>
	        			<td>ѡ��</td>
	        		</tr>
<%
		if(stuCourse == null || stuCourse.size() == 0){
%>
					<tr height="100">
						<td colspan="7" align="center">û�пγ���Ϣ��</td>
					</tr>
<%
		}else{
			int size = stuCourse.size();
			for(int i = 0; i < size; i++){
				Course single = (Course) stuCourse.get(i);
%>
					<tr>
						<td><%=single.getCourseId() %></td>
						<td><%=single.getCourseName() %></td>
						<td><%=single.getCourseSta() %>[<%=single.getStaName() %>]</td>
						<td><%=single.getCourseCredit() %></td>
						<td><%=single.getCourseTime() %></td>
						<td><%=single.getCourseAddr() %></td>
						<td><input type="checkbox" name="courseId" value="<%=single.getCourseId() %>" onclick="doCheck(this)"/></td>
					</tr>
<%
			}
%>
					<tr>
						<td colspan="7" align="right">
							<div class="col-sm-offset-2 col-sm-10">
					            <button type="submit" class="btn btn-default">�ύ</button>
					            <button type="reset" class="btn btn-default">����</button>
	        				</div>
						</td>
					</tr>
<%
		}
%>
				</table>
	      </form>
        </div>
    </div>
    <div class="none"></div>
    </div>
    <script type="text/javascript">
    var c=0,limit=2; 
    function doCheck(obj) { 
    obj.checked?c++:c--; 
	    if(c>limit){ 
		    obj.checked=false; 
		    alert("over"); 
		    c--; 
	    } 
    }
    </script>

</body>
</html>