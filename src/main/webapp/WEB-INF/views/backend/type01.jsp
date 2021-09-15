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

/* ↓ 圖片設定 */
.Img {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
  width:200px;
}
.Img:hover {
  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}
span{
	overflow:hidden;
	width: 300px;
	height: 300px;
}
/* ↑ 圖片設定 */

/* ↓ table設定 */
table {
text-align: center;
background-color:#eee;
}
th,h3 {
align:center;
valign:center;
text-align: center;
margin:auto;
}
.mid {
text-align: center;
}
/* ↑ table設定 */

/* ↓ 分頁 */
.pagination {
justify-content: center;
align-items: center;
}
.container{
display: flex;        
justify-content: center; 
}
.two{
width: auto;
text-align:center
}
/* ↑ 分頁 */

#logo{
	width:200px;
	position:absolute;
	bottom:0;
}

thead tr th {
 position:sticky !important;
 top:0px;
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
	
	<table class="table">
    <thead class="thead-dark">
      <tr>
        <th style="vertical-align:middle; border:0;" class="col-2"><h3>名稱</h3></th>
        <th style="vertical-align:middle; border:0;" class="col-1"><h3>內容</h3></th>
        <th style="vertical-align:middle; border:0;" class="col-1"><h3>熱量</h3></th>
        <th style="vertical-align:middle; border:0;" class="col-1"><h3>金額</h3></th>
        <th style="vertical-align:middle; border:0;" class="col-1"><h3>類別</h3></th>
        <th style="vertical-align:middle; border:0;" class="col-2"><h3>圖片</h3></th>
        <th style="vertical-align:middle; border:0;padding:0;" class="col-2">
        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/backend/i9sInsert'" style="width:160px;height:64px; font-size:23px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-plus-fill" viewBox="0 0 16 16">
				  <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM8.5 7v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 1 0z"></path>
				</svg>
                新增品項
              </button>
        </th>
        <th style="vertical-align:middle; border:0;" class="col-2"></th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach var="i9s" items="${type.i9s}">
    	  <tr>
            <td style="vertical-align:middle;"><h4>${i9s.i9sName }</h4></td>
            <td class="mid" style="vertical-align:middle;"><h4>${i9s.unit }</h4></td>
            <td class="mid" style="vertical-align:middle;"><h4>${i9s.kcal } kcal</h4></td>
            <td class="mid" style="vertical-align:middle;"><h4>${i9s.i9sPrice } NT</h4></td>
            <td class="mid" style="vertical-align:middle;"><h4>${name}</h4></td>
        
            <td class="mid" style="vertical-align:middle;">
	            <img class="Img" src="${pageContext.request.contextPath}/picture/${i9s.i9sPicture}">
            </td>
            <td class="mid" style="vertical-align:middle;">
            
            <button  class="btn btn-outline-danger" name="${i9s.i9sName}" id="${i9s.i9sId}" style="width:160px;height:64px; font-size:23px;box-shadow: 5px 5px 5px 1px rgba(0,0,0,0.7);">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
				  	<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"></path>
				</svg>
                移除品項
              </button>
            </td>
            
            <td class="mid" style="vertical-align:middle;">
            	<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pages/i9sUpdate/${i9s.i9sId}'" style="width:160px;height:64px; font-size:23px;box-shadow: 5px 5px 5px 1px rgba(0,0,0,0.7);">
	                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
					  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
					</svg>
	                修改
             	</button>
            </td>
      	  </tr>
      	  
    </c:forEach>
    </tbody>
  </table>
  </div>
 


<script type="text/javascript">
	$("button[class='btn btn-outline-danger']").click(function(){
		var delId = $(this).attr('id');
		var name = $(this).attr('name');
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/pages/i9sDelete',
			data:{'i9sId':delId},
			success:function(data){
				alert("成功刪除:<"+name+">品項")
				window.location.reload();
			},
			error:function(data){
				alert("刪除失敗")
			}
		})
	})
</script>

</body>
</html>