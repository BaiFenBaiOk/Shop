<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link rel="stylesheet" href="css/login.css" >
<script src="js/jQuery3.4.1.js"></script>
</head>
<body>


<form  class="login-form" action="${pageContext.request.contextPath }/user/login.action" method="post">
			<h1>登录</h1>
			
			<div class="txtb">
				<input type="text" name="username">
				Username:<span data-placeholder = "Username" ></span>
			</div>
			<div class="txtb">
				<input type="password" name="password">
				Password:<span data-placeholder="Password" ></span>
			</div>
			<input type="submit" class="logbtn" value="Login">
			
			<div class="bottom-text">
				Don't have a account? <a href="regist.html">Sign up</a>
			</div>
		</form>

</body>
</html>
