<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>鍋奉行後台</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js"></script>

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
  padding: 0 15px;
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
.pagination {
	margin-left:30%;
}
.pagination>li.active > a {

}
.pagination a, .pagination a:hover {

}
.pagination a:focus {
	box-shadow: none !important;
    border-color: transparent !important;
}
.dropdown-toggle, .dropdown-toggle:hover {
	text-decoration: none;
	color: white;
}
#branch>a:focus{
    color: #262626!important;
    background-color: lightgray!important;
}
tr>td a {
	text-decoration: none;
}
tr>td a:hover {
	color:gray;
}
tr>.totalAmount {
	text-align:right !important;
	padding-right: 100px;
}
.row {
	text-align: center;
}
td{
	font-size: 20px;
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

.dropdown-toggle{
	font-size:30px;
}

thead tr th {
 height:80px;
}

h3{
margin-top:8px;
margin-bottom:0px;

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
	      <tr class="row">
	        <th style="vertical-align:middle; border:0;" class="col-1"><h3>訂單號碼</h3></th>
	        <th style="vertical-align:middle; border:0;" class="col-2"><h3>會員手機</h3></th>
	        <th style="vertical-align:middle; border:0;" class="col-2">
	        	<a class="dropdown-toggle" data-toggle="dropdown" href="javasacript:;">分店</a>
			    <div id="branch" class="dropdown-menu">
				    <a class="dropdown-item" href="${pageContext.servletContext.contextPath }/cms/orders/page/1?branch=台中北屯店">台中北屯店</a>
				    <a class="dropdown-item" href="${pageContext.servletContext.contextPath }/cms/orders/page/1?branch=台中龍井店">台中龍井店</a>
				    <a class="dropdown-item" href="${pageContext.servletContext.contextPath }/cms/orders/page/1?branch=彰化員林店">彰化員林店</a>
				    <a class="dropdown-item" href="${pageContext.servletContext.contextPath }/cms/orders/page/1?branch=彰化旗艦店">彰化旗艦店</a>
				    <a class="dropdown-item" href="${pageContext.servletContext.contextPath }/cms/orders/page/1?branch=嘉義西區店">嘉義西區店</a>
			    </div>
			</th>
	        <th style="vertical-align:middle; border:0;" class="col-3"><h3>取餐時間</h3></th>
	        <th style="vertical-align:middle; border:0;" class="col-2"><h3>金額</h3></th>
	        <th style="vertical-align:middle; border:0;" class="col-2"></th>
	      </tr>
	    </thead>
	    <tbody>
		<c:forEach var="order" items="${orderList }">
			<tr class="row orderlist">
		        <td class="col-1"><a href="${pageContext.servletContext.contextPath }/cms/orders/${order.id }">${order.id }</a></td>
		        <td class="col-2">${order.userMobile }</td>
		        <td class="col-2">${order.takeoutStore }</td>
		        <td class="col-3 orderDate">${order.orderDate }</td>
		        <td class="col-2 totalAmount">${order.totalAmount }</td>
		        <td class="col-2"><button class="delBtn btn btn-danger" id="/orders/${order.id }">Del</button></td>
		    </tr>
		</c:forEach>
		</tbody>
	</table>
	<ul class="pagination">
		<fmt:formatNumber type="number" var="prev" value="${currentPage<=10?1:Math.floor((currentPage-11)/10)*10 + 1}" maxFractionDigits="0" />
		<fmt:formatNumber type="number" var="next" value="${currentPage==totalPage?totalPage:Math.floor((currentPage+9)/10)*10 + 1}" maxFractionDigits="0" />
		<li class="page-item active">
		<a class="page-link" href='${pageContext.servletContext.contextPath }/cms/orders/page/${prev }${branch==null?"":"?branch="}${branch}'>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
			</svg>
		</a>
		</li>
		<c:forEach var="i" begin="${Math.floor((currentPage-1)/10)*10 + 1}" end="${Math.floor(((currentPage + 9)/10))*10>totalPage?totalPage:Math.floor(((currentPage + 9)/10))*10}">
		<li class="page-item"><a class="page-link" href='${pageContext.servletContext.contextPath }/cms/orders/page/${i}${branch==null?"":"?branch="}${branch}'>${i}</a></li>
		</c:forEach>
		<li class="page-item active"><a class="page-link" href='${pageContext.servletContext.contextPath }/cms/orders/page/${next>=totalPage?totalPage:next}${branch==null?"":"?branch="}${branch}'><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
	  			<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
			</svg></a></li>
	</ul>
	<script type="text/javascript">
		$(function() {
			for (let i=0; i<$(".pagination>.page-item").length; i++) {
				if($(".pagination>.page-item").eq(i).text()==${currentPage}) {
					$(".pagination>.page-item").eq(i).addClass("active");
				}
			}
			let orders = $(".orderlist").length;
			if (orders<10) {
				let addrows = 10 - orders;
				for (let i=0; i<addrows; i++) {
					$("tbody").append("<tr class='row addrows'></tr>");
					$(".addrows").css({
						"display": "block",
						"height": "63px"});
				}
			}
			// 更改日期格式
			 let orderLength = $(".orderDate").length;
			for (let i=0; i<orderLength; i++) {
				let orderDate = new Date($(".orderDate").eq(i).text());
				let formateDate = moment(orderDate).format("YYYY-MM-DD hh:mm");
				$(".orderDate").eq(i).text(formateDate);
			}
			// 金額加上會計格式
	    	let items = $(".totalAmount").length;
	    	for(let i=0; i<items; i++) {
		    	let total = $(".totalAmount").eq(i).text();
		    	total = total.split(/(?=(?:...)*$)/);
		    	total = total.join(",");
		    	$(".totalAmount").eq(i).text("$ "+total);
	    	}
			$(".delBtn").on("click", function() {
				endpoint = "/shabushabu" + $(this).prop("id");
				$.ajax({
					type: "delete",
					url: endpoint
				}).then(function(data) {
					window.location.reload();
				})
			})
		})
	</script>
</div>
</body>
</html>