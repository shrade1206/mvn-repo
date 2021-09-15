<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/login2.css" />

<style>
body {
background:linear-gradient(rgba(0, 0, 0, 0.4), 
	rgba(0, 0, 0, 0.4)),url('${pageContext.servletContext.contextPath}/picture/loginpic.jpg');
background-size:cover;
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #04AA6D;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}

#navbar a:hover {background-color: #ddd;}
.dropdown:hover #navbar {display: block;}
#navbar {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 90px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  height: 200px;
  top: 1px;
  left:110px;
  text-align:center;
}

#navbar a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

#logo{
	width:200px;
	position:absolute;
	bottom:0;
}

</style>
</head>
<body>
<div class="sidebar">
  <h1><a href="#home" class="active">後台管理</a></h1>
  
  <img id="logo" alt="" src="${pageContext.servletContext.contextPath}/picture/11.png">
</div>


    <div class="signinbox">
		<div class="loginpage">
			<img src="${pageContext.servletContext.contextPath }/img/logo2.png"
				width="250px">
			<ul id="tab">
				<li id="tab1">後台登入</li>
			</ul>
			
			<div id="content1">
				<form class="form-signin" method="post" action="login">
				<div>
					<input id="emailIn" type="text" placeholder="請輸入帳號" name="username">
				</div>
				<br>
				<div>
					
					<input id="passwordIn" type="password" placeholder="請輸入密碼" name="password">
				</div>
				<br>
				<div>
			
					<button type="submit" id="btnSignIn">登入</button>
				</div>
				</form>
				<div>
					<span>${error}</span>
				</div>
			</div>
		</div>
	</div>    

	<script type="text/javascript">
		
	</script>


</body>
</html>