<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>学生信息管理系统</title>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/html5shiv.min.js"></script>
</head>
<body>
<%
	String username = request.getParameter("id");
	String password = request.getParameter("mima");
%>
	<header class="header">
		<h2>学生信息管理系统</h2>
	</header>
	<div class="login-main">
		<h2 class="title">用户登录</h2>
		<form name="login" method="post" action="logincase.jsp">
			<table>
				<tr class="inputer">
					<td>用户名：</td>
					<td><input type="text" name="username" class="username" required="required" /></td>
				</tr>
				<tr class="inputer">
					<td>密&nbsp;&nbsp;&nbsp;码：</td>
					<td><input type="password" name="password" class="password" required="required" /></td>
				</tr>
				
				<tr class="inputer">
					<td>验证码：</td>
					<td>
						<div class="imgdiv">
							<input type="text" name="imgcode" class="imgcode" required="required" />
							<img id="imgcode" alt="看不清，换一张" src="/studentInfo/imgcode" onclick="changeCode()"/>
						</div> 
					</td>
				</tr>
				 
			</table>
			<p id="sure">
				<input type="submit" id="login" value="登录"/>&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="reset" value="重置"/>
			</p>
		</form>
	</div>
	<footer class="footer">
		<div class="footerdiv">&copy;&nbsp;&nbsp;南京师范大学&nbsp;&nbsp;邓林森</div>
	</footer>
	<script type="text/javascript">
		$(function(){
			$('input:text:first').focus();//把焦点放在第一个文本框
			var $inp = $("input");
			$inp.keypress(function(e){
				var key=e.which;
				if(key==13){
					$("[id$=login]").click();//支持firefox,IE无效
					$("[id$=login]").focus();//支持IE，firefox无效
				}
			});
		});
		function changeCode(){  
			  document.getElementById("imgcode").src="/studentInfo/imgcode?t="+new Date().getTime();  
		}
	</script>
</body>
</html>