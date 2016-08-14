<%@ page language="java" contentType="text/html; charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
    <header class="heading">
        <h2 class="title">ѧ����Ϣ����ϵͳ</h2>
        <span class="welcome"><%=session.getAttribute("userId") %>����ӭ����&nbsp;&nbsp;<a href="../index.jsp">�˳�</a>&nbsp;</span>
    </header>
    <div class="contain">
    	<div class="left">
    	<span>ѧ����Ϣ����</span>
        <ul>
            <li><a href="getStuInfo.jsp?type=all">��ѯѧ����Ϣ</a></li>
            <li class="liselected"><a href="insertStuInfo.jsp">����ѧ����Ϣ</a></li>
        </ul>
    </div>
    <div class="main">
        <div class="updateForm">
        	<form class="form-horizontal" action="doStuInfo.jsp?type=insert" method="post">
    			<div class="form-group">
			        <label for="stuId" class="col-sm-2 control-label">ѧ��</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="stuId" name="stuId" placeholder="ѧ��">
			        </div>
    			</div>
			    <div class="form-group">
			        <label for="stuName" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="stuName" name="stuName" placeholder="����">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="stuSex" class="col-sm-2 control-label">�Ա�</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="stuSex" name="stuSex">
						    <option value="��">��</option>
						    <option value="Ů">Ů</option>
						</select>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="department" class="col-sm-2 control-label">Ժϵ</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="department" name="department" placeholder="Ժϵ">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="major" class="col-sm-2 control-label">רҵ</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="major" name="major" placeholder="רҵ">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="classId" class="col-sm-2 control-label">�༶</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="classId" name="classId" placeholder="101303">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="address" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="address" name="address" placeholder="�����Ͼ�">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="birthday" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="birthday" name="birthday" placeholder="1995-03-01">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="phone" class="col-sm-2 control-label">�ֻ�</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="phone" name="phone" placeholder="�ֻ�����">
			        </div>
			    </div>
			    <div class="form-group">
			        <div class="col-sm-offset-2 col-sm-10">
			            <button type="submit" class="btn btn-default">�ύ</button>
			            <button type="reset" class="btn btn-default">����</button>
			        </div>
			    </div>
			</form>
        </div>
    </div>
    <div class="none"></div>
    </div>
</body>
</html>