<%@ page language="java" contentType="text/html; charset=GB2312"%>
<!DOCTYPE html>
<html>
<head>
<title>学生信息管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
<link rel="stylesheet" type="text/css" href="css/resetPassword.css"/>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
	<header class="header">
		<h2>学生信息管理系统</h2>
	</header>
	<div class="main">
		<div class="title">
			<h3>修改密码</h3>
			<a href="javascript:void(0);" onclick="getBack()">返回</a>
		</div>
		<form method="post" action="/studentInfo/resetPassword" onsubmit="return repwd()">
		  <div class="form-group">
		    <label for="password">当前密码：</label>
		    <input type="password" name="password" class="form-control" id="password" placeholder="当前密码" required="required"/>
		  </div>
		  <div class="form-group">
		    <label for="password1">新&nbsp;密&nbsp;码：</label>
		    <input type="password" name="password1" class="form-control" id="password1" placeholder="请输入新密码" required="required"/>
		  </div>
		  <div class="form-group">
		    <label for="password2">再次输入：</label>
		    <input type="password" name="password2" class="form-control" id="password2" placeholder="请输入再次新密码" required="required"/>
		  </div>
		  <div class="buttons">
			  <button type="submit" id="resetPassword" class="btn btn-default text-center">提交</button>
			  <button type="reset" class="btn btn-default">重置</button>
		  </div>
		</form>
	</div>
	<script type="text/javascript">
		function repwd(){
			var password = document.getElementById("password").value;
			var password1 = document.getElementById("password1").value;
			var password2 = document.getElementById("password2").value;
			if(password=="" || password==null){
				alert('原密码不能为空！');
				return false;
			}
			if(password1=="" || password==null){
				alert('新密码不能为空！');
				return false;
			}
			if(password2=="" || password==null){
				alert('确认密码不能为空！');
				return false;
			}
			if(password==password1){
				alert("新密码和原密码不能相同！");
				return false;
			}else if(password1!=password2){
				alert("两次输入的密码不一致！");
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