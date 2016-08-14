<%@ page language="java" contentType="text/html; charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stuManager.css"/>
    <link rel="stylesheet" type="text/css" href="../css/stcManager.css"/>
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
    	<span>������Ϣ����</span>
        <ul>
            <li><span>�γ�����</span></li>
           	<li><a href="getCourse.jsp?type=all">��ѯ�γ���Ϣ</a></li>
           	<li class="liselected"><a href="addCourse.jsp">��ӿγ���Ϣ</a></li>
            <li><span>ѧ��ѡ��</span></li>
            <li><a href="getSC.jsp?type=all">��ѯѡ����Ϣ</a></li>
	        <li><a href="addSC.jsp">���ѡ����Ϣ</a></li>
	        <li><a href="getSCResult.jsp?type=all">ѡ�ν��ͳ��</a></li>
            <li><span>ѧ���ɼ�</span></li>
            <li><a href="getInfo.jsp?type=score">��ѯѧ���ɼ�</a></li>
            <li><span><a href="getInfo.jsp?type=sta">��ʦ��Ϣ</a></span></li>
            <li><span><a href="getInfo.jsp?type=stu">ѧ����Ϣ</a></span></li>
        </ul>
    </div>
    <div class="main">
        <div class="updateForm">
        	<form class="form-horizontal" action="doCourse.jsp?type=insert" method="post">
    			<div class="form-group">
			        <label for="courseId" class="col-sm-2 control-label">�γ̱��</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseId" name="courseId" placeholder="�γ̱��">
			        </div>
    			</div>
			    <div class="form-group">
			        <label for="courseName" class="col-sm-2 control-label">�γ�����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseName" name="courseName" placeholder="�γ�����">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseSta" class="col-sm-2 control-label">��ʦ����</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseSta" name="courseSta" placeholder="�ڿν�ʦ">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseTime" class="col-sm-2 control-label">�Ͽ�ʱ��</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseTime" name="courseTime" placeholder="��һ��1-3��">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseAddr" class="col-sm-2 control-label">�Ͽεص�</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseAddr" name="courseAddr" placeholder="J3-221">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseCredit" class="col-sm-2 control-label">�γ�ѧ��</label>
			        <div class="col-sm-10">
			            <input type="text" class="form-control" id="courseCredit" name="courseCredit" placeholder="3">
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseType" class="col-sm-2 control-label">����</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="courseType" name="courseType">
						    <option value="0">���޿�</option>
						    <option value="1">ѡ�޿�</option>
						</select>
			        </div>
			    </div>
			    <div class="form-group">
			        <label for="courseTerm" class="col-sm-2 control-label">ѧ��</label>
			        <div class="col-sm-10">
			            <select class="form-control" id="courseTerm" name="courseTerm">
						    <option value="1" selected>1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						    <option value="5">5</option>
						    <option value="6">6</option>
						    <option value="7">7</option>
						    <option value="8">8</option>
						</select>
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