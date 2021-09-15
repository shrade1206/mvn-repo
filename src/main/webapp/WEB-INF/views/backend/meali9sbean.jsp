<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>鍋奉行後台</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	.sidebar a {
		float: left;
	}
	div.content {
		margin-left: 0;
	}
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

table{
	border-collapse: separate;
	border-spacing:0;
}

table th {
	text-align: center;
	border-color:white;
}

.i9sinput {
	display: none;
}

.icon {
	width: 40px;
}

.divimg {
	text-align: center;
	width: 200px;
	height: 200px;
	position: relative;
	margin: 30px;
	transition:0.2s;
	box-shadow: 5px 5px 15px 5px rgba(0,0,0,0.7);
}

.divimg:hover{
	transform: scale(1.05);
}

.divimg:active{
	transform: scale(1.03);
}

.imgtest {
	width: 200px;
	height: 150px;
}

.divimg .img {
	width: 100%;
	height: 170px;
	opacity: 0.85;
	transition: 0.2s;
	object-fit:contain;
}

.img:hover {
	opacity: 1;
}

.checkbox{
	position: absolute;
	top: 3%;
	right: 75%;
	display: none;
}

#tttt2,#tttt1 {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.text{
	background-color: #04AA6D;
	font-size: 20px;
}

button{
	box-shadow: 5px 5px 5px 1px rgba(0,0,0,0.7);
}

h3{
	margin: auto;
}

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

	<div class="content">
		<table class="table" rules=cols>
			<thead class="thead-dark">
				<tr>
					<th style="vertical-align:middle;border:0;width: 50%"><h3>${setMealBean.name}：現有食材</h3></th>
					<th style="vertical-align:middle;border:0;width: 50%"><h3>可選食材</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<td style="border-top-style:none; border-left-style:none;" >
					<button id="prepage" type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/backend/selectAllMeal.controller'" style="width:160px;height:64px; font-size:23px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"></path>
						</svg>
						上一頁
              		</button>&emsp;
		
						<button type="button" id="delcancel" class="btn btn-secondary" style="width:160px;height:64px; font-size:23px;">
					    	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-backspace-fill" viewBox="0 0 16 16">
							  <path d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z"></path>
							</svg>
							取消勾選
		             	 </button>&emsp;
					
				  <button id="del" class="btn btn-outline-danger" style="width:160px;height:64px; font-size:23px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
						  	<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"></path>
						</svg>
		                刪除食材
	              </button>
				</td>
				<td style="border-top-style:none; border-left-style:none;border-right-style:none">

					<button id="add" type="button" class="btn btn-success" style="width:160px;height:64px; font-size:23px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
						  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
						  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
						</svg>
		                新增食材
	             	</button>&emsp;
				
					<button type="button" id="addcancel" class="btn btn-secondary" style="width:160px;height:64px; font-size:23px;">
				    	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-backspace-fill" viewBox="0 0 16 16">
						  <path d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z"></path>
						</svg>
						取消勾選
		            </button>&emsp;
				</td>
				</tr>
				<tr>
					<td style="border-top-style:none; border-left-style:none">
						<div id="tttt1">
						<c:forEach var="i9sbean" items="${mealList}">
							<div class="divimg">
								<label for="i9s${i9sbean.i9sId}"> 
								<img class="img"
									src="${pageContext.request.contextPath}/picture/${i9sbean.i9sPicture}">
									<div class="checkbox">
										<img class="icon" src="${pageContext.request.contextPath}/picture/icons5.png"
											alt=""> 
										<input id="i9s${i9sbean.i9sId}" class="i9sinput" type="checkbox" name="del" value="${i9sbean.i9sId}"/>
										
									</div>
								</label>
								<div class="text">
									<p>${i9sbean.i9sName}</p>
								</div>
							</div>
						</c:forEach>
						</div>
					</td>
					<td style="border-top-style:none; border-left-style:none;border-right-style:none" >
						<div id="tttt2">
						<c:forEach var="i9s" items="${type1}">
							<div class="divimg">
								<label for="i9s${i9s.i9sId}">
								<img class="img"
									src="${pageContext.request.contextPath}/picture/${i9s.i9sPicture}">
									<div class="checkbox">
										<img class="icon" src="${pageContext.request.contextPath}/picture/icons4.png"
											alt=""> 
										<input id="i9s${i9s.i9sId}" class="i9sinput" type="checkbox" name="add" value="${i9s.i9sId}"/>
									</div>
								</label>
								<div class="text">
									<p>${i9s.i9sName}</p>
								</div>
							</div>
						</c:forEach>
						<input class="hide" name="id" type="hidden" value="${setMealBean.id}" />
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
	
		$(function(){
			$("#addcancel").click(function(){
				$("input[name='add']:checked").each(function(){
					if ($(this).parent().is(':hidden')) {
						$(this).parent().fadeIn(150);
					} else {
						$(this).parent().fadeOut(150);
						$(this).prop("checked",false);
					}
				})
			})
			
			$("#delcancel").click(function(){
				$("input[name='del']:checked").each(function(){
					if ($(this).parent().is(':hidden')) {
						$(this).parent().fadeIn(150);
					} else {
						$(this).parent().fadeOut(150);
						$(this).prop("checked",false);
					}
				})
			})
		})
	
	
		$(".i9sinput").click(function() {
			if ($(this).parent().is(':hidden')) {
				$(this).parent().fadeIn(150);
			} else {
				$(this).parent().fadeOut(150);
			}
		})

		$("#add").click(function() {
			var i9sbeans = $("input[name='add']:checked").val([]);
			var id = $("input[name='id']").val();
			var ids = [];
			for (var i = 0; i < i9sbeans.length; i++) {
				ids.push(i9sbeans[i].value)
			}
			console.log(ids);
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/pages/addi9sformeal/'+id,
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify(ids),
				success : function(data) {
					alert("您新增了" + data + "筆食材");
					window.location.href = "${pageContext.request.contextPath}/pages/updateList/"+id;
				},
				error : function(data) {
					alert("新增失敗");
					window.location.href = "${pageContext.request.contextPath}/pages/updateList/"+id;
				}
			})
		})

		$("#del").click(function() {
			var i9sbeans = $("input[name='del']:checked").val([]);
			var id = $("input[name='id']").val();
			var ids = [];
			for (var i = 0; i < i9sbeans.length; i++) {
				ids.push(i9sbeans[i].value)
			}
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/pages/deletei9sformeal/'+id,
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify(ids),
				success : function(data) {
					alert("您刪除了" + data + "筆食材");
					window.location.href = "${pageContext.request.contextPath}/pages/updateList/"+id;
				},
				error : function(data) {
					alert("刪除失敗");
					window.location.href = "${pageContext.request.contextPath}/pages/updateList/"+id;
				}
			})
		})
	</script>


</body>
</html>