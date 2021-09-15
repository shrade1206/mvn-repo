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
 
.sidebar a.active1 {
  background-color: #04AA6D;
  color: white;
}

.sidebar a:hover:not(.active1) {
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

.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 28px;
  transition: 0.4s;
  height:84px;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  background-color: white;
  overflow: hidden;
  max-height: 0;
  transition: max-height 0.2s ease-out;
}

.accordion:after {
  content: '\02795';
  font-size: 13px;
  color: #04AA6D;
  float: right;
  margin-left: 5px;
  margin-top: 16px;
}

.active:after {
  content: "\2796";
  margin-top: 16px;
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

table th, .mid{
	text-align: center;
	
}

p{
margin:0 auto;

}

.edit,input,.add,.changei9s{
	border:0;
	font: inherit;
	line-height: 1;
	margin: 0.5em;
	padding: 1em 2em;
	transition:0.2s;
	box-shadow: 5px 5px 5px 1px rgba(0,0,0,0.7);
}

.del{
	background: rgb(255, 0, 0,0.7);
	border:0;
	font: inherit;
	line-height: 1;
	margin: 0.5em;
	padding: 1em 2em;
	transition:0.2s;
	box-shadow: 5px 5px 5px 1px rgba(0,0,0,0.7);
	color:white;
}

.add{
	color:white;
	background:#04AA6D;
}

input:hover,
.accordion:hover{
	transform:scale(1.03);
}

#hotpoticon{
	margin-bottom:10px;
}

h3{
	margin: auto;
}

.add:hover,.del:hover,.edit:hover,.changei9s:hover{
	opacity:0.8;
}

#logo{
	width:200px;
	position:absolute;
	bottom:0;
}

thead tr th {
 position:sticky !important;
 top:0;
}

thead tr th{
 height:80px;
}

</style>
</head>
<body>
<div class="sidebar">
  <h1><a href="#home" class="active1">後台管理</a></h1>
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
	<table class="table">
	    <thead class="thead-dark">
	      <tr>
	        <th style="vertical-align:middle;border:0;" class="col-4"><h3>套餐名稱</h3></th>
	        <th style="vertical-align:middle;border:0;" class="col-2"><h3>套餐價格</h3></th>
	        <th style="vertical-align:middle;border:0;padding:0" class="col-3">
	        
		        <button type="button" class="btn btn-primary" name="${meal.name}" id="${meal.id}" onclick="location.href='${pageContext.request.contextPath}/backend/mealadd'"
			         style="width:160px;height:64px; font-size:23px;">
	                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
						  <path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"></path>
						  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"></path>
					</svg>
	                新增套餐
	             </button>
	        
	        </th>
	        <th style="vertical-align:middle;border:0;" class="col-3"></th>
	      </tr>
	    </thead>
	    <tbody>
		<c:forEach var="meal" items="${setMeal}" varStatus="status" >
		<c:set var="a" value="0"></c:set>
			<tr>
		        <td style="border-style:none"><button class="accordion" value="${meal.id}"><img id="hotpoticon" src="${pageContext.request.contextPath}/picture/hotpoticon.png"> ${meal.name}</button></td>
		        <td class="mid" style="vertical-align:middle;">${meal.price} NT</td>
		        <td class="mid">
		      <button  class="btn btn-outline-danger" name="${meal.name}" id="${meal.id}" style="width:160px;height:64px; font-size:23px;box-shadow: 5px 5px 5px 1px rgba(0,0,0,0.7);">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
				  	<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"></path>
				</svg>
                移除品項
              </button>
		        
		        </td>
		        <td>
		        
		          <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pages/selectThis/${meal.id}'" style="width:160px;height:64px; font-size:23px;box-shadow: 5px 5px 5px 1px rgba(0,0,0,0.7);">
	                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
					  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
					</svg>
	                修改
             	  </button>
             	  
		        </td>
		    </tr>
		    <tr>
		    	<td style="border-style:none">
			    	<div class="panel" id="panel${meal.id}">
			    		<ul>
			    			<c:forEach var="i9sbean" items="${i9sBeanList[status.index]}">
			    			<li>${i9sbean.i9sName}</li>
			    			</c:forEach>
			    			<li style="list-style-type:none">
			    			
							    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pages/updateList/${meal.id}'" style="width:160px;height:64px; font-size:23px; position:relative; left:-20px;box-shadow: 5px 5px 5px 1px rgba(0,0,0,0.7);">
					                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
									  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
									  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
									</svg>
					                食材調整
				             	</button>
			
			    			</li>
			    		</ul>
			   		</div>
		    	</td>
		    </tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript">
	$("[class='btn btn-outline-danger']").click(function(){
		var delId = $(this).attr('id');
		var name = $(this).attr('name');
		var r = confirm("確定要刪除此筆<"+name+">套餐資料嗎?");
		if(r==true){
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/pages/deleteMeal',
				data:{'id':delId},
				success:function(data){
					alert("成功刪除:<"+name+">套餐")
					window.location.reload();
				},
				error:function(data){
					alert("刪除失敗")
				}
			})
		}
	})
	
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		console.log(i);
	  	acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var id = this.value;
	    console.log(id);
	    var panel = document.getElementById("panel"+id);
	    console.log(panel);
	    
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    }
	    
	  });
	}

</script>

</body>
</html>