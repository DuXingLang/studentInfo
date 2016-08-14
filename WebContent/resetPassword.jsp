<%@ page language="java" contentType="text/html; charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
<title>ѧ����Ϣ����ϵͳ</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
<link rel="stylesheet" type="text/css" href="css/resetPassword.css"/>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
	<header class="header">
		<h2>ѧ����Ϣ����ϵͳ</h2>
	</header>
	<div class="main">
		<div class="title">
			<h3>�޸�����</h3>
			<a href="javascript:void(0);" onclick="getBack()">����</a>
		</div>
		<form method="post" action="/studentInfo/resetPassword" onsubmit="return repwd()">
		  <div class="form-group">
		    <label for="password">��ǰ���룺</label>
		    <input type="password" name="password" class="form-control" id="password" placeholder="��ǰ����" required="required"/>
		  </div>
		  <div class="form-group">
		    <label for="password1">��&nbsp;��&nbsp;�룺</label>
		    <input type="password" name="password1" class="form-control" id="password1" placeholder="������������" required="required"/>
		  </div>
		  <div class="form-group">
		    <label for="password2">�ٴ����룺</label>
		    <input type="password" name="password2" class="form-control" id="password2" placeholder="�������ٴ�������" required="required"/>
		  </div>
		  <div class="buttons">
			  <button type="submit" id="resetPassword" class="btn btn-default text-center">�ύ</button>
			  <button type="reset" class="btn btn-default">����</button>
		  </div>
		</form>
	</div>
	<script type="text/javascript">
		function repwd(){
			var password = document.getElementById("password").value;
			var password1 = document.getElementById("password1").value;
			var password2 = document.getElementById("password2").value;
			if(password=="" || password==null){
				alert('ԭ���벻��Ϊ�գ�');
				return false;
			}
			if(password1=="" || password==null){
				alert('�����벻��Ϊ�գ�');
				return false;
			}
			if(password2=="" || password==null){
				alert('ȷ�����벻��Ϊ�գ�');
				return false;
			}
			if(password==password1){
				alert("�������ԭ���벻����ͬ��");
				return false;
			}else if(password1!=password2){
				alert("������������벻һ�£�");
				return false;
			}else{
				return true;
			}
			
		}
		function getBack(){
			history.go(-1);
		}
	</script>
</body>
</html>