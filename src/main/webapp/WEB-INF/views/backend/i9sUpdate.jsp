<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>鍋奉行後台</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body {
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
  padding: 0px 0px;
  height: auto;
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

/* ↓ 餐點管理 選單 */
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

/* ↑ 餐點管理 選單 */

/* ↓ 新增 移除背景、字體 */
table{
	background: linear-gradient(rgba(255, 255, 255, 0.4), 
	rgba(255, 255, 255, 0.4)), url('${pageContext.servletContext.contextPath}/picture/BackEnd.gif') 
	no-repeat 0% 0%/ cover;
	height: 98vh;
}
/* ↑ 新增 移除背景、字體 */

#logo{
	width:200px;
	position:absolute;
	bottom:0;
}

thead tr th{
 height:80px;
}
</style>
</head>
<body>
<div class="sidebar">
  <h1><a href="#home" class="active">後台管理</a></h1>
  <div class="dropdown">
    <a href="${pageContext.servletContext.contextPath}/pages/i9s/1" class="dropdown">餐點管理</a>
    <div id="navbar" class="dropdown-menu">
      <a href="${pageContext.servletContext.contextPath}/pages/type1">食材</a>
      <a href="${pageContext.servletContext.contextPath}/backend/selectAllMeal.controller">套餐</a>
      <a href="${pageContext.servletContext.contextPath}/pages/type3">湯底</a>  
      <a href="${pageContext.servletContext.contextPath}/pages/type4">甜點</a> 
    </div>
  </div>
  <a href="${pageContext.servletContext.contextPath }/cms/orders/page/1">訂單管理</a>
  <a href="${pageContext.servletContext.contextPath }/cms/table.controller/page/1">訂位管理</a>
  <a href="${pageContext.servletContext.contextPath }/backend/sales">業績管理</a>
  <a href="${pageContext.servletContext.contextPath }/logout">登出</a>
  <img id="logo" alt="" src="${pageContext.servletContext.contextPath}/picture/11.png">
</div>

<form action="" id="i9sform">
<div class="content">
	<table class="table">
    <thead class="thead-dark">
      <tr>
        <th style="vertical-align:middle;border:0;">
			<h3>修改品項</h3>
		</th>
      </tr>
    </thead>
    <tbody>
    	  <tr>
    	  	<td>
    	  	<h4>品項名稱</h4><input type="text" name="i9sName" value="${selectThis.i9sName}"> <br><br>
	        <h4>內容</h4><input type="text" name="unit" value="${selectThis.unit}"> <br><br>
	        <h4>熱量</h4><input type="text" name="kcal" value="${selectThis.kcal}"> <br><br> 
			<h4>金額</h4><input type="text" name="i9sPrice" value="${selectThis.i9sPrice}"> <br><br>
			<h4>類別</h4>
	        <select id="type" style="width:200px; font-size: 20px;">
	        	<option selected value="1">食材</option>
	        	<option value="3">湯底</option>
	        	<option value="4">甜點</option>
	        </select> <br><br>
	              <button type="button" id="i9sUpdate" class="btn btn-success" value="${selectThis.i9sType}" style="width:160px;height:64px; font-size:23px;">
	                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
					  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
					</svg>
	                修改
             	</button>
	        <input id="i9sType" type="hidden" name="i9sType" value="${selectThis.i9sType}"/>
	        <input type="hidden" name="i9sPicture" value="${selectThis.i9sPicture}"/>
	        </td>
      	  </tr>
    </tbody>
  </table>
  
  <input type="hidden" name="i9sId" value="${selectThis.i9sId}">

  
  </div>
</form>  

<script type="text/javascript">

	$(function(){
		var i9stype = $("input[name='i9sType']").val();
		var type = [1,3,4];
		for(var i=0;i<type.length;i++){
			if(type[i]==i9stype){
				$("#type option[value="+i9stype+']').attr("selected","selected");
			}
		}
	});
	
	$("#type").change(function(){
		var state = $("#type option:selected").val();
		$("#i9sType").val(state);
		var state1 = $("#i9sType").val();
	})
	
	$("#i9sUpdate").click(function(){
		var id = $('input[name="i9sId"]').val();
		var name = $('input[name="i9sName"]').val();
		var unit = $('input[name="unit"]').val();
		var i9stype = $("input[name='i9sType']").val();
		if(name=="" || name.split(' ').join('')=="" || unit=="" || unit.split(' ').join('')==""){
				alert("修改資料有誤，請重新確認輸入");
				window.location.reload();
		}else {
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/pages/i9sDate',
				data:$('#i9sform').serialize(),
				success:function(data){
					alert("修改品項成功");
					window.location.href="${pageContext.request.contextPath}/pages/type"+i9stype;
				},
				error:function(data){
					alert("請確認< 熱量、金額、類別 >是否為數字");
				}
			})
		}
	})
</script>
  
</body>
</html>