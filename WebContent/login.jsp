<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form
		action="${pageContext.request.contextPath}/UserServlet?method=userLogin"
		method="post">
		用户名<input type="text" name="username" /><br />
		密码<input type="text" name="password" /><br />
		<input type="submit" value="登录" /><br />
	</form>
</body>
</html>