<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

<!-- title of site -->
<title>登录</title>
<meta charset="utf-8">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="assets/images/favicon.ico">
		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css">
		
		<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

			
		<link rel="stylesheet" href="assets/css/style.css">


<!--font-awesome.min.css-->
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet" href="assets/css/uikit.min.css" />
	        <script src="assets/js/uikit.min.js"></script>
	        <script src="assets/js/uikit-icons.min.js"></script>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body>
<div class="background" class="cart text-center "> 
  
  <form  class="login-form" action="${pageContext.request.contextPath }/user/login.action" method="post">    
   <div style="z-index: 1000,,width=80%">
   		<h1 class="uk-heading-xlarge" style="text-align: center;">数据后台管理</h1>
		<div class="uk-text-center" >
        <div class="uk-card uk-card-hover" class="uk-width-1-2" >
            <div class="uk-card-body">
                <h3 class="uk-card-title">欢迎加入</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
            </div>
			<dl class="uk-description-list uk-description-list-divider">
			   <ul uk-accordion>
				<li style="font-size: 14px" class="txtb">
					账号：<input type="text" name="username"></input></li>
				<li  style="font-size: 14px" class="txtb" >
					密码：<input type="password" name="password"></input></li>
				<li></li>
				</ul>

				<button class="uk-button uk-button-primary uk-width-1-2 uk-margin-small-bottom"  >登录</button>
			</dl>

			<span></span>
			<span></span>
			<span></span>
			<span></span>
            <span></span>
			<span></span>
        </div>      
        <div class="uk-animation-toggle" tabindex="0">
        <div  style="height: 40px ,width=20px,">
            <div class="bottom-text">
				Don't have a account? <a href="${pageContext.request.contextPath }/re.jsp">Sign up</a>
			</div>
        </div>
        </div>
    </div>
     		</form>   
    </div>
		
   </div>
  
</div>
</body>
</html>