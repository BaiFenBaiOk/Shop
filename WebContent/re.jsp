<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/user/regist.action" method="post">
用户名：<input type="text" name="username" /><br>
密码：<input type="text" name="password" /><br>
年龄：<input type="text" name="age" /><br>
性别：<input type="radio" value="男" name="sex"  checked="checked"/>男
<input type="radio" value="女" name="sex"/> 女
<br>
手机号：<input type="text" name="iphone" /><br>
邮箱：<input type="text" name="email" /><br>

<input type="submit" value="注册">
</form>
</body>
</html>
